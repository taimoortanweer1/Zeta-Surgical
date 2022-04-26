import QtQuick 2.15
import ZetaSurgical.Types 1.0
import QtQuick.Window 2.15
import VTK 9.1 

Item {
    id: root
    width:668
    height:540

    VTKRenderWindow {
        id: vtkRenderWindow1
        width: 668
        height: 540
        anchors.fill: parent
            
    }
    VTKRenderItem {
        id: vtkRenderItem1
        objectName: "renderItemVTK"
        x: 0
        y: 0
        width: 668
        height: 540
        renderWindow: vtkRenderWindow1
        Component.onCompleted: PlanningPresenter.setVTKItem(vtkRenderItem1, vtkRenderWindow1) 
    }     
}