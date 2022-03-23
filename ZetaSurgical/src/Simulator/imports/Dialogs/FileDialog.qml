import QtQuick 2.14
import Qt.labs.platform 1.1 as QQD

QQD.FileDialog {
    id: root

    property string labelText: ""
    readonly property alias fileUrl: root.file

    title: qsTr("Please choose a file.")

    property bool selectFolder: false
    property bool selectExisting: false
    fileMode: selectExisting ? FileDialog.OpenFile : FileDialog.SaveFile
}
