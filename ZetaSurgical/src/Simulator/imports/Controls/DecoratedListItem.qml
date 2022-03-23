import QtQuick 2.14

FocusScope {
    id: root

    implicitHeight: 32

    property bool selected: false
    property bool solidBackground: false
    property bool internallyHovered: false

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

    BorderImage {
        id: bg

        property int overflow: root.selected ? 0 : 4
        anchors.fill: parent
        anchors.margins: -overflow

        border.left: 5 + overflow
        border.top: 5 + overflow
        border.right: 5 + overflow
        border.bottom: 5 + overflow

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

        states: [
            State {
                // Default
                when: !root.selected && !root.solidBackground && !root.hovered
                PropertyChanges {
                    target: bg
                    source: ""
                }
            },
            State {
                // Selected
                when: root.selected
                PropertyChanges {
                    target: bg
                    source: "qrc:/assets/ui_components/statetree/bg_active.png"
                }
            },
            State {
                // Solid Background
                when: !root.selected && root.solidBackground
                PropertyChanges {
                    target: bg
                    source: "qrc:/assets/ui_components/statetree/bg.png"
                }
            },
            State {
                // Hovered
                when: !root.selected && !root.solidBackground && root.hovered
                PropertyChanges {
                    target: bg
                    source: "qrc:/assets/ui_components/statetree/bg.png"
                }
            }
        ]
    }
}
