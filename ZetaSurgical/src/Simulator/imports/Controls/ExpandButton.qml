import QtQuick 2.14

MouseArea {
    id: root

    property bool expanded: false
    property alias hovered: root.containsMouse

    property int orientation: Qt.Vertical

    implicitWidth: icon.sourceSize.width
    implicitHeight: icon.sourceSize.height

    hoverEnabled: true

    Image {
        id: icon

        anchors.centerIn: parent

        property string direction: root.orientation == Qt.Horizontal ? (root.expanded ? "Left" : "Right")
                                                                     : (root.expanded ? "Up" : "Down")
        property string stateImage: root.hovered ? "/Selected State.png" : "/Default State.png"
        source: "qrc:/assets/ui_components/RoundedArrow/" + direction + stateImage
    }
}
