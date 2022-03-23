import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.12

import Helpers 1.0

Item {
    id: root

    implicitWidth: scrollBarItem.implicitWidth
    implicitHeight: scrollBarItem.implicitHeight

    property alias orientation: scrollBarItem.orientation
    property alias policy: scrollBarItem.policy
    property double scrollBarThickness: 8

    readonly property alias scrollBar: scrollBarItem

    ScrollBar {
        id: scrollBarItem
        anchors.fill: parent

        implicitWidth: root.scrollBarThickness
        implicitHeight: 480

        enabled: root.visible
        orientation: Qt.Vertical
        policy: ScrollBar.AlwaysOn

        Material.background: DrawFunctions.scrollBarBackgroundColor
        Material.accent: DrawFunctions.scrollBarHandleColor

        contentItem: Rectangle {
            id: handle
            implicitWidth: root.scrollBarThickness
            implicitHeight: 100
            color: scrollBarItem.palette.highlight
            radius: 0.5 * root.scrollBarThickness
        }

        background: Item {}
    }

    StateGroup {
        states: [
            State {
                when: root.orientation !== Qt.Horizontal
                PropertyChanges {
                    target: scrollBarItem
                    implicitWidth: root.scrollBarThickness
                    implicitHeight: 480
                }
                PropertyChanges {
                    target: handle
                    implicitWidth: root.scrollBarThickness
                    implicitHeight: 100
                    width: root.scrollBarThickness
                }
            },
            State {
                when: root.orientation === Qt.Horizontal
                PropertyChanges {
                    target: scrollBarItem
                    implicitWidth: 480
                    implicitHeight: root.scrollBarThickness
                }
                PropertyChanges {
                    target: handle
                    implicitWidth: 100
                    implicitHeight: root.scrollBarThickness
                    height: root.scrollBarThickness
                }
            }
        ]
    }

    StateGroup {
        states: [
            State {
                // Default
                when: !scrollBarItem.pressed && !scrollBarItem.hovered
                PropertyChanges {
                    target: handle
                    color: DrawFunctions.scrollBarHandleColor
                }
            },
            State {
                // Hovered
                when: !scrollBarItem.pressed && scrollBarItem.hovered
                PropertyChanges {
                    target: handle
                    color: Qt.lighter(DrawFunctions.scrollBarHandleColor, 1.2)
                }
            },
            State {
                // Pressed
                when: scrollBarItem.pressed
                PropertyChanges {
                    target: handle
                    color: Qt.lighter(DrawFunctions.scrollBarHandleColor, 1.4)
                }
            }
        ]
    }
}
