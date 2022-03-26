#include "patientsdatabaseimpl.h"
#include "patientsmodel.h"

PatientsDatabaseImpl::PatientsDatabaseImpl()
    : ZetaSurgical::PatientsDatabase()
    , m_patientsModel(new PatientsModel(this))
{}

void PatientsDatabaseImpl::init()
{
    for(int i = 0; i < 25; ++i) {
        auto patient = Patient {
                QStringLiteral("John Doe"),
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
