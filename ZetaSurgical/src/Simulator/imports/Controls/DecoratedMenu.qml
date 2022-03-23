import QtQuick 2.14
import QtQuick.Controls 2.14

import Helpers 1.0

Menu {
    id: root
    width: (showTitleBarText && contextMenuTitle.paintedWidth > 200) ? contextMenuTitle.paintedWidth + 18 : 200
    property bool showTitleBarText: false
    property alias titleBarText: contextMenuTitle.text
    padding: 0
    topPadding: 0

    background: Rectangle {
        id: backgroundRectangle
        color: DrawFunctions.rulerBackgroundColor

        layer.enabled: true
    }

    Rectangle {
        id: titleBlock
        color: DrawFunctions.slideInColor
        height: contextMenuTitle.paintedHeight + 16
        anchors.left: parent ? parent.left : undefined
        DecoratedLabel {
            id: contextMenuTitle
            anchors.verticalCenter: parent ? parent.verticalCenter : undefined
            anchors.left: parent ? parent.left : undefined
            anchors.leftMargin: 8
        }
    }

    Component.onCompleted: {
        if (!showTitleBarText) {
            root.removeItem(titleBlock)
        }
    }
}
