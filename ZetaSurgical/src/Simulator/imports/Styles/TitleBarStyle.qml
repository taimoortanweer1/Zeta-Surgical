import QtQuick 2.14

QtObject {
    id: root

    property color backgroundColor: "#357850"
    property real horizontalPadding: 10
    property real verticalPadding: 10
    property bool closeButtonVisible: true
    property real borderRadius: 5

    property LabelStyle title: LabelStyle {
        lineHeight: 22
        horizontalPadding: 0
        verticalPadding: 0
        font: Qt.font({ pixelSize: 18, weight: Font.Normal })
        style: Text.Normal
        color: "#FFFFFF"
    }
}
