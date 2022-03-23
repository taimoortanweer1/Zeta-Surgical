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
    property int minimumRepeatInterval: 100
    property int repeateInterval: 1000
    //FONT Figma::Arial_ArialMT_24_50_0_0_0_0_0.2
    property alias fi_Default_Instrument_font: fi_Default_Instrument___default.font
    //TEXTHAL 1
    property alias fi_Default_Instrument_horizontalAlignment: fi_Default_Instrument___default.horizontalAlignment
    //REAL 20
    property alias fi_Default_Instrument_lineHeight: fi_Default_Instrument___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_Default_Instrument_lineHeightMode: fi_Default_Instrument___default.lineHeightMode
    //REAL 1
    property alias fi_Default_Instrument_opacity: fi_Default_Instrument___default.opacity
    //BOOL false
    property alias fi_Default_Instrument_richText: fi_Default_Instrument___default.richText
    //TRANSLATABLE Default Instrument
    property alias fi_Default_Instrument_text: fi_Default_Instrument___default.text
    //COLOR Icon/White
    property alias fi_Default_Instrument_textColor: fi_Default_Instrument___default.textColor
    //TEXTVAL 128
    property alias fi_Default_Instrument_verticalAlignment: fi_Default_Instrument___default.verticalAlignment

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------
    signal clicked() /*__mouseArea.clicked*/
    signal doubleClicked() /*__mouseArea.doubleClicked*/
    signal pressed() /*__mouseArea.pressed*/
    signal released() /*__mouseArea.released*/
    signal repeatingTriggered() /*__mouseArea.repeatingTriggered*/

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 368
    height: 80

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
        id: fi_Login_Enter___default
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: GreenHouseThemeManager.theme.asset("/79_2017.png")
        border.bottom: 39
        border.left: 39
        border.right: 39
        border.top: 39
    }
    ComponentsSet.Label {
        id: fi_Default_Instrument___default
        anchors.left: parent.left
        anchors.leftMargin: 31
        anchors.right: parent.right
        anchors.rightMargin: 63
        anchors.verticalCenter: parent.verticalCenter
        z: 1
        height: 82
        text: qsTr("Default Instrument", "FigmaNode::79:2018") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::79:2018") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_24_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Icon/White")
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
            when: !__mouseArea.pressed
            name: "default"
            PropertyChanges {
                target: fi_Login_Enter___default
                border.bottom: 39
                border.left: 39
                border.right: 39
                border.top: 39
                source: GreenHouseThemeManager.theme.asset("/79_2017.png")
            }
        },
        State {
            when: __mouseArea.pressed
            name: "pressed"
            PropertyChanges {
                target: fi_Login_Enter___default
                border.bottom: 14
                border.left: 14
                border.right: 14
                border.top: 14
                source: GreenHouseThemeManager.theme.asset("/146_1642.png")
            }
        }
        ]
    }

    //----------------------------------------------------------------------------------------------
}
