import QtQuick 2.14


QtObject {
    property real lineHeight: 16
    property real horizontalPadding: 0
    property real verticalPadding: 0
    property font font: Qt.font({ pixelSize: 14, weight: Font.Normal })
    property int style: Text.Normal
    property int horizontalAlignment: Text.AlignLeft
    property int verticalAlignment: Text.AlignVCenter
    property color color: "#FFFFFF"
}
