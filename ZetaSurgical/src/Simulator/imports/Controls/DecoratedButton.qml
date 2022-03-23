import QtQuick 2.14
import QtQuick.Controls 2.14

import Styles 1.0
import Themes 1.0
import Helpers 1.0

FocusScope {
    id: root

    width: implicitWidth
    height: implicitHeight
    implicitWidth: label.implicitWidth + 20
    implicitHeight: 24

    property alias text: label.text
    property alias textColor: label.color
    property alias pressed: ma.pressed
    property alias elide: label.elide
    readonly property alias containsMouse: ma.containsMouse

    property bool toggled: false

    property string defaultBackgroundSource: "qrc:/assets/ui_components/button.png"
    property int defaultBackgroundBorderSize: 5
    property int defaultBackgroundOverflow: 0

    property string hoverBackgroundSource: "qrc:/assets/ui_components/button_hover.png"
    property int hoverBackgroundBorderSize: 10
    property int hoverBackgroundOverflow: 5

    property string pressedBackgroundSource: "qrc:/assets/ui_components/button_pressed.png"
    property int pressedBackgroundBorderSize: 10
    property int pressedBackgroundOverflow: 5

    signal clicked

    ToolTip.delay: UIConstants.toolTipDelay
    ToolTip.timeout: UIConstants.toolTipTimeout

    BorderImage {
        id: bg

        anchors {
            fill: parent
            topMargin: -overflow
            leftMargin: -overflow
            rightMargin: -overflow
            bottomMargin: -overflow - 1
        }

        property int borderSize: 5
        property int overflow: 0

        source: "qrc:/assets/ui_components/button.png"

        border {
            top: borderSize
            left: borderSize
            right: borderSize
            bottom: borderSize
        }
    }

    Text {
        id: label

        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter

        maximumLineCount: 5
        wrapMode: Text.WordWrap

        font {
            pixelSize: 12
        }
        color: "white"
    }

    MouseArea {
        id: ma

        anchors.fill: parent

        Keys.onEnterPressed: root.clicked()
        Keys.onReturnPressed: root.clicked()
        Keys.onSpacePressed: root.clicked()

        focus: true
        hoverEnabled: true

        onClicked: root.clicked()
        onPressed: root.forceActiveFocus()
    }

    StateGroup {
        states: [
            State {
                when: !root.enabled
                PropertyChanges {
                    target: root
                    opacity: 0.5
                }
            },
            State {
                when: root.enabled && !ma.containsMouse && !ma.activeFocus && !root.toggled
                PropertyChanges {
                    target: bg
                    source: root.defaultBackgroundSource
                    overflow: root.defaultBackgroundOverflow
                    borderSize: root.defaultBackgroundBorderSize
                }
            },
            State {
                when: root.enabled && !ma.pressed && (ma.containsMouse || ma.activeFocus) && !root.toggled
                PropertyChanges {
                    target: bg
                    source: root.hoverBackgroundSource
                    overflow: root.hoverBackgroundOverflow
                    borderSize: root.hoverBackgroundBorderSize
                }
            },
            State {
                when: root.enabled && (ma.pressed || root.toggled)
                PropertyChanges {
                    target: bg
                    source: root.pressedBackgroundSource
                    overflow: root.pressedBackgroundOverflow
                    borderSize: root.pressedBackgroundBorderSize
                }
            }
        ]
    }
}
