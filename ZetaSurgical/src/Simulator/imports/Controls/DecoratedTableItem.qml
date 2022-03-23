import QtQuick 2.14

import Helpers 1.0

FocusScope {
    id: root

    implicitHeight: 35

    property bool selected: false
    property bool solidBackground: true
    property bool internallyHovered: false
    property bool isAlternate: (y / Math.max(1, implicitHeight)) % 2 === 0

    property color selectedColor: DrawFunctions.accentShadowColor

    property alias mouseX: ma.mouseX
    property alias mouseY: ma.mouseY
    property alias pressAndHoldInterval: ma.pressAndHoldInterval
    property alias acceptedButtons: ma.acceptedButtons
    property alias hoverEnabled: ma.hoverEnabled

    readonly property bool containsMouse: ma.containsMouse || internallyHovered
    readonly property bool hovered: ma.containsMouse || internallyHovered

    signal clicked(var mouse)
    signal doubleClicked(var mouse)
    signal pressed(var mouse)
    signal pressAndHold(var mouse)
    signal released(var mouse)

    Keys.onEnterPressed: root.clicked({"x": 0, "y": 0})
    Keys.onReturnPressed: root.clicked({"x": 0, "y": 0})
    Keys.onSpacePressed: root.clicked({"x": 0, "y": 0})

    Rectangle {
        id: bg
        anchors.fill: parent
    }

    MouseArea {
        id: ma
        anchors.fill: parent

        hoverEnabled: true

        onClicked: root.clicked(mouse)
        onDoubleClicked: root.doubleClicked(mouse)
        onPressed: root.pressed(mouse)
        onPressAndHold: root.pressAndHold(mouse)
        onReleased: root.released(mouse)
    }

    StateGroup {
        states: [
            State {
                // Default No Background
                when: !root.selected && !root.solidBackground && !(root.hovered || root.activeFocus)
                PropertyChanges {
                    target: bg
                    color: "transparent"
                    visible: false
                }
            },
            State {
                // Selected
                when: root.selected
                PropertyChanges {
                    target: bg
                    color: root.selectedColor
                    visible: true
                }
            },
            State {
                // Default Solid Background
                when: !root.selected && root.solidBackground && !(root.hovered || root.activeFocus)
                PropertyChanges {
                    target: bg
                    color: root.isAlternate ? DrawFunctions.listItemOddBackground
                                            : DrawFunctions.listItemEvenBackground
                    visible: true
                }
            },
            State {
                // Hovered
                when: !root.selected && (root.hovered || root.activeFocus)
                PropertyChanges {
                    target: bg
                    color: DrawFunctions.listItemHoveredBackground
                    visible: true
                }
            }
        ]
    }

    BorderRectangle {
        id: border

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 1
        color: DrawFunctions.borderColor
    }
}
