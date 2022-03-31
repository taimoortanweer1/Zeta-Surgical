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
    //FONT Figma::Arial_ArialMT_24_50_0_0_0_0_0.2
    property alias fi_A_font: fi_A.font
    //TEXTHAL 4
    property alias fi_A_horizontalAlignment: fi_A.horizontalAlignment
    //COLOR Text/White
    property alias fi_A_labelColor: fi_A.textColor
    //REAL 20
    property alias fi_A_lineHeight: fi_A.lineHeight
    //TEXTLINEHM 1
    property alias fi_A_lineHeightMode: fi_A.lineHeightMode
    //REAL 1
    property alias fi_A_opacity: fi_A.opacity
    //BOOL false
    property alias fi_A_richText: fi_A.richText
    //TRANSLATABLE A
    property alias fi_A_text: fi_A.text
    //TEXTVAL 32
    property alias fi_A_verticalAlignment: fi_A.verticalAlignment
    //REAL 1
    property alias fi_Ellipse_229_opacity: fi_Ellipse_229.opacity
    //ASSET /366_3430.png
    property alias fi_Ellipse_229_source: fi_Ellipse_229.source
    //REAL 1
    property alias icon_opacity: icon.opacity
    //ASSET /Icons/UpArrow__DefaultState.png
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
        anchors.top: parent.top
        width: 228
        height: 95
        source: GreenHouseThemeManager.theme.asset("/366_3430.png")
    }
    ComponentsSet.Label {
        id: fi_A
        anchors.left: parent.left
        anchors.leftMargin: -1
        anchors.right: parent.right
        anchors.rightMargin: -1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -1
        z: 1
        height: 58
        text: qsTr("A", "FigmaNode::174:2164") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::174:2164") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_24_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Text/White")
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }
    Image {
        id: icon
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        z: 2
        width: 48
        height: 48
        source: GreenHouseThemeManager.theme.asset("/Icons/UpArrow__DefaultState.png")
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
