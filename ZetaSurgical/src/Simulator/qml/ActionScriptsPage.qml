import QtQuick 2.6
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import Controls 1.0
import Helpers 1.0

import GreenHouse.Simulator 1.0

import "editors"

Item {
    id: actionScriptsView

    Item {
        id: newScriptFrame

        anchors.left: parent.left
        anchors.right: parent.right

        height: Math.max(newScriptNameLabel.height, Math.max(newScriptNameEditor.height, addScriptButton.height)) + 10

        Label {
            id: newScriptNameLabel

            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 10

            color: "#FFFFFF"
            text: qsTr("New Script: %1/").arg(Simulator.activeScriptPath)
        }

        StringEditor {
            id: newScriptNameEditor

            anchors.left: newScriptNameLabel.right
            anchors.right: addScriptButton.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 10
        }

        DecoratedButton {
            id: addScriptButton

            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 10

            text: qsTr("Add")
            enabled: newScriptNameEditor.text !== ""

            onClicked: {
                if (Simulator.activeScriptPath.length > 0)
                    Simulator.addScript(Simulator.activeScriptPath + "/" + newScriptNameEditor.text)
                else
                    Simulator.addScript(newScriptNameEditor.text)
            }
        }
    }

    BorderRectangle {
        id: newScriptFrameBorder

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: newScriptFrame.bottom
        height: 1

        color: DrawFunctions.borderColor
    }

    DecoratedFlickable {
        id: actionView

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: newScriptFrameBorder.bottom
        anchors.bottom: parent.bottom

        boundsBehavior: Flickable.StopAtBounds

        clip: true
        contentWidth: width
        contentHeight: actionColumn.height

        Column {
            id: actionColumn

            width: actionView.width

            Repeater {
                model: Simulator.scripts
                delegate: Rectangle {
                    id: actionScriptDelegateRoot

                    property QtObject actionScript: modelData

                    width: actionView.width - 10
                    height: actionHandle.expanded ? Math.max(actionScriptEdit.y + actionScriptEdit.height, reloadScript.y + reloadScript.height) + 5
                    : reloadScript.y + reloadScript.height + 5

                    color: index % 2 == 0 ? "#4B4B4B" : "#454545"

                    Image {
                        id: actionHandle

                        anchors.left: parent.left
                        anchors.top: actionNameLabel.top
                        anchors.leftMargin: 15
                        anchors.topMargin: 2

                        property bool expanded: false
                        source: expanded ?  "qrc:/GreenHouse/arrow down.png" : "qrc:/GreenHouse/arrow right.png"

                        MouseArea {
                            anchors.fill: parent
                            anchors.margins: -5

                            onClicked: actionHandle.expanded = !actionHandle.expanded
                        }
                    }

                    Column {
                        id: actionNameLabel
                        anchors.left: actionHandle.right
                        anchors.right: reloadScript.left
                        anchors.top: reloadScript.top
                        anchors.margins: 5
                        spacing: 5

                        Label {
                            anchors.left: parent.left
                            anchors.right: parent.right

                            text: actionScriptDelegateRoot.actionScript ? actionScriptDelegateRoot.actionScript.subFolder +":" : ""
                            wrapMode: Text.NoWrap
                            elide: Text.ElideMiddle
                            font.bold: true
                        }

                        Label {
                            anchors.left: parent.left
                            anchors.right: parent.right

                            text: actionScriptDelegateRoot.actionScript ? actionScriptDelegateRoot.actionScript.name : ""
                            wrapMode: Text.NoWrap
                            elide: Text.ElideMiddle
                        }
                    }

                    Image {
                        id: reloadScript

                        anchors.right: triggerScript.left
                        anchors.top: parent.top
                        anchors.margins: 5

                        source: "qrc:/GreenHouse/resync.png"

                        MouseArea {
                            anchors.fill: parent
                            onClicked: actionScriptDelegateRoot.actionScript.reloadHandlerCode()
                        }
                    }

                    DecoratedButton {
                        id: triggerScript

                        anchors.right: parent.right
                        anchors.verticalCenter: reloadScript.verticalCenter
                        anchors.margins: 5

                        text: qsTr("Trigger")

                        onClicked: {
                            if (actionScriptDelegateRoot.actionScript.handlerCode !== actionScriptEdit.text)
                                actionScriptEdit.parseCode()
                            actionScriptDelegateRoot.actionScript.trigger()
                        }
                    }

                    ScriptEditor {
                        id: actionScriptEdit

                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: reloadScript.bottom
                        anchors.margins: 10

                        height: Math.max(128, contentHeight + 20)
                        visible: actionHandle.expanded

                        property bool codeParsed: false
                        text: actionScriptDelegateRoot.actionScript.handlerCode

                        function parseCode() {
                            actionScriptDelegateRoot.actionScript.installHanlder(null)
                            codeParsed = false
                            var handler = Qt.createQmlObject(
                            "import QtQuick 2.0\n"
                            + "import GreenHouse.Simulator 1.0\n"
                            + "import ScriptModules 1.0\n"
                            + "ScriptableObject {\n"
                                + "function trigger() {\n"
                                    + "self.clearTimers()\n"
                                    + text
                                + "\n}"
                            + "\n}", actionScriptEdit)

                            if (handler) {
                                handler.self = actionScriptDelegateRoot.actionScript
                                actionScriptDelegateRoot.actionScript.installHanlder(handler)
                                actionScriptDelegateRoot.actionScript.handlerCode = text
                                codeParsed = true
                            } else {
                                actionScriptDelegateRoot.actionScript.installHanlder(null)
                            }
                        }

                        onEditingFinished: {
                            if (actionScriptDelegateRoot.actionScript.handlerCode !== text)
                                parseCode()
                        }

                        Connections {
                            target: actionScriptDelegateRoot.actionScript
                            function onSyncHandlerCode() { actionScriptEdit.parseCode() }
                        }
                    }
                    Component.onCompleted: actionScriptEdit.parseCode()
                }
            }
        }
    }
}
