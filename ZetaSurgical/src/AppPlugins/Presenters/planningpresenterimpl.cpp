#include "planningpresenterimpl.h"

PlanningPresenterImpl::PlanningPresenterImpl()
    : ZetaSurgical::PlanningPresenter()
{}

void PlanningPresenterImpl::editTargetAtIndex(int index)
{
    qWarning() << __PRETTY_FUNCTION__ << index;
}

void PlanningPresenterImpl::deleteTargetAtIndex(int index)
{
    qWarning() << __PRETTY_FUNCTION__ << index;
}

void PlanningPresenterImpl::selectTargetAtIndex(int index)
{
    setSelectedTargetIndex(index);
}

