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
    //COLOR Outline/White
    property alias fi_02_14_2022_textColor: fi_02_14_2022___default.textColor
    //TEXTVAL 128
    property alias fi_02_14_2022_verticalAlignment: fi_02_14_2022___default.verticalAlignment
    //FONT Figma::Arial_ArialMT_28_50_0_0_0_0_0.2
    property alias fi_02_2_2022_font: fi_02_2_2022___default.font
    //TEXTHAL 4
    property alias fi_02_2_2022_horizontalAlignment: fi_02_2_2022___default.horizontalAlignment
    //REAL 20
    property alias fi_02_2_2022_lineHeight: fi_02_2_2022___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_02_2_2022_lineHeightMode: fi_02_2_2022___default.lineHeightMode
    //REAL 1
    property alias fi_02_2_2022_opacity: fi_02_2_2022___default.opacity
    //BOOL false
    property alias fi_02_2_2022_richText: fi_02_2_2022___default.richText
    //TRANSLATABLE 02/1/2022
    property alias fi_02_2_2022_text: fi_02_2_2022___default.text
    //COLOR Outline/White
    property alias fi_02_2_2022_textColor: fi_02_2_2022___default.textColor
    //TEXTVAL 128
    property alias fi_02_2_2022_verticalAlignment: fi_02_2_2022___default.verticalAlignment
    //FONT Figma::Arial_ArialMT_28_50_0_0_0_0_0.2
    property alias fi_5_font: fi_5___default.font
    //TEXTHAL 4
    property alias fi_5_horizontalAlignment: fi_5___default.horizontalAlignment
    //REAL 20
    property alias fi_5_lineHeight: fi_5___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_5_lineHeightMode: fi_5___default.lineHeightMode
    //REAL 1
    property alias fi_5_opacity: fi_5___default.opacity
    //BOOL false
    property alias fi_5_richText: fi_5___default.richText
    //TRANSLATABLE 5
    property alias fi_5_text: fi_5___default.text
    //COLOR Outline/White
    property alias fi_5_textColor: fi_5___default.textColor
    //TEXTVAL 128
    property alias fi_5_verticalAlignment: fi_5___default.verticalAlignment
    //FONT Figma::Arial_ArialMT_28_50_0_0_0_0_0.2
    property alias fi_BWH12345_font: fi_BWH12345___default.font
    //TEXTHAL 4
    property alias fi_BWH12345_horizontalAlignment: fi_BWH12345___default.horizontalAlignment
    //REAL 20
    property alias fi_BWH12345_lineHeight: fi_BWH12345___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_BWH12345_lineHeightMode: fi_BWH12345___default.lineHeightMode
    //REAL 1
    property alias fi_BWH12345_opacity: fi_BWH12345___default.opacity
    //BOOL false
    property alias fi_BWH12345_richText: fi_BWH12345___default.richText
    //TRANSLATABLE BWH-12344
    property alias fi_BWH12345_text: fi_BWH12345___default.text
    //COLOR Outline/White
    property alias fi_BWH12345_textColor: fi_BWH12345___default.textColor
    //TEXTVAL 128
    property alias fi_BWH12345_verticalAlignment: fi_BWH12345___default.verticalAlignment
    //FONT Figma::Arial_ArialMT_28_50_0_0_0_0_0.2
    property alias fi_CT_Scans_and_stuff_font: fi_CT_Scans_and_stuff___default.font
    //TEXTHAL 4
    property alias fi_CT_Scans_and_stuff_horizontalAlignment: fi_CT_Scans_and_stuff___default.horizontalAlignment
    //REAL 20
    property alias fi_CT_Scans_and_stuff_lineHeight: fi_CT_Scans_and_stuff___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_CT_Scans_and_stuff_lineHeightMode: fi_CT_Scans_and_stuff___default.lineHeightMode
    //REAL 1
    property alias fi_CT_Scans_and_stuff_opacity: fi_CT_Scans_and_stuff___default.opacity
    //BOOL false
    property alias fi_CT_Scans_and_stuff_richText: fi_CT_Scans_and_stuff___default.richText
    //TRANSLATABLE CT scans and MRI things
    property alias fi_CT_Scans_and_stuff_text: fi_CT_Scans_and_stuff___default.text
    //COLOR Outline/White
    property alias fi_CT_Scans_and_stuff_textColor: fi_CT_Scans_and_stuff___default.textColor
    //TEXTVAL 128
    property alias fi_CT_Scans_and_stuff_verticalAlignment: fi_CT_Scans_and_stuff___default.verticalAlignment

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
        source: GreenHouseThemeManager.theme.asset("/164_7741.png")
        border.bottom: 47
        border.left: 47
        border.right: 47
        border.top: 47
    }
    ComponentsSet.Label {
        id: fi_02_2_2022___default
        anchors.left: parent.left
        anchors.leftMargin: -1
        anchors.top: parent.top
        anchors.topMargin: -1
        z: 1
        width: 200
        height: 98
        text: qsTr("02/1/2022", "FigmaNode::164:7742") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:7742") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_28_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Outline/White")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }
    ComponentsSet.Label {
        id: fi_BWH12345___default
        anchors.left: parent.left
        anchors.leftMargin: 191
        anchors.top: parent.top
        anchors.topMargin: -1
        z: 2
        width: 290
        height: 98
        text: qsTr("BWH-12344", "FigmaNode::164:7743") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:7743") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_28_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Outline/White")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }
    ComponentsSet.Label {
        id: fi_CT_Scans_and_stuff___default
        anchors.left: parent.left
        anchors.leftMargin: 479
        anchors.top: parent.top
        anchors.topMargin: -1
        z: 3
        width: 386
        height: 98
        text: qsTr("CT scans and MRI things", "FigmaNode::164:7744") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:7744") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_28_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Outline/White")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }
    ComponentsSet.Label {
        id: fi_5___default
        anchors.left: parent.left
        anchors.leftMargin: 863
        anchors.top: parent.top
        anchors.topMargin: -1
        z: 4
        width: 170
        height: 98
        text: qsTr("5", "FigmaNode::164:7745") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:7745") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_28_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Outline/White")
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
        z: 5
        width: 202
        height: 98
        text: qsTr("02/14/2022", "FigmaNode::164:7746") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:7746") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_28_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Outline/White")
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
                source: GreenHouseThemeManager.theme.asset("/164_7741.png")
            }
        },
        State {
            when: (root.selectionIndex == root.itemIndex)
            name: "selected"
            PropertyChanges {
                target: fi_Rectangle_91___default
                source: GreenHouseThemeManager.theme.asset("/164_7721.png")
            }
        }
        ]
    }

    //----------------------------------------------------------------------------------------------
}
