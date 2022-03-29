#pragma once

#include <ZetaSurgical/patientsdatabase.hpp>

class PatientsModel;
class StudiesList;
class PatientsFilterModel;
class PopupsPresenterImpl;

class PatientsDatabaseImpl : public ZetaSurgical::PatientsDatabase
{
    Q_OBJECT
public:
    explicit PatientsDatabaseImpl(PopupsPresenterImpl *popupsPresenter);
    void init() override;
    void onFilterEditRequested() override;
    void selectPatient(int index) override;

private:
    PatientsModel * const m_patientsModel;
    PatientsFilterModel * const m_filterModel;
    StudiesList *const m_studiesList;
    PopupsPresenterImpl * const m_popupsPresenter;
};
