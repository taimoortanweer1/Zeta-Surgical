import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import Controls 1.0
import Helpers 1.0

Item {
    id: root

    implicitWidth: tabRow.implicitWidth + leftExtraButtons.implicitWidth + rightExtraButtons.implicitWidth + 7
    implicitHeight: tabRow.implicitHeight + 1

    default property alias leftTabContents: leftExtraButtons.children
    property alias rightTabContents: rightExtraButtons.children

    property bool showFocusOutline: false
    property bool useMaximumTabSpan: true

    property Repeater tabModelRepeater: tabRepeater
    property alias tabModel: tabRepeater.model
    property alias tabButtonDelegate: tabRepeater.delegate
    property alias tabCount: tabRepeater.count
    property int currentTab: -1
    property int spacing: 0

    signal tabRequested(int tab)
    signal tabAdded(int tab)
    signal tabRemoved(int tab)

    function indexOf(text) {
        var index = -1;
        for (var i = 0; i < tabRepeater.count; ++i) {
            if (tabRepeater.itemAt(i).text === text) {
                index = i;
                break;
            }
        }
        return index;
    }

    function textAt(index) {
        return index >= 0 && index < tabRepeater.count ? tabRepeater.itemAt(index).text : ""
    }

    onCurrentTabChanged: tabFlickable.ensureVisible(currentTab)

    Rectangle {
        id: background

        anchors.fill: parent

        color: DrawFunctions.opaqueDarkPanelColor
    }

    RowLayout {
        id: leftExtraButtons

        anchors.top: parent.top
        anchors.bottom: parent.bottom

        spacing: root.spacing
        visible: children.length > 0
    }

    DecoratedFlickable {
        id: tabFlickable

        anchors.left: leftExtraButtons.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        property real maximumSpan: root.width - leftExtraButtons.width - rightExtraButtons.width - 5
        width: root.useMaximumTabSpan ? maximumSpan : Math.min(contentWidth, maximumSpan)

        scrollBarThickness: 8
        boundsBehavior: Flickable.StopAtBounds

        contentWidth: tabRow.width + 2
        contentHeight: height

        clipContent: true

        function ensureVisible(tabIndex) {
            if (tabIndex >= 0 && tabIndex < tabRepeater.count) {
                let currentTabItem = tabRepeater.itemAt(tabIndex)
                if (currentTabItem) {
                    if (currentTabItem.x < tabFlickable.contentX) {
                        tabFlickable.contentX = currentTabItem.x
                    } else if (currentTabItem.x + currentTabItem.width > tabFlickable.contentX + tabFlickable.width) {
                        tabFlickable.contentX = currentTabItem.x + currentTabItem.width - tabFlickable.width
                    }
                }
            }
        }
        onContentWidthChanged: ensureVisible(root.currentTab)

        Row {
            id: tabRow

            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.margins: 1

            spacing: root.spacing
            visible: children.length > 0

            Repeater {
                id: tabRepeater

                delegate: TabRowButton {
                    id: tabRowButton

                    Keys.onSpacePressed: root.tabRequested(index)

                    ToolTip.text: model ? (model.toolTipText ? model.toolTipText : "") : ""
                    ToolTip.visible: tabRowButton.hovered && ToolTip.text !== ""

                    showFocusOutline: root.showFocusOutline
                    current: index === root.currentTab
                    focus: current
                    text: model ? (model.tabName ? model.tabName : "") : modelData
                    onTriggered: root.tabRequested(index)
                }
                onItemAdded: index => root.tabAdded(index)
                onItemRemoved: index => root.tabRemoved(index)
            }
        }
    }

    RowLayout {
        id: rightExtraButtons

        anchors.left: tabFlickable.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        spacing: root.spacing
        visible: children.length > 0
    }
}
