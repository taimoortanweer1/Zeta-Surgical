#include "patientsdatabaseimpl.h"
#include "patientsmodel.h"
#include "popupspresenterimpl.h"

PatientsDatabaseImpl::PatientsDatabaseImpl(PopupsPresenterImpl *popupsPresenter)
    : ZetaSurgical::PatientsDatabase()
    , m_popupsPresenter(popupsPresenter)
    , m_patientsModel(new PatientsModel(this))
    , m_filterModel(new SortFilterModel(this))

    , m_studiesList(new StudiesList(this))
    , m_studiesFilterModel(new SortFilterModel(this))

    , m_studyDescriptionList(new StudyDescriptionList(this))
    , m_studiesDescriptionFilterModel(new SortFilterModel(this))
{
    Q_ASSERT(m_popupsPresenter);
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
    emit patientSelected();
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
    setSelectedSourceIndex(index);
}

void PatientsDatabaseImpl::onShowPatientsList()
{
    onSelectStorageSource(StorageSource::Local);
}

void PatientsDatabaseImpl::sortPatientListBy(int headerEntry)
{
    auto role = static_cast<PatientsModel::Roles>(headerEntry + Qt::UserRole + 1);
    if(role == PatientsModel::Date)
        role = PatientsModel::RawDate;
    if(role == PatientsModel::DOB)
        role = PatientsModel::RawDOB;
    m_filterModel->sortByRole(role);
}

void PatientsDatabaseImpl::sortStudiesListBy(int headerEntry)
{
    auto role = static_cast<StudiesList::Roles>(headerEntry + Qt::UserRole + 1);
    m_studiesFilterModel->sortByRole(role);
}

void PatientsDatabaseImpl::sortStudiesDescriptionListBy(int headerEntry)
{
    auto role = static_cast<StudyDescriptionList::Roles>(headerEntry + Qt::UserRole + 1);
    m_studiesDescriptionFilterModel->sortByRole(role);
}
