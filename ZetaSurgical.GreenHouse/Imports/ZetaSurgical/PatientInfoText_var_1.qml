import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet

//USES ComponentsSet.Label

//EDITABLE TRUE
Item {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    //FONT Figma::Arial_ArialMT_32_50_0_0_0_0_0.2
    property alias fi_01_01_1990_font: fi_01_01_1990.font
    //TEXTHAL 1
    property alias fi_01_01_1990_horizontalAlignment: fi_01_01_1990.horizontalAlignment
    //COLOR Text/Blue 2 - Input
    property alias fi_01_01_1990_labelColor: fi_01_01_1990.textColor
    //REAL 32
    property alias fi_01_01_1990_lineHeight: fi_01_01_1990.lineHeight
    //TEXTLINEHM 1
    property alias fi_01_01_1990_lineHeightMode: fi_01_01_1990.lineHeightMode
    //REAL 1
    property alias fi_01_01_1990_opacity: fi_01_01_1990.opacity
    //BOOL false
    property alias fi_01_01_1990_richText: fi_01_01_1990.richText
    //TRANSLATABLE 01/01/1990
    property alias fi_01_01_1990_text: fi_01_01_1990.text
    //TEXTVAL 128
    property alias fi_01_01_1990_verticalAlignment: fi_01_01_1990.verticalAlignment
    //FONT Figma::Arial_ArialMT_32_50_0_0_0_0_0.2
    property alias fi_9089123423_font: fi_9089123423.font
    //TEXTHAL 1
    property alias fi_9089123423_horizontalAlignment: fi_9089123423.horizontalAlignment
    //COLOR Text/Blue 2 - Input
    property alias fi_9089123423_labelColor: fi_9089123423.textColor
    //REAL 32
    property alias fi_9089123423_lineHeight: fi_9089123423.lineHeight
    //TEXTLINEHM 1
    property alias fi_9089123423_lineHeightMode: fi_9089123423.lineHeightMode
    //REAL 1
    property alias fi_9089123423_opacity: fi_9089123423.opacity
    //BOOL false
    property alias fi_9089123423_richText: fi_9089123423.richText
    //TRANSLATABLE 9089123423
    property alias fi_9089123423_text: fi_9089123423.text
    //TEXTVAL 128
    property alias fi_9089123423_verticalAlignment: fi_9089123423.verticalAlignment
    //FONT Figma::Arial_ItalicMT_22_50_0_1_0_0_0.2
    property alias fi_Date_of_Birth__font: fi_Date_of_Birth_.font
    //TEXTHAL 1
    property alias fi_Date_of_Birth__horizontalAlignment: fi_Date_of_Birth_.horizontalAlignment
    //COLOR Outline/White
    property alias fi_Date_of_Birth__labelColor: fi_Date_of_Birth_.textColor
    //REAL 30
    property alias fi_Date_of_Birth__lineHeight: fi_Date_of_Birth_.lineHeight
    //TEXTLINEHM 1
    property alias fi_Date_of_Birth__lineHeightMode: fi_Date_of_Birth_.lineHeightMode
    //REAL 1
    property alias fi_Date_of_Birth__opacity: fi_Date_of_Birth_.opacity
    //BOOL false
    property alias fi_Date_of_Birth__richText: fi_Date_of_Birth_.richText
    //TRANSLATABLE Date of Birth:
    property alias fi_Date_of_Birth__text: fi_Date_of_Birth_.text
    //TEXTVAL 128
    property alias fi_Date_of_Birth__verticalAlignment: fi_Date_of_Birth_.verticalAlignment
    //FONT Figma::Arial_ArialMT_32_50_0_0_0_0_0.2
    property alias fi_John_Doe_font: fi_John_Doe.font
    //TEXTHAL 1
    property alias fi_John_Doe_horizontalAlignment: fi_John_Doe.horizontalAlignment
    //COLOR Text/Blue 2 - Input
    property alias fi_John_Doe_labelColor: fi_John_Doe.textColor
    //REAL 32
    property alias fi_John_Doe_lineHeight: fi_John_Doe.lineHeight
    //TEXTLINEHM 1
    property alias fi_John_Doe_lineHeightMode: fi_John_Doe.lineHeightMode
    //REAL 1
    property alias fi_John_Doe_opacity: fi_John_Doe.opacity
    //BOOL false
    property alias fi_John_Doe_richText: fi_John_Doe.richText
    //TRANSLATABLE John Doe
    property alias fi_John_Doe_text: fi_John_Doe.text
    //TEXTVAL 128
    property alias fi_John_Doe_verticalAlignment: fi_John_Doe.verticalAlignment
    //FONT Figma::Arial_ItalicMT_22_50_0_1_0_0_0.2
    property alias fi_MRN__font: fi_MRN_.font
    //TEXTHAL 1
    property alias fi_MRN__horizontalAlignment: fi_MRN_.horizontalAlignment
    //COLOR Outline/White
    property alias fi_MRN__labelColor: fi_MRN_.textColor
    //REAL 30
    property alias fi_MRN__lineHeight: fi_MRN_.lineHeight
    //TEXTLINEHM 1
    property alias fi_MRN__lineHeightMode: fi_MRN_.lineHeightMode
    //REAL 1
    property alias fi_MRN__opacity: fi_MRN_.opacity
    //BOOL false
    property alias fi_MRN__richText: fi_MRN_.richText
    //TRANSLATABLE MRN:
    property alias fi_MRN__text: fi_MRN_.text
    //TEXTVAL 128
    property alias fi_MRN__verticalAlignment: fi_MRN_.verticalAlignment
    //FONT Figma::Arial_ItalicMT_22_50_0_1_0_0_0.2
    property alias fi_Patient_Name__font: fi_Patient_Name_.font
    //TEXTHAL 1
    property alias fi_Patient_Name__horizontalAlignment: fi_Patient_Name_.horizontalAlignment
    //COLOR Outline/White
    property alias fi_Patient_Name__labelColor: fi_Patient_Name_.textColor
    //REAL 30
    property alias fi_Patient_Name__lineHeight: fi_Patient_Name_.lineHeight
    //TEXTLINEHM 1
    property alias fi_Patient_Name__lineHeightMode: fi_Patient_Name_.lineHeightMode
    //REAL 1
    property alias fi_Patient_Name__opacity: fi_Patient_Name_.opacity
    //BOOL false
    property alias fi_Patient_Name__richText: fi_Patient_Name_.richText
    //TRANSLATABLE Patient Name:
    property alias fi_Patient_Name__text: fi_Patient_Name_.text
    //TEXTVAL 128
    property alias fi_Patient_Name__verticalAlignment: fi_Patient_Name_.verticalAlignment

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 864
    height: 128

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    ComponentsSet.Label {
        id: fi_Date_of_Birth_
        anchors.left: parent.left
        anchors.leftMargin: -1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 7
        width: 178
        height: 34
        text: qsTr("Date of Birth:", "FigmaNode::164:8231") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:8231") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ItalicMT_22_50_0_1_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Outline/White")
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 30
        lineHeightMode: Text.FixedHeight
    }
    ComponentsSet.Label {
        id: fi_MRN_
        anchors.left: parent.left
        anchors.leftMargin: -1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 47
        z: 1
        width: 178
        height: 34
        text: qsTr("MRN:", "FigmaNode::164:8278") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:8278") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ItalicMT_22_50_0_1_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Outline/White")
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 30
        lineHeightMode: Text.FixedHeight
    }
    ComponentsSet.Label {
        id: fi_Patient_Name_
        anchors.left: parent.left
        anchors.leftMargin: -1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 87
        z: 2
        width: 178
        height: 34
        text: qsTr("Patient Name:", "FigmaNode::164:8279") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:8279") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ItalicMT_22_50_0_1_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Outline/White")
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 30
        lineHeightMode: Text.FixedHeight
    }
    ComponentsSet.Label {
        id: fi_John_Doe
        anchors.left: parent.left
        anchors.leftMargin: 199
        anchors.top: parent.top
        anchors.topMargin: 7
        z: 3
        width: 666
        height: 34
        text: qsTr("John Doe ", "FigmaNode::164:8232") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:8232") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_32_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Text/Blue 2 - Input")
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 32
        lineHeightMode: Text.FixedHeight
    }
    ComponentsSet.Label {
        id: fi_9089123423
        anchors.left: parent.left
        anchors.leftMargin: 199
        anchors.top: parent.top
        anchors.topMargin: 47
        z: 4
        width: 666
        height: 34
        text: qsTr("9089123423 ", "FigmaNode::164:8280") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:8280") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_32_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Text/Blue 2 - Input")
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 32
        lineHeightMode: Text.FixedHeight
    }
    ComponentsSet.Label {
        id: fi_01_01_1990
        anchors.left: parent.left
        anchors.leftMargin: 199
        anchors.top: parent.top
        anchors.topMargin: 87
        z: 5
        width: 666
        height: 34
        text: qsTr("01/01/1990", "FigmaNode::164:8281") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:8281") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_32_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Text/Blue 2 - Input")
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 32
        lineHeightMode: Text.FixedHeight
    }

    //----------------------------------------------------------------------------------------------

    //States----------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------
}
