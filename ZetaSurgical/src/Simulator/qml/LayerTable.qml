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
            Layout.fillWidth: false
            Layout.minimumWidth: 125

            solidBackground: false
            hoverEnabled: false
            acceptedButtons: Qt.NoButton

            DecoratedLabel {
                id: headerLabel

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 5

                text: qsTr("Layer")
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

            solidBackground: false
            hoverEnabled: false
            acceptedButtons: Qt.NoButton

            DecoratedLabel {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 5

                text: qsTr("Active Node")
                elide: Text.ElideRight
            }

            BorderRectangle {
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                width: 1
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

        model: Simulator.activeLayerModel
        delegate: RowLayout {
            anchors.left: parent.left
            anchors.right: parent.right
            spacing: 0

            DecoratedTableItem {
                Layout.fillWidth: false
                Layout.minimumWidth: 125

                isAlternate: true
                hoverEnabled: false
                acceptedButtons: Qt.NoButton

                DecoratedLabel {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.margins: 5

                    text: layerName
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

                isAlternate: false
                hoverEnabled: false
                acceptedButtons: Qt.NoButton

                DecoratedLabel {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.margins: 5

                    text: activeNode
                    elide: Text.ElideRight
                }

                BorderRectangle {
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom

                    width: 1
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
