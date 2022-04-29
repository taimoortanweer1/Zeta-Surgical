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
    //ASSET /366_3505.png
    property alias fi_Ellipse_229_source: fi_Ellipse_229.source
    //FONT Figma::Arial_ArialMT_24_50_0_0_0_0_0.2
    property alias fi_P_font: fi_P.font
    //TEXTHAL 4
    property alias fi_P_horizontalAlignment: fi_P.horizontalAlignment
    //COLOR Text/White
    property alias fi_P_labelColor: fi_P.textColor
    //REAL 20
    property alias fi_P_lineHeight: fi_P.lineHeight
    //TEXTLINEHM 1
    property alias fi_P_lineHeightMode: fi_P.lineHeightMode
    //REAL 1
    property alias fi_P_opacity: fi_P.opacity
    //BOOL false
    property alias fi_P_richText: fi_P.richText
    //TRANSLATABLE P
    property alias fi_P_text: fi_P.text
    //TEXTVAL 64
    property alias fi_P_verticalAlignment: fi_P.verticalAlignment
    //REAL 1
    property alias icon_opacity: icon.opacity
    //ASSET /Icons/DownArrow__DefaultState.png
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
    width: 240
    height: 96

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    Image {
        id: fi_Ellipse_229
        anchors.left: parent.left
        anchors.leftMargin: 6
        anchors.bottom: parent.bottom
        width: 228
        height: 95
        source: GreenHouseThemeManager.theme.asset("/366_3505.png")
    }
    ComponentsSet.Label {
        id: fi_P
        anchors.left: parent.left
        anchors.leftMargin: -1
        anchors.right: parent.right
        anchors.rightMargin: -1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 42
        z: 1
        height: 55
        text: qsTr("P", "FigmaNode::174:2210") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::174:2210") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_24_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Text/White")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }
    Image {
        id: icon
        anchors.top: parent.top
        anchors.topMargin: 48
        anchors.horizontalCenter: parent.horizontalCenter
        z: 2
        width: 48
        height: 48
        source: GreenHouseThemeManager.theme.asset("/Icons/DownArrow__DefaultState.png")
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
