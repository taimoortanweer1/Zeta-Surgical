#pragma once

#include <ZetaSurgical/planningpresenter.hpp>

class PlanningPresenterImpl : public ZetaSurgical::PlanningPresenter
{
    Q_OBJECT
public:
    explicit PlanningPresenterImpl();
    void editTargetAtIndex(int index);
    void deleteTargetAtIndex(int index);
    void selectTargetAtIndex(int index);
};
