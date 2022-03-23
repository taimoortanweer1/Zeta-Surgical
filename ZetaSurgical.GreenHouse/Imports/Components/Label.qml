import QtQuick 2.0
import GreenHouse.Theming 1.0

//PREVIEW IMAGE qrc:/DefaultComponentSet/PreviewAssets/Label.png
Item {
    id: root

    //TRANSLATABLE
    property string text: "Lorem ipsum"
    //FONT textFont
    property alias font: textLabel.font
    //COLOR textColor
    property color textColor: GreenHouseThemeManager.theme.color("textColor")
    //COLOR transparent
    property color backgroundColor: GreenHouseThemeManager.theme.color("transparent")

    property alias contentHeight: textLabel.contentHeight
    property alias contentWidth: textLabel.contentWidth
    //TEXTELIDEM 3
    property alias elide: textLabel.elide
    //TEXTHAL 1
    property alias horizontalAlignment: textLabel.horizontalAlignment
    property alias lineCount: textLabel.lineCount
    //REAL 1.0
    property alias lineHeight: textLabel.lineHeight
    //TEXTLINEHM 0
    property alias lineHeightMode: textLabel.lineHeightMode
    property alias linkColor: textLabel.linkColor
    property alias maximumLineCount: textLabel.maximumLineCount
    property alias minimumPixelSize: textLabel.minimumPixelSize
    property alias minimumPointSize: textLabel.minimumPointSize
    property alias paintedWidth: textLabel.paintedWidth
    property alias paintedHeight: textLabel.paintedHeight
    property alias renderType: textLabel.renderType
    //TEXTWRAPM 0
    property alias wrapMode: textLabel.wrapMode
    //TEXTVAL 32
    property alias verticalAlignment: textLabel.verticalAlignment
    property bool richText: false

    //NOTE: We can't use implicitHeight for wrapped text as that breaks multi line eliding
    implicitHeight: textLabel.wrapMode === Text.NoWrap ? textLabel.implicitHeight : textLabel.contentHeight
    implicitWidth: textLabel.contentWidth

    Text {
        id: textLabel

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        elide: Text.ElideNone
        wrapMode: Text.NoWrap

        lineHeightMode: Text.ProportionalHeight
        lineHeight: 1
        color: GreenHouseThemeManager.theme.foregroundColor(root.backgroundColor, root.textColor)
        font: GreenHouseThemeManager.theme.font("textFont")

        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        textFormat: root.richText ? Text.RichText : Text.AutoText
        text: root.text
    }
}
