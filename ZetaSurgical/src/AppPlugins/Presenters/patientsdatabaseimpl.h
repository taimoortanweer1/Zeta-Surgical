#pragma once

#include <ZetaSurgical/patientsdatabase.hpp>

class PatientsModel;
class StudiesList;
class SortFilterModel;
class PopupsPresenterImpl;
class StudyDescriptionList;
class ListHeaderModel;

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
    void sortPatientListBy(int headerEntry) override;
    void sortStudiesListBy(int headerEntry) override;
    void sortStudiesDescriptionListBy(int headerEntry) override;

    void setStudiesDescriptionSelectedIndex(int value, bool publishToRPC = true) override;
    void setStudiesListSelectedIndex(int value, bool publishToRPC = true) override;

    void onInfoButtonClicked() override;

private:
    void updateProceedButton();

private:
    PopupsPresenterImpl * const m_popupsPresenter;

    PatientsModel * const m_patientsModel;
    SortFilterModel * const m_filterModel;

    StudiesList *const m_studiesList;
    SortFilterModel * const m_studiesFilterModel;

    StudyDescriptionList * const m_studyDescriptionList;
    SortFilterModel * const m_studiesDescriptionFilterModel;

    ListHeaderModel * const m_patientsListHeaderModel;
    ListHeaderModel * const m_studyListHeaderModel;
    ListHeaderModel * const m_studyDescriptionListHeaderModel;
};
