#include "planningpresenterimpl.h"
#include "popupspresenterimpl.h"

PlanningPresenterImpl::PlanningPresenterImpl(PopupsPresenterImpl *popupsPresenter)
    : ZetaSurgical::PlanningPresenter()
    , m_popupsPresenter(popupsPresenter)
{
    Q_ASSERT(m_popupsPresenter);
}

void PlanningPresenterImpl::editTargetAtIndex(int index)
{
    qWarning() << __PRETTY_FUNCTION__ << index;
}

void PlanningPresenterImpl::deleteTargetAtIndex(int index)
{
    qWarning() << __PRETTY_FUNCTION__ << index;
    m_popupsPresenter->confirmPointRemoval([this, index](){
        targetsList()->removeRow(index);
    });
}

void PlanningPresenterImpl::selectTargetAtIndex(int index)
{
    qWarning() << __PRETTY_FUNCTION__ << index;
    setSelectedTargetIndex(index);
}

void PlanningPresenterImpl::selectInstrumentAtIndex(int index)
{
    qWarning() << __PRETTY_FUNCTION__ << index;
    setSelectedInstrumentIndex(index);
}

void PlanningPresenterImpl::deleteInstrumentAtIndex(int index)
{
    qWarning() << __PRETTY_FUNCTION__ << index;
    m_popupsPresenter->confirmInstrumentRemoval([this, index](){
        instrumentsList()->removeRow(index);
    });

}
