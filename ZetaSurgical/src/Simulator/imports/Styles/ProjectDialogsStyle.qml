import QtQuick 2.14


DialogStyle {
    id: root

    titleBar.verticalPadding: 10
    titleBar.title.font: Qt.font({ pixelSize: 18, weight: Font.Normal })

    form.fieldNameWidth: 145
    form.verticalSpacing: 13
    form.fieldNameLabelStyle.font: Qt.font({ pixelSize: 18, weight: Font.Normal })

    form.fieldValueTextFieldStyle.lineHeight: 22
    form.fieldValueTextFieldStyle.verticalPadding: 5
    form.fieldValueTextFieldStyle.font: Qt.font({ pixelSize: 18, weight: Font.Normal })

}
