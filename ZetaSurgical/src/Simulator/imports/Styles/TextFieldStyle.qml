import QtQuick 2.14


LabelStyle {
    id: root

    property LabelStyle placeholderTextLabelStyle: LabelStyle {
        lineHeight: root.lineHeight
        horizontalPadding: root.horizontalPadding
        verticalPadding: root.verticalPadding
        font: Qt.font({ pixelSize: root.font["pixelSize"], weight: root.font["weight"], italic: true })
        style: root.style
        color: Qt.darker(root.color, 1.4)
    }

    property color selectionColor: "#31CB6E"

    lineHeight: 14
    horizontalPadding: 8
    verticalPadding: 5
    font: Qt.font({ pixelSize: 12, weight: Font.Normal })
    style: Text.Normal
    color: "#FFFFFF"
}
