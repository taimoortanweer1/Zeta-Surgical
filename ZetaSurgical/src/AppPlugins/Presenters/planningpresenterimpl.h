#pragma once

#include <ZetaSurgical/planningpresenter.hpp>

class PopupsPresenterImpl;

class PlanningPresenterImpl : public ZetaSurgical::PlanningPresenter
{
    Q_OBJECT
public:
    explicit PlanningPresenterImpl(PopupsPresenterImpl *popupsPresenter);
    void editTargetAtIndex(int index) override;
    void deleteTargetAtIndex(int index) override;
    void selectTargetAtIndex(int index) override;

    void selectInstrumentAtIndex(int index) override;
    void deleteInstrumentAtIndex(int index) override;

private:
    PopupsPresenterImpl * const m_popupsPresenter;
};
