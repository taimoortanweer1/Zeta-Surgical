import QtQuick 2.14
import QtQuick.Controls 2.14

import Helpers 1.0

// Corner between the ScrollBars
Control {
    id: corner
    implicitWidth: scrollBarThickness
    implicitHeight: scrollBarThickness

    property bool horizontalScrollBarVisible: false
    property bool verticalScrollBarVisible: false
    property bool transparentBackground: true

    property real scrollBarThickness: 15

    visible: corner.verticalScrollBarVisible && corner.horizontalScrollBarVisible


    // NOTE: This background Rectangle relic appears to have been introduced in case the foreground
    // Rectangle uses transparent colors.
    Rectangle {
        anchors.fill: parent
        color: corner.palette.window

        visible: !corner.transparentBackground
    }

    Rectangle {
        anchors.fill: parent
        border {
            width: 1
            color: DrawFunctions.highlightDarkPanelColor
        }
        color: DrawFunctions.darkPanelColor

        visible: !corner.transparentBackground
    }
}
