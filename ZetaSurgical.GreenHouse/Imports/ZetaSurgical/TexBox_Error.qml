import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet

//USES Rectangle
//USES ComponentsSet.Label

//EDITABLE TRUE
Item {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    property int itemIndex: 0
    property int selectionIndex: -1
    //FONT Figma::Arial_ArialMT_22_50_0_0_0_0_0.2
    property alias fi_Error_Font_font: fi_Error_Font___active.font
    //TEXTHAL 1
    property alias fi_Error_Font_horizontalAlignment: fi_Error_Font___active.horizontalAlignment
    //REAL 30
    property alias fi_Error_Font_lineHeight: fi_Error_Font___active.lineHeight
    //TEXTLINEHM 1
    property alias fi_Error_Font_lineHeightMode: fi_Error_Font___active.lineHeightMode
    //REAL 1
    property alias fi_Error_Font_opacity: fi_Error_Font___active.opacity
    //BOOL false
    property alias fi_Error_Font_richText: fi_Error_Font___active.richText
    //TRANSLATABLE Error Font
    property alias fi_Error_Font_text: fi_Error_Font___active.text
    //TEXTVAL 128
    property alias fi_Error_Font_verticalAlignment: fi_Error_Font___active.verticalAlignment
    //COLOR Fill/Light Grey 1
    property alias fi_Rectangle_90_color: fi_Rectangle_90___active.color
    //REAL 1
    property alias fi_Rectangle_90_opacity: fi_Rectangle_90___active.opacity

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 464
    height: 48

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    Rectangle {
        id: fi_Rectangle_90___active
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: -1
        anchors.bottom: parent.bottom
        color: GreenHouseThemeManager.theme.color("Fill/Light Grey 1")
        border.color: GreenHouseThemeManager.theme.color("Figma::0_0_0_0")
        border.width: 1
    }
    ComponentsSet.Label {
        id: fi_Error_Font___active
        anchors.left: parent.left
        anchors.leftMargin: 15
        anchors.right: parent.right
        anchors.rightMargin: 15
        anchors.verticalCenter: parent.verticalCenter
        z: 1
        height: 50
        text: qsTr("Error Font", "FigmaNode::23:5978") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::23:5978") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_22_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Icon/Red")
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 30
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
                target: fi_Error_Font___active
                textColor: GreenHouseThemeManager.theme.color("Figma::0_0_0_0")
            }
        },
        State {
            when: (root.selectionIndex == root.itemIndex)
            name: "selected"
            PropertyChanges {
                target: fi_Error_Font___active
                textColor: GreenHouseThemeManager.theme.color("Icon/Red")
            }
        }
        ]
    }

    //----------------------------------------------------------------------------------------------
}
