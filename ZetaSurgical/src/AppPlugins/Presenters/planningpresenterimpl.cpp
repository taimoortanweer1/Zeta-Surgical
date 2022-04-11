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
    qWarning() << __PRETTY_FUNCTION__ << index;
    if(index < 0 || index >= targetsList()->rowCount())
        return;
    QJsonObject pointEntry = targetsList()->dataAt(index);
    Point point;
    point.x = pointEntry[QStringLiteral("x")].toDouble();
    point.y = pointEntry[QStringLiteral("y")].toDouble();
    point.z = pointEntry[QStringLiteral("z")].toDouble();

    m_pointEditor->editPoint(point, [this, index](Point const &point){
        QJsonObject obj;
        obj[QStringLiteral("text")] = QStringLiteral("%1").arg(point.x);
        obj[QStringLiteral("index")] = index;
        obj[QStringLiteral("x")] = point.x;
        obj[QStringLiteral("y")] = point.y;
        obj[QStringLiteral("z")] = point.z;
        targetsList()->setRowData(index, obj);
    });
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

void PlanningPresenterImpl::setVTKItem(QObject *item, int index)
{
    auto const vtk = qobject_cast<QQuickItem*>(item);
    if(!vtk) {
        qWarning() << "Can not cast to QQuickItem";
        return;
    }
    vtk->setProperty("color", QColor("yellow"));
}
