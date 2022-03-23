import QtQuick 2.14
import QtQuick.Controls 2.14

import Helpers 1.0

FocusScope {
    id: root
    implicitWidth: 640
    implicitHeight: 480

    default property alias container: viewportContainer.data

    property alias horizontalScrollBar: horizontalScrollBar.scrollBar
    property alias verticalScrollBar: verticalScrollBar.scrollBar

    property bool horizontalScrollBarVisible: true
    property bool verticalScrollBarVisible: true

    property int scrollBarThickness: 8

    property alias emptyViewportText: emptyViewportLabel.text
    property alias emptyViewportBulletPoints: emptyBulletPointRepeater.model
    property bool viewportEmpty: false
    property int emptyViewportTextMargins: 30
    property alias clipContent: viewportContainer.clip

    property real vecticalScrollBarOffset: 0
    property real horizontalScrollBarOffset: 0

    clip: true

    FocusScope {
        id: viewportContainer
        anchors.fill: parent

        focus: true
    }

    DecoratedScrollBar {
        id: verticalScrollBar
        anchors {
            top: viewportContainer.top
            right: viewportContainer.right
            bottom: viewportContainer.bottom
            topMargin: root.scrollBarThickness
            bottomMargin: root.scrollBarThickness
            rightMargin: root.vecticalScrollBarOffset
        }
        orientation: Qt.Vertical
        policy: root.verticalScrollBarVisible? ScrollBar.AsNeeded : ScrollBar.AlwaysOff
        scrollBarThickness: root.scrollBarThickness
        visible: root.verticalScrollBarVisible
    }

    DecoratedScrollBar {
        id: horizontalScrollBar
        anchors {
            bottom: viewportContainer.bottom
            left: viewportContainer.left
            right: viewportContainer.right
            leftMargin: root.scrollBarThickness
            rightMargin: root.scrollBarThickness
            bottomMargin: root.horizontalScrollBarOffset
        }
        orientation: Qt.Horizontal
        policy: root.horizontalScrollBarVisible? ScrollBar.AsNeeded : ScrollBar.AlwaysOff
        scrollBarThickness: root.scrollBarThickness
        visible: root.horizontalScrollBarVisible
    }

    Column {
        id: emptyViewportColumn

        anchors.centerIn: parent

        visible: root.viewportEmpty && height < root.height
        spacing: 14

        DecoratedLabel {
            id: emptyViewportLabel

            width: root.width - (root.emptyViewportTextMargins * 2)
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            textFormat: Text.StyledText
            color: DrawFunctions.emptyAreasFontColor

            font {
                pixelSize: 14
                weight: Font.Normal
            }
        }

        Column {
            anchors.horizontalCenter: parent ? parent.horizontalCenter : undefined
            spacing: 6

            Repeater {
                id: emptyBulletPointRepeater

                delegate: DecoratedLabel {
                    id: bulletPoint

                    text: "\u2022 " + modelData

                    FontMetrics {
                        id: metrics

                        font: bulletPoint.font
                    }

                    width: Math.min(1.1 * metrics.boundingRect(text).width, root.width - (root.emptyViewportTextMargins * 2))
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    textFormat: Text.StyledText
                    color: DrawFunctions.emptyAreasFontColor
                    font.pixelSize: 13
                    font.weight: Font.Normal
                }
            }
        }
    }
}
