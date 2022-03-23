import QtQuick 2.14


QtObject {
    id: root

    property int additionalFieldNameWidth: 10
    property int fieldNameWidth: 145
    property int verticalSpacing: 13
    property int contentBottomPadding: 5
    property int footerTopPadding: 0
    property int footerBottomPadding: 10
    property int footerHorizontalPadding: 25
    property int footerSpacing: 15

    property LabelStyle fieldNameLabelStyle: LabelStyle {
        lineHeight: 22
        horizontalPadding: 0
        verticalPadding: 0
        font: Qt.font({ pixelSize: 18, weight: Font.Normal })
        style: Text.Normal
        color: "#FF0000"
    }
    property LabelStyle warningLabelStyle: LabelStyle {
        lineHeight: 22
        horizontalPadding: 0
        verticalPadding: 0
        font: Qt.font({ pixelSize: 18, weight: Font.Normal })
        style: Text.Normal
        color: "#FF0000"
    }
    property TextFieldStyle fieldValueTextFieldStyle: TextFieldStyle {
        placeholderTextLabelStyle: LabelStyle {
            lineHeight: root.fieldValueTextFieldStyle.lineHeight
            horizontalPadding: root.fieldValueTextFieldStyle.horizontalPadding
            verticalPadding: root.fieldValueTextFieldStyle.verticalPadding
            font: Qt.font({ pixelSize: root.fieldValueTextFieldStyle.font["pixelSize"], weight: root.fieldValueTextFieldStyle.font["weight"], italic: true })
            style: root.fieldValueTextFieldStyle.style
            color: Qt.darker(root.fieldValueTextFieldStyle.color, 1.4)
        }
        selectionColor: "#31CB6E"
        lineHeight: 22
        horizontalPadding: 15
        verticalPadding: 8
        font: Qt.font({ pixelSize: 18, weight: Font.Normal })
        style: Text.Normal
        color: "#FFFFFF"
    }
}
