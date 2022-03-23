pragma Singleton

import QtQuick 2.14

import Styles 1.0


BaseTheme {
    id: root

    dialogStyle: DialogStyle {}
    formStyle: FormStyle {}
    propertyEditorFormStyle: FormStyle {
        additionalFieldNameWidth: 7
        fieldNameWidth: 145
        verticalSpacing: 9

        fieldNameLabelStyle: LabelStyle {
            lineHeight: 14
            horizontalPadding: 0
            verticalPadding: 0
            font: Qt.font({ pixelSize: 12, weight: Font.Normal })
            style: Text.Normal
            color: "#FFFFFF"
        }
        fieldValueTextFieldStyle: TextFieldStyle {
            placeholderTextLabelStyle: LabelStyle {
                lineHeight: root.propertyEditorFormStyle.fieldValueTextFieldStyle.lineHeight
                horizontalPadding: root.propertyEditorFormStyle.fieldValueTextFieldStyle.horizontalPadding
                verticalPadding: root.propertyEditorFormStyle.fieldValueTextFieldStyle.verticalPadding
                font: Qt.font({ pixelSize: root.propertyEditorFormStyle.fieldValueTextFieldStyle.font["pixelSize"], weight: root.propertyEditorFormStyle.fieldValueTextFieldStyle.font["weight"], italic: true })
                style: root.propertyEditorFormStyle.fieldValueTextFieldStyle.style
                color: Qt.darker(root.propertyEditorFormStyle.fieldValueTextFieldStyle.color, 1.4)
            }
            selectionColor: "#31CB6E"
            lineHeight: 14
            horizontalPadding: 8
            verticalPadding: 5
            font: Qt.font({ pixelSize: 12, weight: Font.Normal })
            style: Text.Normal
            color: "#FFFFFF"
        }
    }
    labelStyle: LabelStyle {}
    slideInPanelStyle: SlideInPanelStyle {}
    textFieldStyle: TextFieldStyle {}
    topBarTextFieldStyle: TextFieldStyle {
        placeholderTextLabelStyle: LabelStyle {
            lineHeight: root.topBarTextFieldStyle.lineHeight
            horizontalPadding: root.topBarTextFieldStyle.horizontalPadding
            verticalPadding: root.topBarTextFieldStyle.verticalPadding
            font: Qt.font({ pixelSize: root.topBarTextFieldStyle.font["pixelSize"], weight: root.topBarTextFieldStyle.font["weight"], italic: true })
            style: root.topBarTextFieldStyle.style
            color: Qt.darker(root.topBarTextFieldStyle.color, 1.4)
        }

        selectionColor: root.textFieldStyle.selectionColor

        lineHeight: root.textFieldStyle.lineHeight
        horizontalPadding: root.textFieldStyle.horizontalPadding
        verticalPadding: 4
        font: root.textFieldStyle.font
        style: root.textFieldStyle.style
        color: root.textFieldStyle.color
    }
    titleBarStyle: TitleBarStyle {}
}
