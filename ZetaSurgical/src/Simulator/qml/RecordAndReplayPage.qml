import QtQuick 2.6
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import Controls 1.0
import Dialogs 1.0
import Helpers 1.0

import GreenHouse.Simulator 1.0

Item {
    id: root

    clip: true
    Row {
        id: sessionControlsRow

        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 5
        spacing: 5

        DecoratedButton {
            id: loadButton

            enabled: !recButton.toggled
                     && (!Simulator.generic || (Simulator.activeConnections > 0 && Simulator.name !== ""))

            text: qsTr("Load")

            onClicked: loadDialog.open()

            FileDialog {
                id: loadDialog

                title: qsTr("Please choose an object interaction file")
                nameFilters: [ "Object interaction file (*.oif)" ]
                selectExisting: true

                onAccepted: {
                    Simulator.loadSession(file)
                }
            }
        }

        DecoratedButton {
            id: saveButton

            enabled: !recButton.toggled && sessionView.count > 0

            text: qsTr("Save")

            onClicked: saveDialog.open()

            FileDialog {
                id: saveDialog

                title: qsTr("Please choose an object interaction file")
                nameFilters: [ "Object interaction file (*.oif)" ]

                onAccepted: {
                    if (file.toString().endsWith(".oif"))
                        Simulator.saveSession(file)
                    else
                        Simulator.saveSession(file + ".oif")
                }
            }
        }
    }

    Row {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 5
        spacing: 5

        DecoratedButton {
            Image {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 3
                width: 0.7*parent.height
                height: 0.7*parent.height
                source: "qrc:/assets/ui_components/uireport.png"
                fillMode: Image.PreserveAspectFit
            }

            width: implicitWidth + (height * 0.7) + 10
            text: qsTr("Request UI Report")

            enabled: recButton.toggled
            onClicked: {
                Simulator.requestUIStringRegistry()
                Simulator.captureScreen()
            }
        }

        DecoratedButton {
            id: recButton

            anchors.verticalCenter: parent.verticalCenter

            text: toggled ? qsTr("Stop Recording") : qsTr("Start Recording")

            enabled: !Simulator.generic || (Simulator.activeConnections > 0 && Simulator.name !== "")
            toggled: Simulator.sessionRecordingActive
            onClicked: {
                if (Simulator.sessionRecordingActive) {
                    Simulator.sessionRecordingActive = false
                } else {
                    Simulator.sessionRecordingActive = true
                }
            }
        }

        DecoratedButton {
            id: replayButton

            anchors.verticalCenter: parent.verticalCenter

            text: qsTr("Replay")
            enabled: !recButton.toggled
                     && (!Simulator.generic || (Simulator.activeConnections > 0 && Simulator.name !== ""))
                     && sessionView.count > 0

            onClicked: Simulator.replaySession(createReplayReport.checked);
        }

        DecoratedCheckBox {
            id: createReplayReport

            anchors.verticalCenter: parent.verticalCenter

            text: qsTr("Create replay report")
            enabled: replayButton.enabled
            checked: true
        }
    }

    Item {
        id: sessionFrame

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: sessionControlsRow.bottom
        anchors.bottom: parent.bottom
        anchors.margins: 5

        clip: true

        DecoratedListView {
            id: sessionView

            anchors.fill: parent

            clip: true

            boundsBehavior: ListView.StopAtBounds
            model: Simulator.sessionModel
            delegate: DecoratedTableItem {
                anchors.left: parent ? parent.left : undefined
                anchors.right: parent ? parent.right : undefined

                isAlternate: index % 2 == 0

                Label {
                    anchors.left: parent.left
                    anchors.right: removeSessionPoint.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.margins: 5

                    visible: !delayStepRow.visible
                    text: stepLabel
                    elide: Text.ElideMiddle
                    color: "#FFFFFF"
                }

                Row {
                    id: delayStepRow
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.margins: 5
                    spacing: 5

                    visible: stepType === "delay"

                    DecoratedLabel {
                        anchors.verticalCenter: parent.verticalCenter

                        text: qsTr("Pause for:")
                    }

                    DecoratedSpinBox {
                        id: delayStepSpinBox

                        anchors.verticalCenter: parent.verticalCenter
                        from: 10
                        to: 1000 * 60 * 15

                        onValueChanged: {
                            if (visible) {
                                Simulator.sessionModel.editAt(index, value)
                            }
                        }
                    }

                    DecoratedLabel {
                        anchors.verticalCenter: parent.verticalCenter

                        text: qsTr("[ms]")
                    }
                }

                RemoveButton {
                    id: removeSessionPoint

                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.margins: 5

                    onClicked: Simulator.sessionModel.removeAt(index)
                }

                Component.onCompleted: {
                    if (stepType === "delay") {
                        delayStepSpinBox.value = stepValue
                    }
                }
            }

            onContentHeightChanged: {
                if (Simulator.sessionRecordingActive)
                    positionViewAtEnd()
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
