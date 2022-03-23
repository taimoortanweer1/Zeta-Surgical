import QtQuick 2.6
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import Controls 1.0
import Dialogs 1.0
import Helpers 1.0

import GreenHouse.Simulator 1.0

Item {
    id: root

    DecoratedDialog {
        id: addSampleSourcePopup

        closePolicy: Popup.NoAutoClose
        title: qsTr("Add sample source")
        standardButtons: Dialog.Ok | Dialog.Cancel

        Column {
            spacing: 5

            Row {
                anchors.right: parent.right
                spacing: 5

                DecoratedLabel {
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Object:")
                }

                DecoratedComboBox {
                    id: objectComboBox

                    width: 256

                    model: Simulator.objectNames
                }
            }

            Row {
                anchors.right: parent.right
                spacing: 5

                DecoratedLabel {
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Property:")
                }

                DecoratedComboBox {
                    id: propertyComboBox

                    property ContextObjectWrapper objectWrapper: Simulator.object(objectComboBox.currentText)

                    model: objectWrapper ? objectWrapper.samplingObjectPropertyNames : null
                    width: 256
                }
            }
        }

        onAccepted: Simulator.dataSampler.addSource(objectComboBox.currentText, propertyComboBox.currentText)
    }

    Row {
        id: samplingControlsRow

        anchors.right: parent.right
        anchors.margins: 5
        anchors.bottom: parent.bottom

        spacing: 5

        DecoratedLabel {
            anchors.verticalCenter: parent.verticalCenter
            text: qsTr("Sampling Interval:")
        }

        DecoratedSpinBox {
            anchors.verticalCenter: parent.verticalCenter

            enabled: !Simulator.dataSampler.samplingActive

            from: 50
            to: 1000 * 60 * 15
            value: Simulator.dataSampler.sampleInterval
            onValueChanged: Simulator.dataSampler.sampleInterval = value
        }

        DecoratedLabel {
            anchors.verticalCenter: parent.verticalCenter
            text: qsTr("[ms]")
        }

        DecoratedButton {
            anchors.verticalCenter: parent.verticalCenter
            enabled: headerRepeater.count > 0

            text: Simulator.dataSampler.samplingActive ? qsTr("Stop Sampling") : qsTr("Start Sampling")
            onClicked: {
                if (Simulator.dataSampler.samplingActive)
                    Simulator.dataSampler.stopSampling();
                else
                    Simulator.dataSampler.startSampling();
            }
        }

        DecoratedButton {
            anchors.verticalCenter: parent.verticalCenter

            enabled: !Simulator.dataSampler.samplingActive

            text: qsTr("Caputre Samples")
            onClicked: Simulator.dataSampler.caputreSamples();
        }
    }

    Row {
        id: configontrolsRow

        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 5

        spacing: 5

        DecoratedButton {
            anchors.verticalCenter: parent.verticalCenter

            enabled: !Simulator.dataSampler.samplingActive

            text: qsTr("Load Configuration")

            FileDialog {
                id: loadConfiguration

                title: qsTr("Please choose a configuration file.")
                selectExisting: true
                nameFilters: [ "GreenHouse Simulator data sampling configuration file (*.ghdsc)" ]

                onAccepted: {
                    Simulator.dataSampler.importSetup(file)
                }
            }

            onClicked: loadConfiguration.open()
        }

        DecoratedButton {
            anchors.verticalCenter: parent.verticalCenter

            enabled: headerRepeater.count > 0

            text: qsTr("Export Configuration")

            FileDialog {
                id: saveConfiguration

                title: qsTr("Please choose a configuration file.")
                nameFilters: [ "GreenHouse Simulator data sampling configuration file (*.ghdsc)" ]

                onAccepted: {
                    if (file.toString().endsWith(".ghdsc"))
                        Simulator.dataSampler.exportSetup(file)
                    else
                        Simulator.dataSampler.exportSetup(file + ".ghdsc")
                }
            }

            onClicked: saveConfiguration.open()
        }
    }

    Row {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 5

        spacing: 5

        DecoratedButton {
            anchors.verticalCenter: parent.verticalCenter

            enabled: sampleList.count > 0

            text: qsTr("Clear")

            onClicked: Simulator.dataSampler.clear(true)
        }

        DecoratedButton {
            anchors.verticalCenter: parent.verticalCenter

            enabled: !Simulator.dataSampler.samplingActive

            text: qsTr("Import CSV")

            FileDialog {
                id: importCSV

                title: qsTr("Please choose a CSV.")
                selectExisting: true
                nameFilters: [ "CSV file (*.csv)" ]

                onAccepted: {
                    Simulator.dataSampler.importCSV(file)
                }
            }

            onClicked: importCSV.open()
        }

        DecoratedButton {
            anchors.verticalCenter: parent.verticalCenter

            enabled: sampleList.count > 0

            text: qsTr("Export CSV")

            FileDialog {
                id: exportCSV

                title: qsTr("Please choose a CSV.")
                nameFilters: [ "CSV file (*.csv)" ]

                onAccepted: {
                    if (file.toString().endsWith(".csv"))
                        Simulator.dataSampler.exportCSV(file)
                    else
                        Simulator.dataSampler.exportCSV(file + ".csv")
                }
            }

            onClicked: exportCSV.open()
        }
    }

    Item {
        id: sampleFrame

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: configontrolsRow.bottom
        anchors.bottom: samplingControlsRow.top
        anchors.margins: 5

        clip: true

        DecoratedFlickable {
            id: horizontalFlicakble

            anchors.fill: parent

            contentWidth: header.width
            contentHeight: height
            boundsBehavior: Flickable.StopAtBounds

            Rectangle {
                anchors.fill: header
                color: DrawFunctions.opaqueDarkPanelColor
            }

            Row {
                id: header

                anchors.top: parent.top
                x: -sampleList.contentX

                DecoratedTableItem {
                    id: timestampHeader

                    width: timestampLabel.width + 10
                    height: Math.max(timestampLabel.height, addButton.height) + 10
                    solidBackground: false
                    hoverEnabled: false

                    DecoratedLabel {
                        id: timestampLabel

                        anchors.centerIn: parent
                        text: qsTr("Timestamp")
                        width: 200
                    }

                    IconButton {
                        id: addButton

                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.rightMargin: 5

                        enabled: !Simulator.dataSampler.samplingActive
                        fillMode: Image.Pad

                        source: "qrc:/assets/ui_components/delegates/buttons/default/moveright.png"
                        hoveredSource: "qrc:/assets/ui_components/delegates/buttons/hovered/moveright.png"
                        pressedSource: "qrc:/assets/ui_components/delegates/buttons/pressed/moveright.png"

                        onClicked: addSampleSourcePopup.openUnder(addButton)
                    }

                    BorderRectangle {
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom

                        width: 1
                    }
                }

                Repeater {
                    id: headerRepeater

                    model: Simulator.dataSampler.headers
                    delegate: DecoratedTableItem {
                        width: headerRow.width + 10
                        height: timestampHeader.height
                        solidBackground: false
                        hoverEnabled: false

                        Row {
                            id: headerRow

                            anchors.centerIn: parent
                            spacing: 5

                            DecoratedLabel {
                                id: headerLabel

                                anchors.verticalCenter: parent.verticalCenter
                                text: modelData
                            }

                            RemoveButton {
                                anchors.verticalCenter: parent.verticalCenter

                                enabled: !Simulator.dataSampler.samplingActive
                                onClicked: {
                                    Simulator.dataSampler.removeSource(index)
                                }
                            }
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

            DecoratedListView {
                id: sampleList

                anchors.left: parent.left
                anchors.right: header.right
                anchors.top: header.bottom
                anchors.bottom: parent.bottom

                model: Simulator.dataSampler

                clip: true
                boundsBehavior: ListView.StopAtBounds
                onContentHeightChanged: {
                    if (Simulator.dataSampler.samplingActive)
                        positionViewAtEnd()
                }

                vecticalScrollBarOffset: Math.max(0, header.width - sampleFrame.width - horizontalFlicakble.contentX)

                delegate: Item {
                    width: header.width
                    height: line.height

                    enabled: !Simulator.dataSampler.samplingActive
                    Row {
                        id: line
                        property int rowIndex: index

                        DecoratedTableItem {
                            width: timestampHeader.width
                            height: timestampHeader.height
                            isAlternate: true

                            DecoratedLabel {
                                anchors.fill: parent
                                anchors.margins: 10

                                text: timestamp
                                elide: Text.ElideRight
                            }

                            BorderRectangle {
                                anchors.right: parent.right
                                anchors.top: parent.top
                                anchors.bottom: parent.bottom

                                width: 1
                            }

                            onClicked: Simulator.dataSampler.apply(index)
                        }

                        Repeater {
                            model: values

                            delegate: DecoratedTableItem {
                                property Item headerItem: headerRepeater.itemAt(index)
                                width: headerItem ? headerItem.width : 10
                                height: headerItem ? headerItem.height : 10
                                isAlternate: index % 2 != 0

                                DecoratedLabel {
                                    anchors.fill: parent
                                    anchors.margins: 10

                                    text: modelData
                                    elide: Text.ElideRight
                                }

                                BorderRectangle {
                                    anchors.right: parent.right
                                    anchors.top: parent.top
                                    anchors.bottom: parent.bottom

                                    width: 1
                                }

                                onClicked: Simulator.dataSampler.apply(line.rowIndex, index)
                            }
                        }
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
}
