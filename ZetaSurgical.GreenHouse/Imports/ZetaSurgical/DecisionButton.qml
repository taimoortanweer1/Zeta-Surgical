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
    //FONT Figma::Arial_ArialMT_24_50_0_0_0_0_0.2
    property alias fi_TEXT_font: fi_TEXT___default.font
    //TEXTHAL 4
    property alias fi_TEXT_horizontalAlignment: fi_TEXT___default.horizontalAlignment
    //REAL 20
    property alias fi_TEXT_lineHeight: fi_TEXT___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_TEXT_lineHeightMode: fi_TEXT___default.lineHeightMode
    //REAL 1
    property alias fi_TEXT_opacity: fi_TEXT___default.opacity
    //BOOL false
    property alias fi_TEXT_richText: fi_TEXT___default.richText
    //TRANSLATABLE TEXT
    property alias fi_TEXT_text: fi_TEXT___default.text
    //COLOR Text/White
    property alias fi_TEXT_textColor: fi_TEXT___default.textColor
    //TEXTVAL 128
    property alias fi_TEXT_verticalAlignment: fi_TEXT___default.verticalAlignment

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------
    signal clicked() /*__mouseArea.clicked*/
    signal doubleClicked() /*__mouseArea.doubleClicked*/
    signal pressed() /*__mouseArea.pressed*/
    signal released() /*__mouseArea.released*/
    signal repeatingTriggered() /*__mouseArea.repeatingTriggered*/

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 158
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
        id: fi_Button_1___default
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: GreenHouseThemeManager.theme.asset("/35_1342.png")
        border.bottom: 25
        border.left: 25
        border.right: 25
        border.top: 25
    }
    ComponentsSet.Label {
        id: fi_TEXT___default
        anchors.left: parent.left
        anchors.leftMargin: -1
        anchors.right: parent.right
        anchors.rightMargin: -1
        anchors.verticalCenter: parent.verticalCenter
        z: 1
        height: 26
        text: qsTr("TEXT", "FigmaNode::35:1343") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::35:1343") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_24_50_0_0_0_0_0.2")
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
            when: !__mouseArea.pressed && !(root.selectionIndex == root.itemIndex)
            name: "default"
            PropertyChanges {
                target: fi_Button_1___default
                source: GreenHouseThemeManager.theme.asset("/35_1342.png")
            }
        },
        State {
            when: __mouseArea.pressed && !(root.selectionIndex == root.itemIndex)
            name: "pressed"
            PropertyChanges {
                target: fi_Button_1___default
                source: GreenHouseThemeManager.theme.asset("/35_1353.png")
            }
        },
        State {
            when: !__mouseArea.pressed && (root.selectionIndex == root.itemIndex)
            name: "selected"
            PropertyChanges {
                target: fi_Button_1___default
                source: GreenHouseThemeManager.theme.asset("/35_1345.png")
            }
        }
        ]
        transitions: [

        ]
    }

    //----------------------------------------------------------------------------------------------
}
