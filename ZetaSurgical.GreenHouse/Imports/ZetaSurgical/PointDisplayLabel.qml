import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet
import ZetaSurgical 1.0 as ZetaSurgicalSet

//USES Image
//USES ComponentsSet.Label
//USES ZetaSurgicalSet.CoordinateDisplayLabel

//EDITABLE TRUE
Item {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    //FONT Figma::Arial_BoldMT_28_75_0_0_0_0_0
    property alias fi_CoordinateDisplayLabel_fi_01_font: fi_CoordinateDisplayLabel.fi_01_font
    //TEXTHAL 4
    property alias fi_CoordinateDisplayLabel_fi_01_horizontalAlignment: fi_CoordinateDisplayLabel.fi_01_horizontalAlignment
    //COLOR Text/White
    property alias fi_CoordinateDisplayLabel_fi_01_labelColor: fi_CoordinateDisplayLabel.fi_01_labelColor
    //REAL 16
    property alias fi_CoordinateDisplayLabel_fi_01_lineHeight: fi_CoordinateDisplayLabel.fi_01_lineHeight
    //TEXTLINEHM 1
    property alias fi_CoordinateDisplayLabel_fi_01_lineHeightMode: fi_CoordinateDisplayLabel.fi_01_lineHeightMode
    //REAL 1
    property alias fi_CoordinateDisplayLabel_fi_01_opacity: fi_CoordinateDisplayLabel.fi_01_opacity
    //BOOL false
    property alias fi_CoordinateDisplayLabel_fi_01_richText: fi_CoordinateDisplayLabel.fi_01_richText
    //TRANSLATABLE 0.1
    property alias fi_CoordinateDisplayLabel_fi_01_text: fi_CoordinateDisplayLabel.fi_01_text
    //TEXTVAL 128
    property alias fi_CoordinateDisplayLabel_fi_01_verticalAlignment: fi_CoordinateDisplayLabel.fi_01_verticalAlignment
    //REAL 1
    property alias fi_Ellipse_232_opacity: fi_Ellipse_232.opacity
    //ASSET /174_2720.png
    property alias fi_Ellipse_232_source: fi_Ellipse_232.source
    //FONT Figma::Arial_ArialMT_18_50_0_0_0_0_0.2
    property alias fi_LeftRightLabel_font: fi_LeftRightLabel.font
    //TEXTHAL 4
    property alias fi_LeftRightLabel_horizontalAlignment: fi_LeftRightLabel.horizontalAlignment
    //COLOR Dark Ink
    property alias fi_LeftRightLabel_labelColor: fi_LeftRightLabel.textColor
    //REAL 20
    property alias fi_LeftRightLabel_lineHeight: fi_LeftRightLabel.lineHeight
    //TEXTLINEHM 1
    property alias fi_LeftRightLabel_lineHeightMode: fi_LeftRightLabel.lineHeightMode
    //REAL 1
    property alias fi_LeftRightLabel_opacity: fi_LeftRightLabel.opacity
    //BOOL false
    property alias fi_LeftRightLabel_richText: fi_LeftRightLabel.richText
    //TRANSLATABLE L-R
    property alias fi_LeftRightLabel_text: fi_LeftRightLabel.text
    //TEXTVAL 128
    property alias fi_LeftRightLabel_verticalAlignment: fi_LeftRightLabel.verticalAlignment
    //FONT Figma::Arial_ArialMT_18_50_0_0_0_0_0.2
    property alias fi_UpDownLabel_font: fi_UpDownLabel.font
    //TEXTHAL 4
    property alias fi_UpDownLabel_horizontalAlignment: fi_UpDownLabel.horizontalAlignment
    //COLOR Dark Ink
    property alias fi_UpDownLabel_labelColor: fi_UpDownLabel.textColor
    //REAL 20
    property alias fi_UpDownLabel_lineHeight: fi_UpDownLabel.lineHeight
    //TEXTLINEHM 1
    property alias fi_UpDownLabel_lineHeightMode: fi_UpDownLabel.lineHeightMode
    //REAL 1
    property alias fi_UpDownLabel_opacity: fi_UpDownLabel.opacity
    //BOOL false
    property alias fi_UpDownLabel_richText: fi_UpDownLabel.richText
    //TRANSLATABLE A-P
    property alias fi_UpDownLabel_text: fi_UpDownLabel.text
    //TEXTVAL 128
    property alias fi_UpDownLabel_verticalAlignment: fi_UpDownLabel.verticalAlignment

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 196
    height: 196

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    Image {
        id: fi_Ellipse_232
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: 188
        height: 188
        source: GreenHouseThemeManager.theme.asset("/174_2720.png")
    }
    ComponentsSet.Label {
        id: fi_LeftRightLabel
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 2
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 14
        z: 1
        width: 34
        height: 26
        text: qsTr("L-R", "FigmaNode::174:2727") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::174:2727") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_18_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Dark Ink")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }
    ComponentsSet.Label {
        id: fi_UpDownLabel
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 2
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -58
        z: 2
        width: 34
        height: 26
        text: qsTr("A-P", "FigmaNode::174:2728") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::174:2728") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_18_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Dark Ink")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }
    ZetaSurgicalSet.CoordinateDisplayLabel {
        id: fi_CoordinateDisplayLabel
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -26
        z: 4
        width: 100
    }

    //----------------------------------------------------------------------------------------------

    //States----------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------
}
