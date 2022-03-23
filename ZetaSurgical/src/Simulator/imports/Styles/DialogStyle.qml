import QtQuick 2.14


QtObject {
    id: root

    property TitleBarStyle titleBar: TitleBarStyle {
        backgroundColor: "#357850"
        horizontalPadding: 10
        verticalPadding: 6
        closeButtonVisible: true
        borderRadius: 5

        title: LabelStyle {
            lineHeight: 22
            horizontalPadding: 0
            verticalPadding: 0
            font: Qt.font({ pixelSize: 12, weight: Font.Normal })
            style: Text.Normal
            color: "#FFFFFF"
        }
    }

    property FormStyle form: FormStyle {
        additionalFieldNameWidth: 10
        fieldNameWidth: 100
        verticalSpacing: 9

        fieldNameLabelStyle: LabelStyle {
            lineHeight: 22
            horizontalPadding: 0
            verticalPadding: 0
            font: Qt.font({ pixelSize: 12, weight: Font.Normal })
            style: Text.Normal
            color: "#FFFFFF"
        }
        warningLabelStyle: LabelStyle {
            lineHeight: 22
            horizontalPadding: 0
            verticalPadding: 0
            font: Qt.font({ pixelSize: 12, weight: Font.Normal })
            style: Text.Normal
            color: "#FF0000"
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
            lineHeight: 14
            horizontalPadding: 15
            verticalPadding: 5
            font: Qt.font({ pixelSize: 12, weight: Font.Normal })
            style: Text.Normal
            color: "#FFFFFF"
        }
    }
}
