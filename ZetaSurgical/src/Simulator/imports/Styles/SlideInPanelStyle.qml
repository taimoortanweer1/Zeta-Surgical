import QtQuick 2.14

import Helpers 1.0

QtObject {
    id: root

    property real borderWidth: 1
    property color borderColor: DrawFunctions.borderColor
    property color color: DrawFunctions.slideInColor

    property TitleBarStyle titleBar: TitleBarStyle {
        backgroundColor: "#357850"
        horizontalPadding: 10
        verticalPadding: 10
        closeButtonVisible: true
        borderRadius: 5

        title: LabelStyle {
            lineHeight: 22
            horizontalPadding: 0
            verticalPadding: 0
            font: Qt.font({ pixelSize: 18, weight: Font.Normal })
            style: Text.Normal
            color: "#FFFFFF"
        }
    }

    property FormStyle form: FormStyle {
        additionalFieldNameWidth: 10
        fieldNameWidth: 145
        verticalSpacing: 13

        fieldNameLabelStyle: LabelStyle {
            lineHeight: 22
            horizontalPadding: 0
            verticalPadding: 0
            font: Qt.font({ pixelSize: 18, weight: Font.Normal })
            style: Text.Normal
            color: "#FFFFFF"
        }
        fieldValueTextFieldStyle: TextFieldStyle {
            placeholderTextLabelStyle: LabelStyle {
                lineHeight: root.form.fieldValueTextFieldStyle.lineHeight
                horizontalPadding: root.form.fieldValueTextFieldStyle.horizontalPadding
                verticalPadding: root.form.fieldValueTextFieldStyle.verticalPadding
                font: Qt.font({ pixelSize: root.form.fieldValueTextFieldStyle.font["pixelSize"], weight: root.form.fieldValueTextFieldStyle.font["weight"], italic: true })
                style: root.form.fieldValueTextFieldStyle.style
                color: Qt.darker(root.form.fieldValueTextFieldStyle.color, 1.4)
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
}
