#include "patientsdatabaseimpl.h"
#include "patientsmodel.h"
#include "popupspresenterimpl.h"
#include <ZetaSurgical/guinavigationpresenter.hpp>

PatientsDatabaseImpl::PatientsDatabaseImpl(PopupsPresenterImpl *popupsPresenter, ZetaSurgical::GUINavigationPresenter* navigationPresenter)
    : ZetaSurgical::PatientsDatabase()
    , m_popupsPresenter(popupsPresenter)
    , m_navigationPresenter(navigationPresenter)
    , m_patientsModel(new PatientsModel(this))
    , m_filterModel(new SortFilterModel(this))

    , m_studiesList(new StudiesList(this))
    , m_studiesFilterModel(new SortFilterModel(this))

    , m_studyDescriptionList(new StudyDescriptionList(this))
    , m_studiesDescriptionFilterModel(new SortFilterModel(this))

    , m_patientsListHeaderModel(new ListHeaderModel({ {QStringLiteral("Name"), 352, -1, PatientsModel::Name },
                                                      {QStringLiteral("MRN"), 288, -1, PatientsModel::MRN },
                                                      {QStringLiteral("DOB"), 192, -1, PatientsModel::DOB },
                                                      {QStringLiteral("Sex"), 128, -1, PatientsModel::Sex },
                                                      {QStringLiteral("Studies"), 160, -1, PatientsModel::Studies },
                                                      {QStringLiteral("SessionID"), 288, -1, PatientsModel::SessionID },
                                                      {QStringLiteral("Date"), 248, -1, PatientsModel::Date } }, this))
    , m_studyListHeaderModel(new ListHeaderModel({ {QStringLiteral("Study Date"), 192, -1, StudiesList::StudyDate },
                                                      {QStringLiteral("Study ID"), 288, -1, StudiesList::ID },
                                                      {QStringLiteral("Study Description"), 383, -1, StudiesList::Description },
                                                      {QStringLiteral("#of Series"), 167, -1, StudiesList::NOS },
                                                      {QStringLiteral("Date"), 200, -1, StudiesList::Date } }, this))
    , m_studyDescriptionListHeaderModel(new ListHeaderModel({ {QStringLiteral("Series"), 160, -1, StudyDescriptionList::Series },
                                                      {QStringLiteral("Study Description"), 415, -1, StudyDescriptionList::Description },
                                                      {QStringLiteral("Modality"), 159, -1, StudyDescriptionList::Modality },
                                                      {QStringLiteral("Size"), 160, -1, StudyDescriptionList::Size },
                                                      {QStringLiteral("Count"), 136, -1, StudyDescriptionList::Count },
                                                      {QStringLiteral("Date Added"), 200, -1, StudyDescriptionList::Date } }, this))
{
    Q_ASSERT(m_popupsPresenter);
    Q_ASSERT(m_navigationPresenter);
    m_filterModel->setSourceModel(m_patientsModel);
    m_studiesFilterModel->setSourceModel(m_studiesList);
    m_studiesDescriptionFilterModel->setSourceModel(m_studyDescriptionList);
}

void PatientsDatabaseImpl::init()
{
    QStringList const names = {
        QStringLiteral("Michael"),
        QStringLiteral("Christopher"),
        QStringLiteral("Jessica"),
        QStringLiteral("Matthew"),
        QStringLiteral("Ashley"),
        QStringLiteral("Jennifer"),
        QStringLiteral("Joshua"),
        QStringLiteral("Amanda"),
        QStringLiteral("Daniel"),
        QStringLiteral("David"),
        QStringLiteral("James"),
        QStringLiteral("Robert"),
        QStringLiteral("John"),
        QStringLiteral("Joseph"),
        QStringLiteral("Andrew"),
        QStringLiteral("Ryan"),
        QStringLiteral("Brandon"),
        QStringLiteral("Jason"),
        QStringLiteral("Justin"),
        QStringLiteral("Sarah"),
        QStringLiteral("William"),
        QStringLiteral("Jonathan"),
        QStringLiteral("Stephanie"),
        QStringLiteral("Brian"),
        QStringLiteral("Nicole")
    };
    int ind = 0;
    for(auto const &entry : names) {
        ++ind;
        auto patient = Patient {
            entry,
                QStringLiteral("439048348"),
                QDate::currentDate(),
                QStringLiteral("M"),
                QStringLiteral("%1").arg(ind),
                QStringLiteral("BWH-35223%1").arg(ind),
                QDate::currentDate() };
        m_patientsModel->addPatient(patient);
    }
    setPatientsList(m_filterModel);

    for(int i = 0; i < 10; ++i) {
        m_studiesList->addStudy(StudyData {QDate::currentDate(), 10 - i, QStringLiteral("Description"), 5 + i, QDate::currentDate()});
    }
    setStudiesList(m_studiesFilterModel);

    for(int i = 0; i < 10; ++i) {
        m_studyDescriptionList->addStudyDescription(StudyDescriptionData {i+1, QStringLiteral("Description"), QStringLiteral("MRI"), QStringLiteral("512x512"), 5 + i, QDate::currentDate()});
    }
    setStudiesDescriptionList(m_studiesDescriptionFilterModel);

    setSelectedViewString(viewsModel()->dataAt(0)[QStringLiteral("valueRole")].toString());

    setPatientsListHeader(m_patientsListHeaderModel);
    setStudiesDescriptionListHeader(m_studyDescriptionListHeaderModel);
    setStudiesListHeader(m_studyListHeaderModel);
}

void PatientsDatabaseImpl::onFilterEditRequested()
{
    m_popupsPresenter->startFilterInput([this](QString const &text){
        setFilterString(text);
        m_filterModel->setFilterString(text);
    });
}

void PatientsDatabaseImpl::onProceedToStudySelection()
{
    setCdUsbSourceAvailable(cdUsbSourceSelected());
    setPacsSourceAvailable(pacsSourceSelected());
    setLocalSourceAvailable(localSourceSelected());

    setStudiesDescriptionSelectedIndex(-1);
    setStudiesListSelectedIndex(-1);
    setStudyIsSelected(false);
    updateProceedButton();

    emit m_navigationPresenter->selectStudyScreenShown();
}

void PatientsDatabaseImpl::selectPatient(int index)
{
    setSelectedPatientIndex(index);
    setSelectedPatientNameString(m_filterModel->getData(index, PatientsModel::Name).toString());
    setSelectedPatientDOBString(m_filterModel->getData(index, PatientsModel::DOB).toString());
    setSelectedPatientMRNString(m_filterModel->getData(index, PatientsModel::MRN).toString());
    setPatientIsSelected(index >= 0 );
}

void PatientsDatabaseImpl::viewSelected(const QVariant &value, int index)
{
    Q_UNUSED(index);
    setSelectedViewString(value.toString());
}

void PatientsDatabaseImpl::previewZoomSliderMoved(int value)
{
    qWarning() << value;
}

void PatientsDatabaseImpl::onSelectStorageSource(int index)
{
    setLocalSourceSelected(index == StorageSource::Local);
    setPacsSourceSelected(index == StorageSource::PACS);
    setCdUsbSourceSelected(index == StorageSource::CDUSB);
}

void PatientsDatabaseImpl::onShowPatientsList()
{
    setCdUsbSourceAvailable(true);
    setPacsSourceAvailable(true);
    setLocalSourceAvailable(true);
    onSelectStorageSource(StorageSource::Local);
    m_navigationPresenter->setTabIndex(0);
}

void PatientsDatabaseImpl::sortPatientListBy(int headerEntry)
{
    auto role = static_cast<PatientsModel::Roles>(headerEntry);
    if(role == PatientsModel::Date)
        role = PatientsModel::RawDate;
    if(role == PatientsModel::DOB)
        role = PatientsModel::RawDOB;
    m_patientsListHeaderModel->toggleSortRole(headerEntry);
    auto const &sortOrder = static_cast<Qt::SortOrder>(m_patientsListHeaderModel->sortOrderForHeaderEntry(headerEntry));
    m_filterModel->sortByRole(role, sortOrder);
}

void PatientsDatabaseImpl::sortStudiesListBy(int headerEntry)
{
    auto role = static_cast<StudiesList::Roles>(headerEntry);
    m_studyListHeaderModel->toggleSortRole(headerEntry);
    auto const &sortOrder = static_cast<Qt::SortOrder>(m_studyListHeaderModel->sortOrderForHeaderEntry(headerEntry));
    m_studiesFilterModel->sortByRole(role, sortOrder);
}

void PatientsDatabaseImpl::sortStudiesDescriptionListBy(int headerEntry)
{
    auto role = static_cast<StudyDescriptionList::Roles>(headerEntry);
    m_studyDescriptionListHeaderModel->toggleSortRole(headerEntry);
    auto const &sortOrder = static_cast<Qt::SortOrder>(m_studyDescriptionListHeaderModel->sortOrderForHeaderEntry(headerEntry));
    m_studiesDescriptionFilterModel->sortByRole(role, sortOrder);
}

void PatientsDatabaseImpl::setStudiesDescriptionSelectedIndex(int value, bool publishToRPC)
{
    PatientsDatabase::setStudiesDescriptionSelectedIndex(value, publishToRPC);
    updateProceedButton();
}

void PatientsDatabaseImpl::setStudiesListSelectedIndex(int value, bool publishToRPC)
{
    PatientsDatabase::setStudiesListSelectedIndex(value, publishToRPC);
    setStudyIsSelected(value >= 0);
    updateProceedButton();
}

void PatientsDatabaseImpl::onInfoButtonClicked()
{
    emit scanMetadataPopupShown();
}

void PatientsDatabaseImpl::onCompleteUploadStage()
{
    //qWarning() << __PRETTY_FUNCTION__;
    m_navigationPresenter->setUploadCompleted(true);
}

void PatientsDatabaseImpl::updateProceedButton()
{
    setProceedToSegmentationButtonEnabled(studiesListSelectedIndex() >= 0 && studiesDescriptionSelectedIndex() >= 0);
}
