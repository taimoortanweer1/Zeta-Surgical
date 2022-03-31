import QtQuick 2.0
import ZetaSurgical.Types 1.0

Rectangle {
    id: root
    color: "red"
    Component.onCompleted: PlanningPresenter.setVTKItem(root)
}
