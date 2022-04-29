import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet

//USES BorderImage
//USES ComponentsSet.Label

//EDITABLE TRUE
Item {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    //FONT Figma::Arial_BoldMT_28_75_0_0_0_0_0
    property alias fi_01_font: fi_01.font
    //TEXTHAL 4
    property alias fi_01_horizontalAlignment: fi_01.horizontalAlignment
    //COLOR Text/White
    property alias fi_01_labelColor: fi_01.textColor
    //REAL 16
    property alias fi_01_lineHeight: fi_01.lineHeight
    //TEXTLINEHM 1
    property alias fi_01_lineHeightMode: fi_01.lineHeightMode
    //REAL 1
    property alias fi_01_opacity: fi_01.opacity
    //BOOL false
    property alias fi_01_richText: fi_01.richText
    //TRANSLATABLE 0.1
    property alias fi_01_text: fi_01.text
    //TEXTVAL 128
    property alias fi_01_verticalAlignment: fi_01.verticalAlignment

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 96
    height: 40

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    BorderImage {
        id: fi_Rectangle_109
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: GreenHouseThemeManager.theme.asset("/174_2734.png")
        border.bottom: 19
        border.left: 19
        border.right: 19
        border.top: 19
    }
    ComponentsSet.Label {
        id: fi_01
        anchors.left: parent.left
        anchors.leftMargin: -1
        anchors.right: parent.right
        anchors.rightMargin: -1
        anchors.top: parent.top
        anchors.topMargin: -1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -1
        z: 1
        text: qsTr("0.1", "FigmaNode::174:2735") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::174:2735") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_BoldMT_28_75_0_0_0_0_0")
        textColor: GreenHouseThemeManager.theme.color("Text/White")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 16
        lineHeightMode: Text.FixedHeight
    }

    //----------------------------------------------------------------------------------------------

    //States----------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------
}
