#include "planningpresenterimpl.h"
#include "popupspresenterimpl.h"
#include <QQuickItem>

PlanningPresenterImpl::PlanningPresenterImpl(PopupsPresenterImpl *popupsPresenter)
    : ZetaSurgical::PlanningPresenter()
    , m_popupsPresenter(popupsPresenter)
{
    Q_ASSERT(m_popupsPresenter);
    qWarning() << __PRETTY_FUNCTION__;
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

void PlanningPresenterImpl::setVTKItem(QObject *item)
{
    qWarning() << __PRETTY_FUNCTION__ << item;
    auto const vtk = qobject_cast<QQuickItem*>(item);
    if(!vtk) {
        qWarning() << "Can not cast to QQuickItem";
        return;
    }
    vtk->setProperty("color", QColor("yellow"));
}
