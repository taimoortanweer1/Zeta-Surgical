import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet

//USES BorderImage
//USES ComponentsSet.Label
//PREVIEW IMAGE qrc:/GeneratedComponents/assets/Panel.png

//EDITABLE TRUE
Item {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    //FONT Figma::Arial_ArialMT_24_50_0_0_0_0_0.2
    property alias fi_Label_font: fi_Label.font
    //TEXTHAL 1
    property alias fi_Label_horizontalAlignment: fi_Label.horizontalAlignment
    //COLOR Dark Ink
    property alias fi_Label_labelColor: fi_Label.textColor
    //REAL 20
    property alias fi_Label_lineHeight: fi_Label.lineHeight
    //TEXTLINEHM 1
    property alias fi_Label_lineHeightMode: fi_Label.lineHeightMode
    //REAL 1
    property alias fi_Label_opacity: fi_Label.opacity
    //BOOL false
    property alias fi_Label_richText: fi_Label.richText
    //TRANSLATABLE Image Type:
    property alias fi_Label_text: fi_Label.text
    //TEXTVAL 128
    property alias fi_Label_verticalAlignment: fi_Label.verticalAlignment
    //FONT Figma::Arial_ArialMT_32_50_0_0_0_0_0.2
    property alias fi_Scan_Metadata_font: fi_Scan_Metadata.font
    //TEXTHAL 4
    property alias fi_Scan_Metadata_horizontalAlignment: fi_Scan_Metadata.horizontalAlignment
    //COLOR Dark Ink
    property alias fi_Scan_Metadata_labelColor: fi_Scan_Metadata.textColor
    //REAL 32
    property alias fi_Scan_Metadata_lineHeight: fi_Scan_Metadata.lineHeight
    //TEXTLINEHM 1
    property alias fi_Scan_Metadata_lineHeightMode: fi_Scan_Metadata.lineHeightMode
    //REAL 1
    property alias fi_Scan_Metadata_opacity: fi_Scan_Metadata.opacity
    //BOOL false
    property alias fi_Scan_Metadata_richText: fi_Scan_Metadata.richText
    //TRANSLATABLE Scan Metadata
    property alias fi_Scan_Metadata_text: fi_Scan_Metadata.text
    //TEXTVAL 128
    property alias fi_Scan_Metadata_verticalAlignment: fi_Scan_Metadata.verticalAlignment
    //FONT Figma::Arial_ArialMT_24_50_0_0_0_0_0.2
    property alias fi_TextOutput_font: fi_TextOutput.font
    //TEXTHAL 1
    property alias fi_TextOutput_horizontalAlignment: fi_TextOutput.horizontalAlignment
    //COLOR Dark Ink
    property alias fi_TextOutput_labelColor: fi_TextOutput.textColor
    //REAL 20
    property alias fi_TextOutput_lineHeight: fi_TextOutput.lineHeight
    //TEXTLINEHM 1
    property alias fi_TextOutput_lineHeightMode: fi_TextOutput.lineHeightMode
    //REAL 1
    property alias fi_TextOutput_opacity: fi_TextOutput.opacity
    //BOOL false
    property alias fi_TextOutput_richText: fi_TextOutput.richText
    //TRANSLATABLE insert text here
    property alias fi_TextOutput_text: fi_TextOutput.text
    //TEXTVAL 128
    property alias fi_TextOutput_verticalAlignment: fi_TextOutput.verticalAlignment

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 800
    height: 816

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    BorderImage {
        id: fi_Rectangle_142
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: GreenHouseThemeManager.theme.asset("/164_8534.png")
        border.bottom: 50
        border.left: 50
        border.right: 50
        border.top: 50
    }
    ComponentsSet.Label {
        id: fi_Scan_Metadata
        anchors.left: parent.left
        anchors.leftMargin: 31
        anchors.right: parent.right
        anchors.rightMargin: 31
        anchors.top: parent.top
        anchors.topMargin: 31
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 735
        z: 1
        text: qsTr("Scan Metadata", "FigmaNode::164:8535") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:8535") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_32_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Dark Ink")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 32
        lineHeightMode: Text.FixedHeight
    }
    ComponentsSet.Label {
        id: fi_Label
        anchors.left: parent.left
        anchors.leftMargin: 31
        anchors.top: parent.top
        anchors.topMargin: 111
        z: 18
        width: 274
        height: 34
        text: qsTr("Image Type:", "FigmaNode::164:8536") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:8536") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_24_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Dark Ink")
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }
    ComponentsSet.Label {
        id: fi_TextOutput
        anchors.left: parent.left
        anchors.leftMargin: 303
        anchors.top: parent.top
        anchors.topMargin: 751
        z: 35
        width: 466
        height: 34
        text: qsTr("insert text here", "FigmaNode::164:8586") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:8586") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_24_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Dark Ink")
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }

    //----------------------------------------------------------------------------------------------

    //States----------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------
}
