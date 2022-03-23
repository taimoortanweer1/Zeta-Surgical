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
    property alias fi_BUTTON_TEXT_font: fi_BUTTON_TEXT___default.font
    //TEXTHAL 4
    property alias fi_BUTTON_TEXT_horizontalAlignment: fi_BUTTON_TEXT___default.horizontalAlignment
    //REAL 20
    property alias fi_BUTTON_TEXT_lineHeight: fi_BUTTON_TEXT___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_BUTTON_TEXT_lineHeightMode: fi_BUTTON_TEXT___default.lineHeightMode
    //REAL 1
    property alias fi_BUTTON_TEXT_opacity: fi_BUTTON_TEXT___default.opacity
    //BOOL false
    property alias fi_BUTTON_TEXT_richText: fi_BUTTON_TEXT___default.richText
    //TRANSLATABLE BUTTON TEXT
    property alias fi_BUTTON_TEXT_text: fi_BUTTON_TEXT___default.text
    //TEXTVAL 128
    property alias fi_BUTTON_TEXT_verticalAlignment: fi_BUTTON_TEXT___default.verticalAlignment

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------
    signal clicked() /*__mouseArea.clicked*/
    signal doubleClicked() /*__mouseArea.doubleClicked*/
    signal pressed() /*__mouseArea.pressed*/
    signal released() /*__mouseArea.released*/
    signal repeatingTriggered() /*__mouseArea.repeatingTriggered*/

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 512
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
        source: GreenHouseThemeManager.theme.asset("/2_4.png")
        border.bottom: 39
        border.left: 39
        border.right: 39
        border.top: 39
    }
    ComponentsSet.Label {
        id: fi_BUTTON_TEXT___default
        anchors.left: parent.left
        anchors.leftMargin: -1
        anchors.right: parent.right
        anchors.rightMargin: -1
        anchors.verticalCenter: parent.verticalCenter
        z: 1
        height: 26
        text: qsTr("BUTTON TEXT", "FigmaNode::2:5") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::2:5") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_24_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Text/Grey 1 - Inactive")
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
                target: fi_BUTTON_TEXT___default
                textColor: GreenHouseThemeManager.theme.color("Text/Grey 1 - Inactive")
            }
            PropertyChanges {
                target: fi_Button_1___default
                border.bottom: 39
                border.left: 39
                border.right: 39
                border.top: 39
                source: GreenHouseThemeManager.theme.asset("/2_4.png")
            }
        },
        State {
            when: __mouseArea.pressed && !(root.selectionIndex == root.itemIndex)
            name: "pressed"
            PropertyChanges {
                target: fi_BUTTON_TEXT___default
                textColor: GreenHouseThemeManager.theme.color("Text/White")
            }
            PropertyChanges {
                target: fi_Button_1___default
                border.bottom: 14
                border.left: 14
                border.right: 14
                border.top: 14
                source: GreenHouseThemeManager.theme.asset("/22_2460.png")
            }
        },
        State {
            when: !__mouseArea.pressed && (root.selectionIndex == root.itemIndex)
            name: "selected"
            PropertyChanges {
                target: fi_BUTTON_TEXT___default
                textColor: GreenHouseThemeManager.theme.color("Text/White")
            }
            PropertyChanges {
                target: fi_Button_1___default
                source: GreenHouseThemeManager.theme.asset("/11_1228.png")
            }
        }
        ]
    }

    //----------------------------------------------------------------------------------------------
}
