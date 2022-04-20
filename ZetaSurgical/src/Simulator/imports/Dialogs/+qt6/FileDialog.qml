import QtQuick 2.14
import QtQuick.Dialogs as QQD

QQD.FileDialog {
    id: root

    property string labelText: ""
    readonly property alias fileUrl: root.selectedFile

    title: qsTr("Please choose a file.")

    property bool selectFolder: true
    property bool selectExisting: false
    fileMode: selectExisting ? FileDialog.OpenFile : FileDialog.SaveFile
}
