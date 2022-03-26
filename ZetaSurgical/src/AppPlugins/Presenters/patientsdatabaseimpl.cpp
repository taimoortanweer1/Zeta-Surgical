#include "patientsdatabaseimpl.h"
#include "patientsmodel.h"

PatientsDatabaseImpl::PatientsDatabaseImpl()
    : ZetaSurgical::PatientsDatabase()
    , m_patientsModel(new PatientsModel(this))
{}

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
    setPatientsList(m_patientsModel);
}
