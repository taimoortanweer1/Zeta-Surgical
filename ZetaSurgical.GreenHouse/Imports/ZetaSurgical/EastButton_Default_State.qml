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
    //ASSET /366_3480.png
    property alias fi_Ellipse_229_source: fi_Ellipse_229.source
    //FONT Figma::Arial_ArialMT_24_50_0_0_0_0_0.2
    property alias fi_R_font: fi_R.font
    //TEXTHAL 2
    property alias fi_R_horizontalAlignment: fi_R.horizontalAlignment
    //COLOR Text/White
    property alias fi_R_labelColor: fi_R.textColor
    //REAL 20
    property alias fi_R_lineHeight: fi_R.lineHeight
    //TEXTLINEHM 1
    property alias fi_R_lineHeightMode: fi_R.lineHeightMode
    //REAL 1
    property alias fi_R_opacity: fi_R.opacity
    //BOOL false
    property alias fi_R_richText: fi_R.richText
    //TRANSLATABLE R
    property alias fi_R_text: fi_R.text
    //TEXTVAL 128
    property alias fi_R_verticalAlignment: fi_R.verticalAlignment
    //REAL 1
    property alias icon_opacity: icon.opacity
    //ASSET /Icons/RightArrow__DefaultState.png
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
        anchors.leftMargin: 1
        anchors.top: parent.top
        anchors.topMargin: 6
        width: 95
        height: 228
        source: GreenHouseThemeManager.theme.asset("/366_3480.png")
    }
    ComponentsSet.Label {
        id: fi_R
        anchors.left: parent.left
        anchors.leftMargin: -1
        anchors.top: parent.top
        anchors.topMargin: -1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -1
        z: 1
        width: 50
        text: qsTr("R", "FigmaNode::174:2228") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::174:2228") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_24_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Text/White")
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }
    Image {
        id: icon
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        z: 2
        width: 48
        height: 48
        source: GreenHouseThemeManager.theme.asset("/Icons/RightArrow__DefaultState.png")
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
