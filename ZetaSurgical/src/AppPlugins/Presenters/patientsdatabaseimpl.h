#pragma once

#include <ZetaSurgical/patientsdatabase.hpp>

class PatientsModel;
class StudiesList;
class PatientsFilterModel;
class PopupsPresenterImpl;
class StudyDescriptionList;

class PatientsDatabaseImpl : public ZetaSurgical::PatientsDatabase
{
    Q_OBJECT
public:
    explicit PatientsDatabaseImpl(PopupsPresenterImpl *popupsPresenter);
    void init() override;
    void onFilterEditRequested() override;
    void onProceedToStudySelection() override;
    void selectPatient(int index) override;
    void viewSelected(const QVariant &value, int index) override;
    void previewZoomSliderMoved(int value) override;
    void onSelectStorageSource(int index) override;
    void onShowPatientsList() override;

private:
    PatientsModel * const m_patientsModel;
    PatientsFilterModel * const m_filterModel;
    StudiesList *const m_studiesList;
    PopupsPresenterImpl * const m_popupsPresenter;
    StudyDescriptionList * const m_studyDescriptionList;
};
