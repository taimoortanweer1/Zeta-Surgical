import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet

//USES ComponentsSet.AutoRepeatMouseArea
//USES BorderImage
//USES ComponentsSet.Label
//PREVIEW IMAGE qrc:/GeneratedComponents/assets/Button.png

//EDITABLE TRUE
Item {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    property bool doubleClickEnabeld: false
    property int itemIndex: 0
    property int minimumRepeatInterval: 100
    property int repeateInterval: 1000
    property int selectionIndex: -1
    //FONT Figma::Arial_ArialMT_28_50_0_0_0_0_0.2
    property alias fi_01_01_1900_font: fi_01_01_1900___default.font
    //TEXTHAL 4
    property alias fi_01_01_1900_horizontalAlignment: fi_01_01_1900___default.horizontalAlignment
    //REAL 20
    property alias fi_01_01_1900_lineHeight: fi_01_01_1900___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_01_01_1900_lineHeightMode: fi_01_01_1900___default.lineHeightMode
    //REAL 1
    property alias fi_01_01_1900_opacity: fi_01_01_1900___default.opacity
    //BOOL false
    property alias fi_01_01_1900_richText: fi_01_01_1900___default.richText
    //TRANSLATABLE 01/01/1900
    property alias fi_01_01_1900_text: fi_01_01_1900___default.text
    //COLOR Dark Ink
    property alias fi_01_01_1900_textColor: fi_01_01_1900___default.textColor
    //TEXTVAL 128
    property alias fi_01_01_1900_verticalAlignment: fi_01_01_1900___default.verticalAlignment
    //FONT Figma::Arial_ArialMT_28_50_0_0_0_0_0.2
    property alias fi_02_14_2022_font: fi_02_14_2022___default.font
    //TEXTHAL 4
    property alias fi_02_14_2022_horizontalAlignment: fi_02_14_2022___default.horizontalAlignment
    //REAL 20
    property alias fi_02_14_2022_lineHeight: fi_02_14_2022___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_02_14_2022_lineHeightMode: fi_02_14_2022___default.lineHeightMode
    //REAL 1
    property alias fi_02_14_2022_opacity: fi_02_14_2022___default.opacity
    //BOOL false
    property alias fi_02_14_2022_richText: fi_02_14_2022___default.richText
    //TRANSLATABLE 02/14/2022
    property alias fi_02_14_2022_text: fi_02_14_2022___default.text
    //COLOR Dark Ink
    property alias fi_02_14_2022_textColor: fi_02_14_2022___default.textColor
    //TEXTVAL 128
    property alias fi_02_14_2022_verticalAlignment: fi_02_14_2022___default.verticalAlignment
    //FONT Figma::Arial_ArialMT_28_50_0_0_0_0_0.2
    property alias fi_3_font: fi_3___default.font
    //TEXTHAL 4
    property alias fi_3_horizontalAlignment: fi_3___default.horizontalAlignment
    //REAL 20
    property alias fi_3_lineHeight: fi_3___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_3_lineHeightMode: fi_3___default.lineHeightMode
    //REAL 1
    property alias fi_3_opacity: fi_3___default.opacity
    //BOOL false
    property alias fi_3_richText: fi_3___default.richText
    //TRANSLATABLE 3
    property alias fi_3_text: fi_3___default.text
    //COLOR Dark Ink
    property alias fi_3_textColor: fi_3___default.textColor
    //TEXTVAL 128
    property alias fi_3_verticalAlignment: fi_3___default.verticalAlignment
    //FONT Figma::Arial_ArialMT_28_50_0_0_0_0_0.2
    property alias fi_9089123423_font: fi_9089123423___default.font
    //TEXTHAL 4
    property alias fi_9089123423_horizontalAlignment: fi_9089123423___default.horizontalAlignment
    //REAL 20
    property alias fi_9089123423_lineHeight: fi_9089123423___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_9089123423_lineHeightMode: fi_9089123423___default.lineHeightMode
    //REAL 1
    property alias fi_9089123423_opacity: fi_9089123423___default.opacity
    //BOOL false
    property alias fi_9089123423_richText: fi_9089123423___default.richText
    //TRANSLATABLE 9089123423
    property alias fi_9089123423_text: fi_9089123423___default.text
    //COLOR Dark Ink
    property alias fi_9089123423_textColor: fi_9089123423___default.textColor
    //TEXTVAL 128
    property alias fi_9089123423_verticalAlignment: fi_9089123423___default.verticalAlignment
    //FONT Figma::Arial_ArialMT_28_50_0_0_0_0_0.2
    property alias fi_BWH15304_font: fi_BWH15304___default.font
    //TEXTHAL 4
    property alias fi_BWH15304_horizontalAlignment: fi_BWH15304___default.horizontalAlignment
    //REAL 20
    property alias fi_BWH15304_lineHeight: fi_BWH15304___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_BWH15304_lineHeightMode: fi_BWH15304___default.lineHeightMode
    //REAL 1
    property alias fi_BWH15304_opacity: fi_BWH15304___default.opacity
    //BOOL false
    property alias fi_BWH15304_richText: fi_BWH15304___default.richText
    //TRANSLATABLE BWH-15304
    property alias fi_BWH15304_text: fi_BWH15304___default.text
    //COLOR Dark Ink
    property alias fi_BWH15304_textColor: fi_BWH15304___default.textColor
    //TEXTVAL 128
    property alias fi_BWH15304_verticalAlignment: fi_BWH15304___default.verticalAlignment
    //FONT Figma::Arial_ArialMT_28_50_0_0_0_0_0.2
    property alias fi_John_Doe_font: fi_John_Doe___default.font
    //TEXTHAL 4
    property alias fi_John_Doe_horizontalAlignment: fi_John_Doe___default.horizontalAlignment
    //REAL 20
    property alias fi_John_Doe_lineHeight: fi_John_Doe___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_John_Doe_lineHeightMode: fi_John_Doe___default.lineHeightMode
    //REAL 1
    property alias fi_John_Doe_opacity: fi_John_Doe___default.opacity
    //BOOL false
    property alias fi_John_Doe_richText: fi_John_Doe___default.richText
    //TRANSLATABLE John Doe
    property alias fi_John_Doe_text: fi_John_Doe___default.text
    //COLOR Dark Ink
    property alias fi_John_Doe_textColor: fi_John_Doe___default.textColor
    //TEXTVAL 128
    property alias fi_John_Doe_verticalAlignment: fi_John_Doe___default.verticalAlignment
    //FONT Figma::Arial_ArialMT_28_50_0_0_0_0_0.2
    property alias fi_M_font: fi_M___default.font
    //TEXTHAL 4
    property alias fi_M_horizontalAlignment: fi_M___default.horizontalAlignment
    //REAL 20
    property alias fi_M_lineHeight: fi_M___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_M_lineHeightMode: fi_M___default.lineHeightMode
    //REAL 1
    property alias fi_M_opacity: fi_M___default.opacity
    //BOOL false
    property alias fi_M_richText: fi_M___default.richText
    //TRANSLATABLE M
    property alias fi_M_text: fi_M___default.text
    //COLOR Dark Ink
    property alias fi_M_textColor: fi_M___default.textColor
    //TEXTVAL 128
    property alias fi_M_verticalAlignment: fi_M___default.verticalAlignment

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------
    signal clicked() /*__mouseArea.clicked*/
    signal doubleClicked() /*__mouseArea.doubleClicked*/
    signal pressed() /*__mouseArea.pressed*/
    signal released() /*__mouseArea.released*/
    signal repeatingTriggered() /*__mouseArea.repeatingTriggered*/

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 1656
    height: 96

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
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
    BorderImage {
        id: fi_Rectangle_91___default
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: GreenHouseThemeManager.theme.asset("/164_7711.png")
        border.bottom: 47
        border.left: 47
        border.right: 47
        border.top: 47
    }
    ComponentsSet.Label {
        id: fi_John_Doe___default
        anchors.left: parent.left
        anchors.leftMargin: -1
        anchors.top: parent.top
        anchors.topMargin: -1
        z: 1
        width: 354
        height: 98
        text: qsTr("John Doe", "FigmaNode::164:7712") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:7712") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_28_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Dark Ink")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }
    ComponentsSet.Label {
        id: fi_9089123423___default
        anchors.left: parent.left
        anchors.leftMargin: 351
        anchors.top: parent.top
        anchors.topMargin: -1
        z: 2
        width: 290
        height: 98
        text: qsTr("9089123423", "FigmaNode::164:7713") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:7713") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_28_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Dark Ink")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }
    ComponentsSet.Label {
        id: fi_01_01_1900___default
        anchors.left: parent.left
        anchors.leftMargin: 639
        anchors.top: parent.top
        anchors.topMargin: -1
        z: 3
        width: 194
        height: 98
        text: qsTr("01/01/1900", "FigmaNode::164:7714") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:7714") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_28_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Dark Ink")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }
    ComponentsSet.Label {
        id: fi_M___default
        anchors.left: parent.left
        anchors.leftMargin: 831
        anchors.top: parent.top
        anchors.topMargin: -1
        z: 4
        width: 130
        height: 98
        text: qsTr("M", "FigmaNode::164:7715") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:7715") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_28_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Dark Ink")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }
    ComponentsSet.Label {
        id: fi_3___default
        anchors.left: parent.left
        anchors.leftMargin: 959
        anchors.top: parent.top
        anchors.topMargin: -1
        z: 5
        width: 162
        height: 98
        text: qsTr("3", "FigmaNode::164:7716") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:7716") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_28_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Dark Ink")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }
    ComponentsSet.Label {
        id: fi_BWH15304___default
        anchors.left: parent.left
        anchors.leftMargin: 1119
        anchors.top: parent.top
        anchors.topMargin: -1
        z: 6
        width: 290
        height: 98
        text: qsTr("BWH-15304", "FigmaNode::164:7717") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:7717") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_28_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Dark Ink")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }
    ComponentsSet.Label {
        id: fi_02_14_2022___default
        anchors.left: parent.left
        anchors.leftMargin: 1407
        anchors.top: parent.top
        anchors.topMargin: -1
        z: 7
        width: 250
        height: 98
        text: qsTr("02/14/2022", "FigmaNode::164:7718") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:7718") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_28_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Dark Ink")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }

    //----------------------------------------------------------------------------------------------

    //States----------------------------------------------------------------------------------------
    StateGroup { //
        states: [
        State {
            when: !(root.selectionIndex == root.itemIndex)
            name: "default"
            PropertyChanges {
                target: fi_Rectangle_91___default
                source: GreenHouseThemeManager.theme.asset("/164_7711.png")
            }
        },
        State {
            when: (root.selectionIndex == root.itemIndex)
            name: "selected"
            PropertyChanges {
                target: fi_Rectangle_91___default
                source: GreenHouseThemeManager.theme.asset("/164_7689.png")
            }
        }
        ]
    }

    //----------------------------------------------------------------------------------------------
}
