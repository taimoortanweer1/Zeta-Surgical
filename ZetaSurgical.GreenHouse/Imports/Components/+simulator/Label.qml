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

        property var stringDictionary: []
        function registerUiStrings() {
            if (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null) {
                for (var i = 0; i < stringDictionary.length; ++i)
                    GreenHouseTestFixture.registerUIString(stringDictionary[i], textLabel)
            }
        }
        function unregisterUiStrings() {
            if (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null) {
                for (var i = 0; i < stringDictionary.length; ++i)
                    GreenHouseTestFixture.unregisterUIString(stringDictionary[i], textLabel)
            }
        }
        function processText(str) {
            if (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null) {
                if (visible)
                    unregisterUiStrings();
                stringDictionary = GreenHouseTestFixture.stringDictionary(str);
                text = str;
                if (visible)
                    registerUiStrings();
            } else {
                text = str;
            }
        }
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        width: textLabel.contentWidth
        height: textLabel.contentHeight

        visible: textBounding.active && (width > textBounding.width || height > textBounding.height)

        color: "#88ff5757"
        border.width: 1
        border.color: "#ff5757"
    }

    Rectangle {
        id: textBounding

        anchors.fill: parent

        property bool active: {
            var isActive = false;
            if (GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null) {
                for (var i = 0; i < textLabel.stringDictionary.length; ++i) {
                    isActive = GreenHouseTestFixture.activeTextIds.indexOf(textLabel.stringDictionary[i]) !== -1;
                    if (isActive)
                        break;
                }
            }
            return isActive;
        }

        visible: active

        color: "#885DFF9D"
        border.width: 1
        border.color: "#5DFF9D"
    }

    onVisibleChanged: {
        if (visible)
            textLabel.registerUiStrings();
        else
            textLabel.unregisterUiStrings();
    }
    onTextChanged: textLabel.processText(text);
    Component.onDestruction: textLabel.unregisterUiStrings();
}
