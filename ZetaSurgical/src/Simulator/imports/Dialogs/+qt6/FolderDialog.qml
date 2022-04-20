import QtQuick 2.14
import QtQuick.Dialogs as QQD

QQD.FileDialog {
    id: root

    property string labelText: ""

    title: qsTr("Please choose a directory.")
}
