import QtQuick 2.14

QtObject {
    id: root
    property LabelStyle style: LabelStyle {
        horizontalPadding: 0
        verticalPadding: 0
        lineHeight: 12
        font: Qt.font({ pixelSize: 9, weight: Font.Black })
        style: Text.Normal
        color: "#FFFFFF"
    }
}
