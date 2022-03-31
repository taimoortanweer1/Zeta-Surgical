#include "patientsdatabaseimpl.h"
#include "patientsmodel.h"
#include "popupspresenterimpl.h"

PatientsDatabaseImpl::PatientsDatabaseImpl(PopupsPresenterImpl *popupsPresenter)
    : ZetaSurgical::PatientsDatabase()
    , m_patientsModel(new PatientsModel(this))
    , m_filterModel(new PatientsFilterModel(this))
    , m_studiesList(new StudiesList(this))
    , m_popupsPresenter(popupsPresenter)
    , m_studyDescriptionList(new StudyDescriptionList(this))
{
    Q_ASSERT(m_popupsPresenter);
    m_filterModel->setSourceModel(m_patientsModel);
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
    for(auto const &entry : names) {
        auto patient = Patient {
            entry,
                QStringLiteral("439048348"),
                QDate::currentDate(),
                QStringLiteral("M"),
                QStringLiteral("3"),
                QStringLiteral("BWH-35223"),
                QDate::currentDate() };
        m_patientsModel->addPatient(patient);
    }
    setPatientsList(m_filterModel);

    for(int i = 0; i < 10; ++i) {
        m_studiesList->addStudy(StudyData {QDate::currentDate(), i, QStringLiteral("Description"), 5, QDate::currentDate()});
    }
    setStudiesList(m_studiesList);

    for(int i = 0; i < 10; ++i) {
        m_studyDescriptionList->addStudyDescription(StudyDescriptionData {1, QStringLiteral("Description"), QStringLiteral("MRI"), QStringLiteral("512x512"), 5, QDate::currentDate()});
    }
    setStudiesDescriptionList(m_studyDescriptionList);

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
}

void PatientsDatabaseImpl::viewSelected(const QVariant &value, int index)
{
    setSelectedViewString(value.toString());
}

void PatientsDatabaseImpl::previewZoomSliderMoved(int value)
{
    qWarning() << value;
}
