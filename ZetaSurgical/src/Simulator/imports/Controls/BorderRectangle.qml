import QtQuick 2.0
import Helpers 1.0

Item {
    id: root

    implicitHeight: 1
    implicitWidth: 1

    property alias color: background.color

    Rectangle {
        id: background

        anchors.fill: parent

        color: DrawFunctions.borderColor
    }

    BorderImage {
        anchors.fill: background
        anchors.margins: -15

        border.left: 15
        border.right: 15
        border.top: 15
        border.bottom: 15

        source: "qrc:/assets/BorderShadow.png"
    }
}
