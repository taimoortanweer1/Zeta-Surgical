#pragma once

#include <ZetaSurgical/planningpresenter.hpp>
#include "QQuickVTKRenderItem.h"
#include "QQuickVTKRenderWindow.h"

#include "vtkActor.h"
#include "vtkColorTransferFunction.h"
#include "vtkConeSource.h"
#include "vtkGenericOpenGLRenderWindow.h"
#include "vtkGlyph3DMapper.h"
#include "vtkNew.h"
#include "vtkPNGWriter.h"
#include "vtkPiecewiseFunction.h"
#include "vtkPolyDataMapper.h"
#include "vtkProperty.h"
#include "vtkRenderer.h"
#include "vtkSmartVolumeMapper.h"
#include "vtkSphereSource.h"
#include "vtkTestUtilities.h"
#include "vtkTesting.h"
#include "vtkVolume.h"
#include "vtkVolumeProperty.h"
#include "vtkWindowToImageFilter.h"
#include "vtkXMLImageDataReader.h"

#include <QQuickWindow>

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

    Q_INVOKABLE void setVTKItem(QQuickVTKRenderItem *item, QQuickVTKRenderWindow *window);

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
