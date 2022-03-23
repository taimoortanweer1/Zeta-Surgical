import QtQuick 2.14
import QtQuick.Controls 2.14

import Styles 1.0
import Themes 1.0
import Helpers 1.0

FocusScope {
    id: root

    implicitWidth: textLabel.implicitWidth > 0 ? textLabel.x + textLabel.implicitWidth + padding : sideLength
    implicitHeight: sideLength

    property real sideLength: Math.max(image.sourceSize.width, image.sourceSize.height) + (padding * 2)

    property url source
    property url hoveredSource: source
    property url pressedSource: source
    property alias fillMode: image.fillMode
    property alias cursorShape: ma.cursorShape
    property int padding: drawBackground ? 5 : 0
    property bool hidden: false
    property alias drawBackground: background.visible
    property alias text: textLabel.text

    property alias hoverEnabled: ma.hoverEnabled
    readonly property alias containsMouse: ma.containsMouse
    readonly property alias hovered: ma.containsMouse

    property bool toggled: false

    property bool externallyHovered: false

    signal clicked

    ToolTip.delay: UIConstants.toolTipDelay
    ToolTip.timeout: UIConstants.toolTipTimeout

    opacity: enabled ? 1.0 : 0.5

    QtObject {
        id: internal
        readonly property bool depressed: (ma.pressed && ma.containsMouse) || (root.toggled && !internal.hovered)
        readonly property bool hovered: (ma.containsMouse || root.externallyHovered || ma.activeFocus) && !(ma.pressed && ma.containsMouse)
        readonly property bool normal: !internal.depressed && !internal.hovered
    }

    Rectangle {
        id: background

        anchors.fill: parent
        color: DrawFunctions.rulerBackgroundColor
        radius: 5

        border.color: root.toggled ? DrawFunctions.highlightColor
                                   : "transparent"
        border.width: 2
        visible: false
    }

    Image {
        id: image

        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: root.padding

        fillMode: Image.PreserveAspectFit
        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignVCenter
        visible: !root.hidden
    }

    DecoratedLabel {
        id: textLabel

        anchors.left: image.right
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 5
        anchors.rightMargin: root.padding
    }

    MouseArea {
        id: ma
        anchors.fill: parent
        hoverEnabled: true
        focus: true

        Keys.onEnterPressed: ma.handleClick()
        Keys.onReturnPressed: ma.handleClick()
        Keys.onSpacePressed: ma.handleClick()

        function handleClick() {
            root.clicked()
        }

        onClicked: root.clicked()
    }

    StateGroup {
        states: [
            // Default
            State {
                when: internal.normal
                PropertyChanges {
                    target: image
                    source: root.source
                }
                PropertyChanges {
                    target: root
                    ToolTip.visible: false
                }
            },
            // Hovered
            State {
                when: internal.hovered
                PropertyChanges {
                    target: image
                    source: root.hoveredSource
                }
                PropertyChanges {
                    target: root
                    ToolTip.visible: root.ToolTip.text
                }
            },
            // Pressed or Toggled
            State {
                when: internal.depressed
                PropertyChanges {
                    target: image
                    source: root.pressedSource
                }
                PropertyChanges {
                    target: root
                    ToolTip.visible: false
                }
            }
        ]
    }
}
