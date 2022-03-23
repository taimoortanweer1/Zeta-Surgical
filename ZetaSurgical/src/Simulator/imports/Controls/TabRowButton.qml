import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import Styles 1.0
import Themes 1.0
import Controls 1.0
import Helpers 1.0

FocusScope {
    id: root

    implicitWidth: Math.max(minimumWidth, tabContentRow.implicitWidth + 2 * padding)
    implicitHeight: 36

    property alias leftContents: leftContentRow.data
    default property alias rightContents: rightContentRow.data

    property real minimumWidth: 60

    property alias text: tabNameLabel.text
    property alias hovered: tabMouseArea.containsMouse
    property bool current: false

    property real padding: 10
    property real spacing: 5

    property bool showFocusOutline: false

    signal triggered

    ToolTip.delay: UIConstants.toolTipDelay
    ToolTip.timeout: UIConstants.toolTipTimeout

    BorderImage {
        id: bg

        anchors.fill: parent
        anchors.leftMargin: -1
        anchors.bottomMargin: -1
        anchors.topMargin: -1

        source: root.current ? "qrc:/assets/ui_components/tabs/bg_active.png"
                             : "qrc:/assets/ui_components/tabs/bg.png"

        border.top: 5
        border.left: 5
        border.right: 5
        border.bottom: 5
    }

    MouseArea {
        id: tabMouseArea

        anchors.fill: parent
        hoverEnabled: true
        onPressed: root.triggered()
    }

    Row {
        id: tabContentRow

        anchors.fill: parent
        anchors.margins: root.padding

        spacing: root.spacing

        Row {
            id: leftContentRow

            anchors.top: parent.top
            anchors.bottom: parent.bottom

            spacing: root.spacing

            visible: children.length > 0
        }

        Item {
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            width: tabNameLabel.width

            DecoratedLabel {
                id: tabNameLabel

                anchors.centerIn: parent
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter

                font.pixelSize: 12
                font.bold: true

                visible: root.current
            }

            DecoratedLabel {
                anchors.centerIn: parent
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter

                font.pixelSize: 12
                font.bold: false
                opacity: 0.6

                text: tabNameLabel.text
                visible: !tabNameLabel.visible
            }
        }

        Row {
            id: rightContentRow

            anchors.top: parent.top
            anchors.bottom: parent.bottom

            spacing: root.spacing

            visible: children.length > 0
        }
    }

    FocusOutline {
        anchors.fill: parent
        visible: root.activeFocus && root.showFocusOutline
    }
}
