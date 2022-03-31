#include "planningpresenterimpl.h"
#include "popupspresenterimpl.h"
#include "pointeditorpresenterimpl.h"
#include <QQuickItem>

PlanningPresenterImpl::PlanningPresenterImpl(PopupsPresenterImpl *popupsPresenter, PointEditorPresenterImpl* pointEditor)
    : ZetaSurgical::PlanningPresenter()
    , m_popupsPresenter(popupsPresenter)
    , m_pointEditor(pointEditor)
{
    Q_ASSERT(m_popupsPresenter);
    Q_ASSERT(m_pointEditor);
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

void PlanningPresenterImpl::onAddNewPointClicked()
{
    m_pointEditor->addNewPoint([this](Point const &point){
        QJsonObject obj;
        obj[QStringLiteral("text")] = QStringLiteral("%1").arg(point.x);
        obj[QStringLiteral("index")] = targetsList()->rowCount();
        targetsList()->appendRow(obj);
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
