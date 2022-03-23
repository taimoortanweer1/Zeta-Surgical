import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet

//USES ComponentsSet.AutoRepeatMouseArea
//USES BorderImage
//USES Image
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
    property alias fi_ADD_POINT_font: fi_ADD_POINT___default.font
    //TEXTHAL 4
    property alias fi_ADD_POINT_horizontalAlignment: fi_ADD_POINT___default.horizontalAlignment
    //REAL 20
    property alias fi_ADD_POINT_lineHeight: fi_ADD_POINT___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_ADD_POINT_lineHeightMode: fi_ADD_POINT___default.lineHeightMode
    //REAL 1
    property alias fi_ADD_POINT_opacity: fi_ADD_POINT___default.opacity
    //BOOL false
    property alias fi_ADD_POINT_richText: fi_ADD_POINT___default.richText
    //TRANSLATABLE ADD POINT
    property alias fi_ADD_POINT_text: fi_ADD_POINT___default.text
    //COLOR Icon/White
    property alias fi_ADD_POINT_textColor: fi_ADD_POINT___default.textColor
    //TEXTVAL 128
    property alias fi_ADD_POINT_verticalAlignment: fi_ADD_POINT___default.verticalAlignment
    //REAL 1
    property alias fi_Union_opacity: fi_Union___default.opacity

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
        source: GreenHouseThemeManager.theme.asset("/7_1300.png")
        border.bottom: 39
        border.left: 39
        border.right: 39
        border.top: 39
    }
    Image {
        id: fi_Union___default
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 15
        z: 1
        width: 50
        height: 50
        source: GreenHouseThemeManager.theme.asset("/7_1310.png")
    }
    ComponentsSet.Label {
        id: fi_ADD_POINT___default
        anchors.left: parent.left
        anchors.leftMargin: 89
        anchors.right: parent.right
        anchors.rightMargin: 22
        anchors.verticalCenter: parent.verticalCenter
        z: 2
        height: 82
        text: qsTr("ADD POINT", "FigmaNode::7:1311") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::7:1311") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_24_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Icon/White")
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
            when: !__mouseArea.pressed
            name: "default"
            PropertyChanges {
                target: fi_Login_Enter___default
                border.bottom: 39
                border.left: 39
                border.right: 39
                border.top: 39
                source: GreenHouseThemeManager.theme.asset("/7_1300.png")
            }
            PropertyChanges {
                target: fi_Union___default
                source: GreenHouseThemeManager.theme.asset("/7_1310.png")
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
                source: GreenHouseThemeManager.theme.asset("/22_2501.png")
            }
            PropertyChanges {
                target: fi_Union___default
                source: GreenHouseThemeManager.theme.asset("/22_2502.png")
            }
        }
        ]
    }

    //----------------------------------------------------------------------------------------------
}
