import QtQuick 2.14
import QtQuick.Controls 2.14

import Styles 1.0
import Themes 1.0
import Controls 1.0
import Helpers 1.0

DecoratedButton {
    id: root

    text: qsTr("Edit model data")

    width: parent.width
    property QtObject target: null
    property QtObject model: target ? target.value : null

    onClicked: {
        jsonDataEditor.text = root.model ? root.model.modelJsonData : ""
        editDialog.open()
    }

    DecoratedDialog {
        id: editDialog

        anchors.centerIn: parent
        width: parent.width - 60
        height: parent.height - 60

        title: qsTr("Model editor: %1").arg(root.target.name)

        footer: Row {
            id: buttonRow
            anchors.right: parent.right
            spacing: 10
            padding: 4

            DecoratedButton {
                id: buttonCommit
                text: qsTr("Commit")
                width: implicitWidth + 50
                onClicked: {
                    root.model.setModelJsonData(jsonDataEditor.text)
                    jsonDataEditor.text = root.model.modelJsonData
                    Simulator.objectTriggered(root.target)
                }
            }

            DecoratedButton {
                id: buttonAddRow
                text: qsTr("Append Row")
                width: implicitWidth + 50
                onClicked: {
                        var d = {}
                    var l = root.model.roles
                    for (var i = 0; i < l.length; ++i) {
                        d[l[i]] = l[i]
                    }
                    root.model.appendRow(d)
                    jsonDataEditor.text = root.model.modelJsonData
                    Simulator.objectTriggered(root.target)
                }
            }

            DecoratedButton {
                text: qsTr("Close")
                width: implicitWidth + 50
                onClicked: editDialog.close()
            }
        }

        ScriptEditor {
            id: jsonDataEditor

            anchors.fill: parent

            jsonHighlighter: true
            readOnly: root.target && root.target.readOnly
        }
    }
}
