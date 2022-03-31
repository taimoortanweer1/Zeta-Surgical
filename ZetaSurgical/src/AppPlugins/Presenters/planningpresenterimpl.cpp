#include "planningpresenterimpl.h"
#include "popupspresenterimpl.h"
#include <QQuickItem>

PlanningPresenterImpl::PlanningPresenterImpl(PopupsPresenterImpl *popupsPresenter)
    : ZetaSurgical::PlanningPresenter()
    , m_popupsPresenter(popupsPresenter)
{
    Q_ASSERT(m_popupsPresenter);
}

void PlanningPresenterImpl::editTargetAtIndex(int index)
{
}

void PlanningPresenterImpl::deleteTargetAtIndex(int index)
{
    m_popupsPresenter->confirmPointRemoval([this, index](){
        targetsList()->removeRow(index);
    });
}

void PlanningPresenterImpl::selectTargetAtIndex(int index)
{
    setSelectedTargetIndex(index);
}

void PlanningPresenterImpl::selectInstrumentAtIndex(int index)
{
    setSelectedInstrumentIndex(index);
}

void PlanningPresenterImpl::deleteInstrumentAtIndex(int index)
{
    m_popupsPresenter->confirmInstrumentRemoval([this, index](){
        instrumentsList()->removeRow(index);
    });

}

void PlanningPresenterImpl::setVTKItem(QObject *item)
{
    auto const vtk = qobject_cast<QQuickItem*>(item);
    if(!vtk) {
        qWarning() << "Can not cast to QQuickItem";
        return;
    }
    vtk->setProperty("color", QColor("yellow"));
}
