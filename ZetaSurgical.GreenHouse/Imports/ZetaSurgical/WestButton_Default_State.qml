import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet

//USES Image
//USES ComponentsSet.Label
//USES ComponentsSet.AutoRepeatMouseArea
//PREVIEW IMAGE qrc:/GeneratedComponents/assets/Button.png

//EDITABLE TRUE
Item {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    property bool doubleClickEnabeld: false
    property int minimumRepeatInterval: 100
    property int repeateInterval: 1000
    //REAL 1
    property alias fi_Ellipse_229_opacity: fi_Ellipse_229.opacity
    //ASSET /366_3455.png
    property alias fi_Ellipse_229_source: fi_Ellipse_229.source
    //FONT Figma::Arial_ArialMT_24_50_0_0_0_0_0.2
    property alias fi_L_font: fi_L.font
    //TEXTHAL 1
    property alias fi_L_horizontalAlignment: fi_L.horizontalAlignment
    //COLOR Text/White
    property alias fi_L_labelColor: fi_L.textColor
    //REAL 20
    property alias fi_L_lineHeight: fi_L.lineHeight
    //TEXTLINEHM 1
    property alias fi_L_lineHeightMode: fi_L.lineHeightMode
    //REAL 1
    property alias fi_L_opacity: fi_L.opacity
    //BOOL false
    property alias fi_L_richText: fi_L.richText
    //TRANSLATABLE L
    property alias fi_L_text: fi_L.text
    //TEXTVAL 128
    property alias fi_L_verticalAlignment: fi_L.verticalAlignment
    //REAL 1
    property alias icon_opacity: icon.opacity
    //ASSET /Icons/LeftArrow__DefaultState.png
    property alias icon_source: icon.source

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------
    signal clicked() /*__mouseArea.clicked*/
    signal doubleClicked() /*__mouseArea.doubleClicked*/
    signal pressed() /*__mouseArea.pressed*/
    signal released() /*__mouseArea.released*/
    signal repeatingTriggered() /*__mouseArea.repeatingTriggered*/

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 96
    height: 240

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    Image {
        id: fi_Ellipse_229
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 6
        width: 95
        height: 228
        source: GreenHouseThemeManager.theme.asset("/366_3455.png")
    }
    ComponentsSet.Label {
        id: fi_L
        anchors.right: parent.right
        anchors.rightMargin: -1
        anchors.top: parent.top
        anchors.topMargin: -1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -1
        z: 1
        width: 50
        text: qsTr("L", "FigmaNode::174:2251") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::174:2251") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_24_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Text/White")
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }
    Image {
        id: icon
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        z: 2
        width: 48
        height: 48
        source: GreenHouseThemeManager.theme.asset("/Icons/LeftArrow__DefaultState.png")
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
