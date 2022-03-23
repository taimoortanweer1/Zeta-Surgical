import QtQuick 2.14
import QtQuick.Controls 2.14

import Styles 1.0
import Themes 1.0
import Helpers 1.0

FocusScope {
    id: root

    width: implicitWidth
    height: implicitHeight
    implicitWidth: label.x + label.implicitWidth
    implicitHeight: Math.max(checkItem.height, label.implicitHeight)

    property LabelStyle fieldNameStyle: Theme.labelStyle

    property bool autoToggle: true
    property bool checked: false
    property alias checkable: ma.enabled
    property alias text: label.text
    property alias hovered: ma.containsMouse

    opacity: enabled ? 1.0 : 0.5

    signal clicked

    ToolTip.delay: UIConstants.toolTipDelay
    ToolTip.timeout: UIConstants.toolTipTimeout

    DecoratedLabel {
        id: label

        anchors {
            left: checkItem.right
            right: root.right
            verticalCenter: root.verticalCenter
            leftMargin: 8
        }

        labelStyle: root.fieldNameStyle

        elide: Text.ElideRight
    }

    Item {
        id: checkItem

        anchors {
            left: root.left
            verticalCenter: root.verticalCenter
        }

        width: implicitWidth
        height: implicitHeight
        implicitWidth: 17
        implicitHeight: 17

        BorderImage {
            id: bg

            anchors {
                fill: parent
                margins: -overflow
            }

            property int borderSize: 5
            property int overflow: 0

            border {
                top: borderSize
                left: borderSize
                right: borderSize
                bottom: borderSize
            }

            source: "qrc:/assets/ui_components/checkbox/bg.png"

            Image {
                id: check

                anchors.centerIn: parent
                source: "qrc:/assets/ui_components/checkbox/check.png"

                opacity: root.checked ? 1.0 : 0.0

                Behavior on opacity {
                    NumberAnimation { duration: 250 }
                }
            }
        }
    }

    MouseArea {
        id: ma
        anchors.fill: parent

        Keys.onEnterPressed: ma.handleClick()
        Keys.onReturnPressed: ma.handleClick()
        Keys.onSpacePressed: ma.handleClick()

        focus: true
        hoverEnabled: true

        function handleClick() {
            if (root.autoToggle)
                root.checked = !root.checked

            root.clicked()
        }

        onClicked: handleClick()
    }

    StateGroup {
        states: [
            State {
                when: !ma.containsMouse && !ma.activeFocus
                PropertyChanges {
                    target: bg
                    source: "qrc:/assets/ui_components/checkbox/bg.png"
                    overflow: 0
                    borderSize: 5
                }
            },
            State {
                when: ma.containsMouse || ma.activeFocus
                PropertyChanges {
                    target: bg
                    source: "qrc:/assets/ui_components/checkbox/bg_hover.png"
                    overflow: 4
                    borderSize: 9
                }
            }
        ]
    }
}
