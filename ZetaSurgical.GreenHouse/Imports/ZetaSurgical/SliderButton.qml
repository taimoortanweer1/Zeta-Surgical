import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet

//USES BorderImage
//USES ComponentsSet.Label
//USES Item
//USES ComponentsSet.AutoRepeatMouseArea
//PREVIEW IMAGE qrc:/GeneratedComponents/assets/Button.png

//EDITABLE TRUE
Item {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    property bool doubleClickEnabeld: false
    property int minimumRepeatInterval: 100
    property int repeateInterval: 1000
    //FONT Figma::Arial_ArialMT_24_50_0_0_0_0_0.2
    property alias fi_Text_font: fi_Text___default.font
    //TEXTHAL 4
    property alias fi_Text_horizontalAlignment: fi_Text___default.horizontalAlignment
    //REAL 20
    property alias fi_Text_lineHeight: fi_Text___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_Text_lineHeightMode: fi_Text___default.lineHeightMode
    //REAL 1
    property alias fi_Text_opacity: fi_Text___default.opacity
    //BOOL false
    property alias fi_Text_richText: fi_Text___default.richText
    //TRANSLATABLE Text
    property alias fi_Text_text: fi_Text___default.text
    //COLOR Text/White
    property alias fi_Text_textColor: fi_Text___default.textColor
    //TEXTVAL 128
    property alias fi_Text_verticalAlignment: fi_Text___default.verticalAlignment

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------
    signal clicked() /*__mouseArea.clicked*/
    signal doubleClicked() /*__mouseArea.doubleClicked*/
    signal pressed() /*__mouseArea.pressed*/
    signal released() /*__mouseArea.released*/
    signal repeatingTriggered() /*__mouseArea.repeatingTriggered*/

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 136
    height: 80

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    Item {
        id: default_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        BorderImage {
            id: fi_Button_1___default
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: GreenHouseThemeManager.theme.asset("/174_2865.png")
            border.bottom: 39
            border.left: 39
            border.right: 39
            border.top: 39
        }
        ComponentsSet.Label {
            id: fi_Text___default
            anchors.left: parent.left
            anchors.leftMargin: -1
            anchors.right: parent.right
            anchors.rightMargin: -1
            anchors.verticalCenter: parent.verticalCenter
            z: 1
            height: 26
            text: qsTr("Text", "FigmaNode::174:2866") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::174:2866") : "")
            font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_24_50_0_0_0_0_0.2")
            textColor: GreenHouseThemeManager.theme.color("Text/White")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            lineHeight: 20
            lineHeightMode: Text.FixedHeight
        }
    }
    Item {
        id: inactive_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        BorderImage {
            id: fi_Button_1___inactive
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: GreenHouseThemeManager.theme.asset("/174_2895.png")
            border.bottom: 39
            border.left: 39
            border.right: 39
            border.top: 39
        }
        ComponentsSet.Label {
            id: fi_Text___inactive
            anchors.left: parent.left
            anchors.leftMargin: -1
            anchors.right: parent.right
            anchors.rightMargin: -1
            anchors.verticalCenter: parent.verticalCenter
            z: 1
            height: 26
            text: fi_Text___default.text
            font: fi_Text___default.font
            textColor: fi_Text___default.textColor
            opacity: fi_Text___default.opacity
            horizontalAlignment: fi_Text___default.horizontalAlignment
            verticalAlignment: fi_Text___default.verticalAlignment
            wrapMode: Text.WordWrap
            lineHeight: fi_Text___default.lineHeight
            lineHeightMode: fi_Text___default.lineHeightMode
            richText: fi_Text___default.richText
        }
    }
    ComponentsSet.AutoRepeatMouseArea {
        id: __mouseArea
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        z: -1
        doubleClickEnabeld: root.doubleClickEnabeld
        minimumRepeatInterval: root.minimumRepeatInterval
        repeateInterval: root.repeateInterval

        onClicked: {
            root.clicked();
        }
        onDoubleClicked: {
            root.doubleClicked();
        }
        onPressed: {
            root.pressed();
        }
        onReleased: {
            root.released();
        }
        onRepeatingTriggered: {
            root.repeatingTriggered();
        }
    }

    //----------------------------------------------------------------------------------------------

    //States----------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------
}
