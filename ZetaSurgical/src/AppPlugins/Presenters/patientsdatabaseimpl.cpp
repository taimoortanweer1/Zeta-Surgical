#include "patientsdatabaseimpl.h"
#include "patientsmodel.h"
#include "popupspresenterimpl.h"

PatientsDatabaseImpl::PatientsDatabaseImpl(PopupsPresenterImpl *popupsPresenter)
    : ZetaSurgical::PatientsDatabase()
    , m_patientsModel(new PatientsModel(this))
    , m_filterModel(new PatientsFilterModel(this))
    , m_popupsPresenter(popupsPresenter)
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
}

void PatientsDatabaseImpl::onFilterEditRequested()
{
    m_popupsPresenter->startFilterInput([this](QString const &text){
        setFilterString(text);
        m_filterModel->setFilterString(text);
    });
}
