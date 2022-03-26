#pragma once

#include <ZetaSurgical/patientsdatabase.hpp>

class PatientsModel;
class PatientsFilterModel;

class PatientsDatabaseImpl : public ZetaSurgical::PatientsDatabase
{
    Q_OBJECT
public:
    explicit PatientsDatabaseImpl();
    void init() override;
    void onFilterStringChanged(QString const &filter) override;

private:
    PatientsModel * const m_patientsModel;
    PatientsFilterModel * const m_filterModel;
};
