import QtQuick 2.14
import QtQuick.Controls 2.14

import Styles 1.0
import Themes 1.0
import Helpers 1.0

Item {
    id: root

    width: implicitWidth
    height: implicitHeight
    implicitWidth: 212
    implicitHeight: 58

    property string defaultIcon
    property string hoveredIcon
    property string pressedIcon

    property bool checked: false
    property alias text: label.text
    readonly property alias hovered: ma.containsMouse
    readonly property alias pressed: ma.pressed

    signal clicked

    ToolTip.delay: UIConstants.toolTipDelay
    ToolTip.timeout: UIConstants.toolTipTimeout

    BorderImage {
        id: bg

        anchors.fill: parent
        anchors.leftMargin: -3
        anchors.rightMargin: -3
        anchors.topMargin: -2
        anchors.bottomMargin: -4

        source: "qrc:/assets/ui_components/project_button.png"

        border.left: 8
        border.right: 8
        border.top: 7
        border.bottom: 9
    }

    Image {
        id: icon

        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 30
    }

    Text {
        id: label

        anchors.left: icon.right
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: 16

        font.pixelSize: 18
        color: DrawFunctions.foregroundColor

        text: "Button"
        elide: Text.ElideRight
    }

    MouseArea {
        id: ma

        anchors.fill: parent
        hoverEnabled: true
        onClicked: root.clicked()
    }

    StateGroup {
        states: [
            State {
                // Default
                when: !root.pressed && !root.checked && !root.hovered
                PropertyChanges {
                    target: icon
                    source: root.defaultIcon
                }
                PropertyChanges {
                    target: label
                    color: DrawFunctions.foregroundColor
                }
                PropertyChanges {
                    target: bg
                    source: "qrc:/assets/ui_components/project_button.png"
                    anchors.leftMargin: -3
                    anchors.rightMargin: -3
                    anchors.topMargin: -2
                    anchors.bottomMargin: -4
                    border.left: 8
                    border.right: 8
                    border.top: 7
                    border.bottom: 9
                }
            },
            State {
                // Hovered
                when: !root.pressed && !root.checked && root.hovered
                PropertyChanges {
                    target: icon
                    source: root.hoveredIcon
                }
                PropertyChanges {
                    target: label
                    color: DrawFunctions.foregroundColor
                }
                PropertyChanges {
                    target: bg
                    source: "qrc:/assets/ui_components/project_button_hover.png"
                    anchors.leftMargin: -6
                    anchors.rightMargin: -6
                    anchors.topMargin: -6
                    anchors.bottomMargin: -6
                    border.left: 11
                    border.right: 11
                    border.top: 11
                    border.bottom: 11
                }
            },
            State {
                // Pressed
                when: root.pressed || root.checked
                PropertyChanges {
                    target: icon
                    source: root.pressedIcon
                }
                PropertyChanges {
                    target: label
                    color: DrawFunctions.highlightColor
                }
                PropertyChanges {
                    target: bg
                    source: "qrc:/assets/ui_components/project_button_pressed.png"
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0
                    anchors.topMargin: 0
                    anchors.bottomMargin: -1
                    border.left: 5
                    border.right: 5
                    border.top: 5
                    border.bottom: 6
                }
            }
        ]
    }
}
