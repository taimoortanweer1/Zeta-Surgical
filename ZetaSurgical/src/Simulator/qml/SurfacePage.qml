import QtQuick 2.6
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import Controls 1.0
import Dialogs 1.0
import Helpers 1.0

import GreenHouse.Simulator 1.0

import "editors"

Item {
    id: root

    property int currentObjectWrapperIndex: -1

    Item {
        anchors.fill: parent

        DecoratedFlickable {
            id: objFlickable

            anchors.left: parent.left
            anchors.right: splitter.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            clip: true
            boundsBehavior: Flickable.StopAtBounds
            contentWidth: width
            contentHeight: objTab.height

            Column {
                id: objTab

                Repeater {
                    id: objRepeater

                    model: Simulator.surfaceControllerObjects
                    delegate: DecoratedTableItem {
                        width: objFlickable.width
                        height: objNameLabel.height + 11

                        property QtObject objectWrapper: modelData
                        selected: root.currentObjectWrapperIndex === index
                        isAlternate: index % 2 == 0
                        onPressed: root.currentObjectWrapperIndex = index

                        Label {
                            id: objNameLabel

                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.margins: 5

                            text: modelData.name
                            elide: Text.ElideMiddle
                        }
                    }
                    onCountChanged: {
                        if (count > 0)
                            root.currentObjectWrapperIndex = 0
                        else
                            root.currentObjectWrapperIndex = -1
                    }
                }
            }
        }

        StackLayout {
            id: editorStack

            anchors.left: splitter.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            currentIndex: root.currentObjectWrapperIndex

            Repeater {
                id: tabsRepeater
                model: Simulator.surfaceControllerObjects
                delegate: Item {
                    id: objectViewer

                    property QtObject objectWrapper: modelData

                    implicitHeight: editorStack.height
                    implicitWidth: editorStack.width

                    Row {
                        id: genericButtonRow

                        anchors.right: parent.right
                        anchors.margins: 8
                        spacing: 8
                        height: implicitHeight + 10

                        Repeater {
                            model: objectViewer.objectWrapper ? objectViewer.objectWrapper.objectMethods : null
                            delegate: DecoratedButton {
                                id: genericButton

                                anchors.verticalCenter: parent.verticalCenter
                                property QtObject endpointWrapperWrapper: modelData

                                text: modelData.name

                                onClicked: {
                                    genericButton.endpointWrapperWrapper.callOverRPC()
                                }
                            }
                        }
                    }

                    DecoratedFlickable {
                        id: eventView

                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: genericButtonRow.bottom
                        anchors.bottom: parent.bottom

                        boundsBehavior: Flickable.StopAtBounds

                        clip: true
                        contentWidth: width
                        contentHeight: eventColumn.height

                        Column {
                            id: eventColumn

                            anchors.left: parent.left
                            anchors.right: parent.right

                            Repeater {
                                model: objectViewer.objectWrapper ? objectViewer.objectWrapper.objectEvents : null
                                delegate: DecoratedTableItem {
                                    id: endpointScope

                                    property QtObject endpointWrapperWrapper: modelData

                                    anchors.left: parent.left
                                    anchors.right: parent.right

                                    isAlternate: index % 2 == 0

                                    Label {
                                        anchors.left: parent.left
                                        anchors.right: parent.right
                                        anchors.margins: 8
                                        anchors.verticalCenter: parent.verticalCenter
                                        text: qsTr("Show: %1").arg(modelData.name)
                                        elide: Text.ElideMiddle
                                        color: "#FFFFFF"
                                    }

                                    onClicked: {
                                        endpointScope.endpointWrapperWrapper.callOverRPC()
                                    }
                                }
                            }
                        }
                    }


                    BorderRectangle {
                        id: objectViewerLayoutBorder

                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: genericButtonRow.bottom
                        height: 1

                        color: DrawFunctions.borderColor
                    }
                }
            }
        }

        Splitter {
            id: splitter

            preferredInitialPosition: 250
            minimumPosition: 200
            maximumPosition: 400

            anchors.top: parent.top
            anchors.bottom: parent.bottom

            orientation: Qt.Horizontal
        }
    }
}
