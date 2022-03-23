import QtQuick 2.14
import Qt.labs.platform 1.1 as QQD

QQD.FileDialog {
    id: root

    property string labelText: ""

    title: qsTr("Please choose a directory.")
}
