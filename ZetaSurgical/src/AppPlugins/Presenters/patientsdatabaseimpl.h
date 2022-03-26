#pragma once

#include <ZetaSurgical/patientsdatabase.hpp>

class PatientsModel;

class PatientsDatabaseImpl : public ZetaSurgical::PatientsDatabase
{
    Q_OBJECT
public:
    explicit PatientsDatabaseImpl();
    void init() override;

private:
    PatientsModel * const m_patientsModel;
};
