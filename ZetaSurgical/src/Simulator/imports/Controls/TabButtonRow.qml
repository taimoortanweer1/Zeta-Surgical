import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import Controls 1.0
import Helpers 1.0

DecoratedFlickable {
    id: root

    implicitWidth: tabRow.implicitWidth
    implicitHeight: tabRow.implicitHeight

    default property alias leftTabContents: leftExtraButtons.children
    property alias rightTabContents: rightExtraButtons.children

    property bool showFocusOutline: false

    property Repeater tabModelRepeater: tabRepeater
    property alias tabModel: tabRepeater.model
    property alias tabButtonDelegate: tabRepeater.delegate
    property alias tabCount: tabRepeater.count
    property int currentTab: -1
    property int spacing: 0
    property alias leftPadding: leftTabRowSpacer.implicitWidth
    property alias rightPadding: rightTabRowSpacer.implicitWidth
    property alias horizontalCenterPadding: internalTabRowSpacer.implicitWidth

    signal tabRequested(int tab)
    signal tabAdded(int tab)
    signal tabRemoved(int tab)

    scrollBarThickness: 8
    boundsBehavior: Flickable.StopAtBounds

    contentWidth: Math.max(width, tabRow.implicitWidth)
    contentHeight: height

    clipContent: false

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

    Rectangle {
        id: background

        width: root.contentWidth
        height: root.contentHeight

        color: DrawFunctions.opaqueDarkPanelColor
    }

    RowLayout {
        id: tabRow
        anchors.fill: parent

        spacing: root.spacing

        Item {
            id: leftTabRowSpacer

            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            Layout.fillHeight: true
            Layout.fillWidth: false
            Layout.maximumWidth: implicitWidth
            Layout.minimumWidth: implicitWidth

            implicitWidth: 0
        }

        RowLayout {
            id: leftExtraButtons
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumWidth: implicitWidth
            Layout.maximumHeight: implicitHeight

            spacing: root.spacing
            visible: children.length > 0
        }

        Row {
            Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumWidth: implicitWidth
            Layout.maximumHeight: implicitHeight

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
                onItemAdded: root.tabAdded(index)
                onItemRemoved: root.tabRemoved(index)
            }
        }

        Item {
            id: internalTabRowSpacer
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumWidth: implicitWidth

            implicitWidth: 13
        }

        RowLayout {
            id: rightExtraButtons
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumWidth: implicitWidth
            Layout.maximumHeight: implicitHeight

            spacing: root.spacing
            visible: children.length > 0
        }

        Item {
            id: rightTabRowSpacer

            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            Layout.fillHeight: true
            Layout.fillWidth: false
            Layout.maximumWidth: implicitWidth
            Layout.minimumWidth: implicitWidth

            implicitWidth: 13
        }
    }
}
