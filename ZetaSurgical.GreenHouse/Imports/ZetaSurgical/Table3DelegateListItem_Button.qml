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
    //COLOR Text/White
    property alias fi_02_14_2022_textColor: fi_02_14_2022___default.textColor
    //TEXTVAL 128
    property alias fi_02_14_2022_verticalAlignment: fi_02_14_2022___default.verticalAlignment
    //FONT Figma::Arial_ArialMT_28_50_0_0_0_0_0.2
    property alias fi_130_font: fi_130___default.font
    //TEXTHAL 4
    property alias fi_130_horizontalAlignment: fi_130___default.horizontalAlignment
    //REAL 20
    property alias fi_130_lineHeight: fi_130___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_130_lineHeightMode: fi_130___default.lineHeightMode
    //REAL 1
    property alias fi_130_opacity: fi_130___default.opacity
    //BOOL false
    property alias fi_130_richText: fi_130___default.richText
    //TRANSLATABLE 130
    property alias fi_130_text: fi_130___default.text
    //COLOR Text/White
    property alias fi_130_textColor: fi_130___default.textColor
    //TEXTVAL 128
    property alias fi_130_verticalAlignment: fi_130___default.verticalAlignment
    //FONT Figma::Arial_ArialMT_28_50_0_0_0_0_0.2
    property alias fi_1_font: fi_1___default.font
    //TEXTHAL 4
    property alias fi_1_horizontalAlignment: fi_1___default.horizontalAlignment
    //REAL 20
    property alias fi_1_lineHeight: fi_1___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_1_lineHeightMode: fi_1___default.lineHeightMode
    //REAL 1
    property alias fi_1_opacity: fi_1___default.opacity
    //BOOL false
    property alias fi_1_richText: fi_1___default.richText
    //TRANSLATABLE #1
    property alias fi_1_text: fi_1___default.text
    //COLOR Text/White
    property alias fi_1_textColor: fi_1___default.textColor
    //TEXTVAL 128
    property alias fi_1_verticalAlignment: fi_1___default.verticalAlignment
    //FONT Figma::Arial_ArialMT_28_50_0_0_0_0_0.2
    property alias fi_512x512_font: fi_512x512___default.font
    //TEXTHAL 4
    property alias fi_512x512_horizontalAlignment: fi_512x512___default.horizontalAlignment
    //REAL 20
    property alias fi_512x512_lineHeight: fi_512x512___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_512x512_lineHeightMode: fi_512x512___default.lineHeightMode
    //REAL 1
    property alias fi_512x512_opacity: fi_512x512___default.opacity
    //BOOL false
    property alias fi_512x512_richText: fi_512x512___default.richText
    //TRANSLATABLE 512x512
    property alias fi_512x512_text: fi_512x512___default.text
    //COLOR Text/White
    property alias fi_512x512_textColor: fi_512x512___default.textColor
    //TEXTVAL 128
    property alias fi_512x512_verticalAlignment: fi_512x512___default.verticalAlignment
    //FONT Figma::Arial_ArialMT_28_50_0_0_0_0_0.2
    property alias fi_MRI_font: fi_MRI___default.font
    //TEXTHAL 4
    property alias fi_MRI_horizontalAlignment: fi_MRI___default.horizontalAlignment
    //REAL 20
    property alias fi_MRI_lineHeight: fi_MRI___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_MRI_lineHeightMode: fi_MRI___default.lineHeightMode
    //REAL 1
    property alias fi_MRI_opacity: fi_MRI___default.opacity
    //BOOL false
    property alias fi_MRI_richText: fi_MRI___default.richText
    //TRANSLATABLE MRI
    property alias fi_MRI_text: fi_MRI___default.text
    //COLOR Text/White
    property alias fi_MRI_textColor: fi_MRI___default.textColor
    //TEXTVAL 128
    property alias fi_MRI_verticalAlignment: fi_MRI___default.verticalAlignment
    //FONT Figma::Arial_ArialMT_28_50_0_0_0_0_0.2
    property alias fi_Sample_Collection_font: fi_Sample_Collection___default.font
    //TEXTHAL 4
    property alias fi_Sample_Collection_horizontalAlignment: fi_Sample_Collection___default.horizontalAlignment
    //REAL 20
    property alias fi_Sample_Collection_lineHeight: fi_Sample_Collection___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_Sample_Collection_lineHeightMode: fi_Sample_Collection___default.lineHeightMode
    //REAL 1
    property alias fi_Sample_Collection_opacity: fi_Sample_Collection___default.opacity
    //BOOL false
    property alias fi_Sample_Collection_richText: fi_Sample_Collection___default.richText
    //TRANSLATABLE Sample Collection
    property alias fi_Sample_Collection_text: fi_Sample_Collection___default.text
    //COLOR Text/White
    property alias fi_Sample_Collection_textColor: fi_Sample_Collection___default.textColor
    //TEXTVAL 128
    property alias fi_Sample_Collection_verticalAlignment: fi_Sample_Collection___default.verticalAlignment

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------
    signal clicked() /*__mouseArea.clicked*/
    signal doubleClicked() /*__mouseArea.doubleClicked*/
    signal pressed() /*__mouseArea.pressed*/
    signal released() /*__mouseArea.released*/
    signal repeatingTriggered() /*__mouseArea.repeatingTriggered*/

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 1232
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
        source: GreenHouseThemeManager.theme.asset("/164_7749.png")
        border.bottom: 47
        border.left: 47
        border.right: 47
        border.top: 47
    }
    ComponentsSet.Label {
        id: fi_1___default
        anchors.left: parent.left
        anchors.leftMargin: -1
        anchors.top: parent.top
        anchors.topMargin: -1
        z: 1
        width: 162
        height: 98
        text: qsTr("#1", "FigmaNode::164:7750") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:7750") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_28_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Text/White")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }
    ComponentsSet.Label {
        id: fi_MRI___default
        anchors.left: parent.left
        anchors.leftMargin: 575
        anchors.top: parent.top
        anchors.topMargin: -1
        z: 2
        width: 162
        height: 98
        text: qsTr("MRI", "FigmaNode::164:7751") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:7751") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_28_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Text/White")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }
    ComponentsSet.Label {
        id: fi_Sample_Collection___default
        anchors.left: parent.left
        anchors.leftMargin: 159
        anchors.top: parent.top
        anchors.topMargin: -1
        z: 3
        width: 418
        height: 98
        text: qsTr("Sample Collection", "FigmaNode::164:7752") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:7752") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_28_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Text/White")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }
    ComponentsSet.Label {
        id: fi_512x512___default
        anchors.left: parent.left
        anchors.leftMargin: 735
        anchors.top: parent.top
        anchors.topMargin: -1
        z: 4
        width: 162
        height: 98
        text: qsTr("512x512", "FigmaNode::164:7753") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:7753") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_28_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Text/White")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }
    ComponentsSet.Label {
        id: fi_130___default
        anchors.left: parent.left
        anchors.leftMargin: 895
        anchors.top: parent.top
        anchors.topMargin: -1
        z: 5
        width: 138
        height: 98
        text: qsTr("130", "FigmaNode::164:7754") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:7754") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_28_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Text/White")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }
    ComponentsSet.Label {
        id: fi_02_14_2022___default
        anchors.left: parent.left
        anchors.leftMargin: 1031
        anchors.top: parent.top
        anchors.topMargin: -1
        z: 6
        width: 202
        height: 98
        text: qsTr("02/14/2022", "FigmaNode::164:7755") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:7755") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_28_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Text/White")
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
                source: GreenHouseThemeManager.theme.asset("/164_7749.png")
            }
        },
        State {
            when: (root.selectionIndex == root.itemIndex)
            name: "selected"
            PropertyChanges {
                target: fi_Rectangle_91___default
                source: GreenHouseThemeManager.theme.asset("/164_7766.png")
            }
        }
        ]
    }

    //----------------------------------------------------------------------------------------------
}
