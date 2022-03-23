import QtQuick 2.14
import QtQuick.Controls 2.14

import Styles 1.0
import Themes 1.0
import Helpers 1.0

FocusScope {
    id: root

    width: implicitWidth
    height: implicitHeight
    implicitWidth: 55
    implicitHeight: 38

    property LabelStyle labelStyle: LabelStyle {
        lineHeight: 13
        horizontalPadding: 0
        verticalPadding: 0
        font: Qt.font({ pixelSize: 13, weight: Font.Bold })
        style: Text.Normal
        color: "#FFFFFF"
    }

    property LabelStyle hoveredLabelStyle: LabelStyle {
        lineHeight: 13
        horizontalPadding: 0
        verticalPadding: 0
        font: Qt.font({ pixelSize: 13, weight: Font.Bold })
        style: Text.Normal
        color: "#FFFFFF"
    }

    property LabelStyle pressedLabelStyle: LabelStyle {
        lineHeight: 13
        horizontalPadding: 0
        verticalPadding: 0
        font: Qt.font({ pixelSize: 13, weight: Font.Bold })
        style: Text.Normal
        color: "#31CB6E"
    }

    property alias text: label.text
    readonly property alias containsMouse: ma.containsMouse

    signal clicked

    ToolTip.delay: UIConstants.toolTipDelay
    ToolTip.timeout: UIConstants.toolTipTimeout

    BorderImage {
        id: bg

        anchors.fill: parent

        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
    }

    DecoratedLabel {
        id: label

        anchors {
            fill: bg
            topMargin: -bg.anchors.topMargin + bg.border.top
            leftMargin: -bg.anchors.leftMargin + bg.border.left
            rightMargin: -bg.anchors.rightMargin + bg.border.right
            bottomMargin: -bg.anchors.bottomMargin + bg.border.bottom
        }

        horizontalAlignment: Label.AlignHCenter
        verticalAlignment: Label.AlignVCenter

        text: qsTr("...")
    }

    MouseArea {
        id: ma

        anchors.fill: parent

        Keys.onEnterPressed: root.clicked()
        Keys.onReturnPressed: root.clicked()

        focus: true
        hoverEnabled: true

        onClicked: root.clicked()
    }

    StateGroup {
        states: [
            State {
                when: !ma.containsMouse && !ma.activeFocus
                PropertyChanges {
                    target: bg
                    anchors.topMargin: -1
                    anchors.leftMargin: -1
                    anchors.rightMargin: -2
                    anchors.bottomMargin: -2
                    border.top: 5
                    border.left: 2
                    border.right: 5
                    border.bottom: 5
                    source: Qt.resolvedUrl("qrc:/assets/ui_components/browse_button/browse_button_default.png")
                }
                PropertyChanges {
                    target: label
                    labelStyle: root.labelStyle
                }
            },
            State {
                when: !ma.pressed && (ma.containsMouse || ma.activeFocus)
                PropertyChanges {
                    target: bg
                    anchors.topMargin: -3
                    anchors.leftMargin: -3
                    anchors.rightMargin: -3
                    anchors.bottomMargin: -3
                    border.top: 6
                    border.left: 4
                    border.right: 6
                    border.bottom: 6
                    source: Qt.resolvedUrl("qrc:/assets/ui_components/browse_button/browse_button_hovered.png")
                }
                PropertyChanges {
                    target: label
                    labelStyle: root.hoveredLabelStyle
                }
            },
            State {
                when: ma.pressed && ma.containsMouse
                PropertyChanges {
                    target: bg
                    anchors.topMargin: 0
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0
                    anchors.bottomMargin: -1
                    border.top: 4
                    border.left: 1
                    border.right: 3
                    border.bottom: 4
                    source: Qt.resolvedUrl("qrc:/assets/ui_components/browse_button/browse_button_pressed.png")
                }
                PropertyChanges {
                    target: label
                    labelStyle: root.pressedLabelStyle
                }
            }
        ]
    }
}
