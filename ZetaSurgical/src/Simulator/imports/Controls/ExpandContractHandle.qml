import QtQuick 2.14

import Helpers 1.0

Item {
    id: root

    width: 30
    height: 25

    property int direction: Qt.LeftToRight
    property alias expanded: button.expanded

    signal triggered

    ExpandButton {
        id: button

        anchors.left: root.direction === Qt.LeftToRight ? undefined : parent.left
        anchors.right: root.direction === Qt.LeftToRight ? parent.right : undefined
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: 5

        orientation: Qt.Horizontal
        rotation: root.direction === Qt.LeftToRight ? 8 : 180

        onClicked: root.triggered()
    }
}
