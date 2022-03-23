import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import Controls 1.0
import Dialogs 1.0
import Helpers 1.0

import GreenHouse.Simulator 1.0

Item {
    id: root

    implicitHeight: header.height + lv.contentHeight

    Rectangle {
        anchors.fill: header
        color: DrawFunctions.opaqueDarkPanelColor
    }

    RowLayout {
        id: header

        anchors.left: parent.left
        anchors.right: parent.right
        spacing: 0

        DecoratedTableItem {
            id: uiTextIdHeader

            Layout.fillWidth: true
            Layout.minimumWidth: header.width * 0.25

            solidBackground: false
            hoverEnabled: false
            acceptedButtons: Qt.NoButton

            DecoratedLabel {
                id: uiTextIdLabel

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 5

                text: qsTr("UI String Id")
                elide: Text.ElideRight
            }

            BorderRectangle {
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                width: 1
            }
        }

        DecoratedTableItem {
            id: uiTextDataHeader

            Layout.fillWidth: true
            Layout.minimumWidth: header.width * 0.25

            solidBackground: false
            hoverEnabled: false
            acceptedButtons: Qt.NoButton

            DecoratedLabel {
                id: uiTextDataLabel

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 5

                text: qsTr("UI String Data")
                elide: Text.ElideRight
            }

            BorderRectangle {
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                width: 1
            }
        }

        DecoratedTableItem {
            id: uiTextOverflowHeader

            Layout.fillWidth: false
            Layout.minimumWidth: uiTextOverflowRow.implicitWidth + 10
            Layout.maximumWidth: uiTextOverflowRow.implicitWidth + 10

            solidBackground: false
            hoverEnabled: false
            acceptedButtons: Qt.NoButton

            Row {
                id: uiTextOverflowRow

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 5
                spacing: 5

                DecoratedLabel {
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Text Overflow Status")
                }

                Rectangle {
                    anchors.verticalCenter: parent.verticalCenter

                    width: overflowCountLabel.width + 8
                    height: overflowCountLabel.height
                    radius: height * 0.5

                    DecoratedLabel {
                        id: overflowCountLabel
                        anchors.centerIn: parent

                        text: Simulator.uiTextModel.overflowErrorCount
                    }

                    color: Simulator.uiTextModel.overflowErrorCount > 0 ? "#88ff5757" : "#885DFF9D"
                }
            }

            BorderRectangle {
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                width: 1
            }
        }

        DecoratedTableItem {
            id: uiTextCountHeader

            Layout.fillWidth: false
            Layout.minimumWidth: uiTextCountLabel.implicitWidth + 10
            Layout.maximumWidth: uiTextCountLabel.implicitWidth + 10

            solidBackground: false
            hoverEnabled: false
            acceptedButtons: Qt.NoButton

            DecoratedLabel {
                id: uiTextCountLabel

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 5

                text: qsTr("Usage Count")
                elide: Text.ElideRight
            }

            BorderRectangle {
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                width: 1
            }
        }

        DecoratedTableItem {
            id: uiTextSelectiontHeader

            Layout.fillWidth: false
            Layout.minimumWidth: uiTextSelectiontLabel.implicitWidth + 10
            Layout.maximumWidth: uiTextSelectiontLabel.implicitWidth + 10

            solidBackground: false
            hoverEnabled: false
            acceptedButtons: Qt.NoButton

            DecoratedLabel {
                id: uiTextSelectiontLabel

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 5

                text: qsTr("Selected")
            }
        }
    }

    DecoratedListView {
        id: lv
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: header.bottom
        anchors.bottom: parent.bottom

        clip: true
        boundsBehavior: ListView.StopAtBounds

        model: Simulator.uiTextModel
        delegate: RowLayout {
            anchors.left: parent.left
            anchors.right: parent.right
            spacing: 0

            DecoratedTableItem {
                Layout.fillWidth: true
                Layout.minimumWidth: header.width * 0.25

                isAlternate: true
                hoverEnabled: false
                acceptedButtons: Qt.NoButton

                DecoratedLabel {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.margins: 5

                    text: stringId
                    elide: Text.ElideRight
                }

                BorderRectangle {
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom

                    width: 1
                }
            }

            DecoratedTableItem {
                Layout.fillWidth: true
                Layout.minimumWidth: header.width * 0.25

                isAlternate: false
                hoverEnabled: false
                acceptedButtons: Qt.NoButton

                DecoratedLabel {
                    anchors.fill: parent
                    anchors.margins: 5
                    clip: true

                    text: stringData
                    elide: Text.ElideRight
                    verticalAlignment: Text.AlignVCenter
                }

                BorderRectangle {
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom

                    width: 1
                }
            }

            DecoratedTableItem {
                Layout.fillWidth: false
                Layout.minimumWidth: uiTextOverflowRow.implicitWidth + 10
                Layout.maximumWidth: uiTextOverflowRow.implicitWidth + 10

                isAlternate: true
                hoverEnabled: false
                acceptedButtons: Qt.NoButton

                Rectangle {
                    anchors.fill: parent
                    anchors.rightMargin: 1
                    anchors.bottomMargin: 1

                    color: overflowStatus ? "#88ff5757" : "#885DFF9D"
                }

                DecoratedLabel {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.margins: 5

                    horizontalAlignment: Text.AlignHCenter
                    text: overflowStatus ? qsTr("Overflow detected")
                                         : qsTr("No Overflow")
                    elide: Text.ElideRight
                }

                BorderRectangle {
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom

                    width: 1
                }
            }

            DecoratedTableItem {
                Layout.fillWidth: false
                Layout.minimumWidth: uiTextCountLabel.implicitWidth + 10
                Layout.maximumWidth: uiTextCountLabel.implicitWidth + 10

                isAlternate: false
                hoverEnabled: false
                acceptedButtons: Qt.NoButton

                DecoratedLabel {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.margins: 5

                    horizontalAlignment: Text.AlignHCenter
                    text: usageCount
                    elide: Text.ElideRight
                }

                BorderRectangle {
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom

                    width: 1
                }
            }

            DecoratedTableItem {
                Layout.fillWidth: false
                Layout.minimumWidth: uiTextSelectiontLabel.implicitWidth + 10
                Layout.maximumWidth: uiTextSelectiontLabel.implicitWidth + 10

                isAlternate: true
                hoverEnabled: false
                acceptedButtons: Qt.NoButton

                DecoratedCheckBox {
                    anchors.centerIn: parent

                    checked: selectionStatus
                    autoToggle: false
                    onClicked: Simulator.uiTextModel.toggleSelection(stringId)
                }
            }
        }
    }

    BorderRectangle {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        width: 1
    }

    BorderRectangle {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        width: 1
    }

    BorderRectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        height: 1
    }

    BorderRectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        height: 1
    }
}
