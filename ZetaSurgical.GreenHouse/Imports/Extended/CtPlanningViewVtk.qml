import QtQuick 2.15
import ZetaSurgical.Types 1.0
import QtQuick.Window 2.15
import VTK 9.1 

Item {
    id: root
    width:1336
    height:1080

    VTKRenderWindow {
        id: vtkRenderWindow1
        width: 1336
        height: 1080
        anchors.fill: parent
    }
    VTKRenderItem {
        id: vtkRenderItem1
        x: 0
        y: 0
        width: 668
        height: 540
        renderWindow: vtkRenderWindow1
        Component.onCompleted: PlanningPresenter.setVTKItem(vtkRenderItem1, vtkRenderWindow1) 
    }
    VTKRenderItem {
        id: vtkRenderItem2
        x: 668
        y: 0
        width: 668
        height: 540
        renderWindow: vtkRenderWindow1
        Component.onCompleted: PlanningPresenter.setVTKItem(vtkRenderItem2, vtkRenderWindow1) 
    }
    VTKRenderItem {
        id: vtkRenderItem3
        x: 0
        y: 540
        width: 668
        height: 540
        renderWindow: vtkRenderWindow1
        Component.onCompleted: PlanningPresenter.setVTKItem(vtkRenderItem3, vtkRenderWindow1) 
    }
}