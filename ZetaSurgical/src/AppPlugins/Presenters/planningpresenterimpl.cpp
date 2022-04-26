#include "planningpresenterimpl.h"
#include "popupspresenterimpl.h"
#include "pointeditorpresenterimpl.h"
#include <QQuickItem>
#include <ZetaSurgical/guinavigationpresenter.hpp>

PlanningPresenterImpl::PlanningPresenterImpl(PopupsPresenterImpl *popupsPresenter,
                                             PointEditorPresenterImpl* pointEditor,
                                             ZetaSurgical::GUINavigationPresenter *navPresenter)
    : ZetaSurgical::PlanningPresenter()
    , m_popupsPresenter(popupsPresenter)
    , m_pointEditor(pointEditor)
    , m_navigationPresenter(navPresenter)
{
    Q_ASSERT(m_navigationPresenter);
    Q_ASSERT(m_popupsPresenter);
    Q_ASSERT(m_pointEditor);
}

void PlanningPresenterImpl::editTargetAtIndex(int index)
{
    //qWarning() << __PRETTY_FUNCTION__ << index;
    if(index < 0 || index >= targetsList()->rowCount())
        return;
    QJsonObject pointEntry = targetsList()->dataAt(index);
    bool const isSelected = pointEntry[QStringLiteral("selected")].toBool();
    Point point;
    point.name = pointEntry[QStringLiteral("text")].toString();
    point.x = pointEntry[QStringLiteral("x")].toDouble();
    point.y = pointEntry[QStringLiteral("y")].toDouble();
    point.z = pointEntry[QStringLiteral("z")].toDouble();

    m_pointEditor->editPoint(point, [this, index, isSelected](Point const &point){
        QJsonObject obj;
        obj[QStringLiteral("text")] = QStringLiteral("%1").arg(point.name);
        obj[QStringLiteral("x")] = point.x;
        obj[QStringLiteral("y")] = point.y;
        obj[QStringLiteral("z")] = point.z;
        obj[QStringLiteral("selected")] = isSelected;
        targetsList()->setRowData(index, obj);
    });
}

void PlanningPresenterImpl::deleteTargetAtIndex(int index)
{
    m_popupsPresenter->confirmPointRemoval([this, index](){
        targetsList()->removeRow(index);
    });
}

void PlanningPresenterImpl::selectTargetAtIndex(int index, int selectionMode)
{
    if(index < 0 || index >= targetsList()->rowCount())
        return;
    auto entry = targetsList()->dataAt(index);
    auto const mode = static_cast<SelectionMode>(selectionMode);
    if(SelectionMode::SingleSelection == mode)
        deselectAll(targetsList());
    auto const data = entry[QStringLiteral("selected")].toBool();
    entry[QStringLiteral("selected")] = !data;
    targetsList()->setRowData(index, entry);
}

void PlanningPresenterImpl::selectInstrumentAtIndex(int index, int selectionMode)
{
    if(index < 0 || index >= targetsList()->rowCount())
        return;
    auto entry = instrumentsList()->dataAt(index);
    auto const mode = static_cast<SelectionMode>(selectionMode);
    if(SelectionMode::SingleSelection == mode)
        deselectAll(instrumentsList());
    auto const data = entry[QStringLiteral("selected")].toBool();
    entry[QStringLiteral("selected")] = !data;
    instrumentsList()->setRowData(index, entry);
    updateProceedButton();
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
        obj[QStringLiteral("text")] = QStringLiteral("%1").arg(point.name);
        obj[QStringLiteral("selected")] = false;
        targetsList()->appendRow(obj);
    });
}

void PlanningPresenterImpl::onPlanningStarted()
{
    m_navigationPresenter->setTabIndex(2);
    emit m_navigationPresenter->planningScreenShown();
}

void PlanningPresenterImpl::onPlanningFinished()
{
    m_navigationPresenter->setPlanningCompleted(true);
}

void PlanningPresenterImpl::setVTKItem(QQuickVTKRenderItem *geomItem, QQuickVTKRenderWindow *window)
{
    qWarning() << geomItem;
    vtkNew<vtkActor> actor;
    vtkNew<vtkPolyDataMapper> mapper;
    vtkNew<vtkConeSource> cone;
    mapper->SetInputConnection(cone->GetOutputPort());
    actor->SetMapper(mapper);
    geomItem->renderer()->AddActor(actor);
    geomItem->renderer()->ResetCamera();
    geomItem->renderer()->SetBackground(0.5, 0.5, 0.7);
    geomItem->renderer()->SetBackground2(0.7, 0.7, 0.7);
    geomItem->renderer()->SetGradientBackground(true);
    geomItem->update();
}

void PlanningPresenterImpl::init()
{
    updateProceedButton();
}

void PlanningPresenterImpl::updateProceedButton()
{
    for(auto const &entry : instrumentsList()->data()) {
        if(!entry.toObject()[QStringLiteral("selected")].toBool()) {
            continue;
        }
        setProceedToPositioningButtonEnabled(true);
        return;
    }
    setProceedToPositioningButtonEnabled(false);
}

void PlanningPresenterImpl::deselectAll(GreenHouse::Model *model)
{
    for(int i = 0; i < model->rowCount(); ++i) {
        auto entry = model->dataAt(i);
        entry[QStringLiteral("selected")] = false;
        model->setRowData(i, entry);
    };
}
