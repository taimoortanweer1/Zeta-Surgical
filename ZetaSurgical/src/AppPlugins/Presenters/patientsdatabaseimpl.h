#pragma once

#include <ZetaSurgical/patientsdatabase.hpp>

class PatientsModel;
class PatientsFilterModel;
class PopupsPresenterImpl;

class PatientsDatabaseImpl : public ZetaSurgical::PatientsDatabase
{
    Q_OBJECT
public:
    explicit PatientsDatabaseImpl(PopupsPresenterImpl *popupsPresenter);
    void init() override;
    void onFilterEditRequested() override;

private:
    PatientsModel * const m_patientsModel;
    PatientsFilterModel * const m_filterModel;
    PopupsPresenterImpl * const m_popupsPresenter;
};
