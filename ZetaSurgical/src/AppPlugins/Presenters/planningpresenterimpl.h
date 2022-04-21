#pragma once

#include <ZetaSurgical/planningpresenter.hpp>

class PopupsPresenterImpl;
class PointEditorPresenterImpl;

namespace ZetaSurgical {
class GUINavigationPresenter;
}

class PlanningPresenterImpl : public ZetaSurgical::PlanningPresenter
{
    Q_OBJECT
public:
    explicit PlanningPresenterImpl(PopupsPresenterImpl *popupsPresenter,
                                   PointEditorPresenterImpl* pointEditor,
                                   ZetaSurgical::GUINavigationPresenter *);
    void editTargetAtIndex(int index) override;
    void deleteTargetAtIndex(int index) override;
    void selectTargetAtIndex(int index, int selectionMode) override;

    void selectInstrumentAtIndex(int index, int selectionMode) override;
    void deleteInstrumentAtIndex(int index) override;

    void onAddNewPointClicked() override;

    void onPlanningStarted() override;
    void onPlanningFinished() override;

    Q_INVOKABLE void setVTKItem(QObject *item, int index);

protected:
    void init() override;

private:
    void updateProceedButton();
    void deselectAll(GreenHouse::Model * model);

private:
    PopupsPresenterImpl * const m_popupsPresenter;
    PointEditorPresenterImpl* const m_pointEditor;
    ZetaSurgical::GUINavigationPresenter *const m_navigationPresenter;
};
