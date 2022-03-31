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
    property alias fi_EXAMPLE_font: fi_EXAMPLE___default.font
    //TEXTHAL 4
    property alias fi_EXAMPLE_horizontalAlignment: fi_EXAMPLE___default.horizontalAlignment
    //REAL 20
    property alias fi_EXAMPLE_lineHeight: fi_EXAMPLE___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_EXAMPLE_lineHeightMode: fi_EXAMPLE___default.lineHeightMode
    //REAL 1
    property alias fi_EXAMPLE_opacity: fi_EXAMPLE___default.opacity
    //BOOL false
    property alias fi_EXAMPLE_richText: fi_EXAMPLE___default.richText
    //TRANSLATABLE EXAMPLE
    property alias fi_EXAMPLE_text: fi_EXAMPLE___default.text
    //TEXTVAL 128
    property alias fi_EXAMPLE_verticalAlignment: fi_EXAMPLE___default.verticalAlignment

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
        id: fi_Background_9seg_40_40_40_40___default
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: GreenHouseThemeManager.theme.asset("/7_1251.png")
        border.bottom: 39
        border.left: 39
        border.right: 39
        border.top: 39
    }
    ComponentsSet.Label {
        id: fi_EXAMPLE___default
        anchors.left: parent.left
        anchors.leftMargin: -1
        anchors.right: parent.right
        anchors.rightMargin: -1
        anchors.verticalCenter: parent.verticalCenter
        z: 1
        height: 26
        text: qsTr("EXAMPLE", "FigmaNode::7:1252") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::7:1252") : "")
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
            when: root.enabled && !__mouseArea.pressed && !(root.selectionIndex == root.itemIndex)
            name: "default"
            PropertyChanges {
                target: fi_Background_9seg_40_40_40_40___default
                source: GreenHouseThemeManager.theme.asset("/7_1251.png")
            }
            PropertyChanges {
                target: fi_EXAMPLE___default
                textColor: GreenHouseThemeManager.theme.color("Text/White")
            }
        },
        State {
            when: !root.enabled && !__mouseArea.pressed
            name: "disabled"
            PropertyChanges {
                target: fi_Background_9seg_40_40_40_40___default
                source: GreenHouseThemeManager.theme.asset("/11_1302.png")
            }
            PropertyChanges {
                target: fi_EXAMPLE___default
                textColor: GreenHouseThemeManager.theme.color("Text/Grey 1 - Inactive")
            }
        },
        State {
            when: root.enabled && __mouseArea.pressed && !(root.selectionIndex == root.itemIndex)
            name: "pressed"
            PropertyChanges {
                target: fi_Background_9seg_40_40_40_40___default
                source: GreenHouseThemeManager.theme.asset("/22_2467.png")
            }
        },
        State {
            when: root.enabled && !__mouseArea.pressed && (root.selectionIndex == root.itemIndex)
            name: "selected"
            PropertyChanges {
                target: fi_Background_9seg_40_40_40_40___default
                source: GreenHouseThemeManager.theme.asset("/11_1305.png")
            }
        }
        ]
    }

    //----------------------------------------------------------------------------------------------
}
