import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import Styles 1.0
import Themes 1.0
import Helpers 1.0

FocusScope {
    id: root

    width: implicitWidth
    height: implicitHeight

    implicitWidth: switchRow.width
    implicitHeight: Math.max(label.implicitHeight, switchItem.implicitHeight)

    property LabelStyle fieldNameStyle: Theme.labelStyle

    property bool autoToggle: true
    property bool checked: false
    property alias checkable: ma.enabled
    property alias hovered: ma.containsMouse
    property alias text: label.text
    property alias altText: altLabel.text
    property alias labelHorizontalAlignment: label.horizontalAlignment
    property int layoutDirection: Qt.LeftToRight

    signal clicked

    ToolTip.delay: UIConstants.toolTipDelay
    ToolTip.timeout: UIConstants.toolTipTimeout

    opacity: enabled ? 1.0 : 0.5

    Row {
        id: switchRow

        anchors.centerIn: parent
        spacing: 5
        layoutDirection: root.layoutDirection

        DecoratedLabel {
            id: label

            anchors.verticalCenter: parent.verticalCenter

            labelStyle: root.fieldNameStyle

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight

            visible: text !== ""
        }

        Item {
            id: switchItem

            anchors.verticalCenter: parent.verticalCenter

            implicitWidth: 32
            implicitHeight: 17

            BorderImage {
                id: bg

                anchors.fill: parent
                anchors.margins: -overflow

                property int overflow: 0
                property int borderSize: 5

                border.left: borderSize
                border.right: borderSize
                border.top: borderSize
                border.bottom: borderSize

                source: "qrc:/assets/ui_components/switch/bg.png"
            }

            Image {
                id: handle

                anchors.verticalCenter: switchItem.verticalCenter

                x: {
                    if (root.layoutDirection === Qt.RightToLeft)
                        return root.checked ? 2 : switchItem.width - handle.width - 2
                    return root.checked ? switchItem.width - handle.width - 2 : 2
                }

                Behavior on x {
                    NumberAnimation { duration: 250; }
                }

                source: "qrc:/assets/ui_components/switch/handle.png"

                Image {
                    anchors.centerIn: parent

                    source: "qrc:/assets/ui_components/switch/handle_active.png"

                    opacity: root.checked ? 1.0 : 0.0

                    Behavior on opacity {
                        NumberAnimation { duration: 500 }
                    }
                }
            }
        }

        DecoratedLabel {
            id: altLabel

            anchors.verticalCenter: parent.verticalCenter

            labelStyle: root.fieldNameStyle

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight

            visible: text !== ""
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

        onClicked: ma.handleClick()
    }

    StateGroup {
        states: [
            State {
                when: !ma.containsMouse && !root.activeFocus
                PropertyChanges {
                    target: bg
                    source: "qrc:/assets/ui_components/switch/bg.png"
                    overflow: 0
                    borderSize: 5
                }
            },
            State {
                when: ma.containsMouse && !root.activeFocus
                PropertyChanges {
                    target: bg
                    source: "qrc:/assets/ui_components/switch/bg_hover.png"
                    overflow: 4
                    borderSize: 9
                }
            },
            State {
                when: root.activeFocus
                PropertyChanges {
                    target: bg
                    source: "qrc:/assets/ui_components/switch/bg_focus.png"
                    overflow: 4
                    borderSize: 9
                }
            }
        ]
    }
}
