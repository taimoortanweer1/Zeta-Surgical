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
    property alias fi_Label_font: fi_Label___default.font
    //TEXTHAL 4
    property alias fi_Label_horizontalAlignment: fi_Label___default.horizontalAlignment
    //REAL 20
    property alias fi_Label_lineHeight: fi_Label___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_Label_lineHeightMode: fi_Label___default.lineHeightMode
    //REAL 1
    property alias fi_Label_opacity: fi_Label___default.opacity
    //BOOL false
    property alias fi_Label_richText: fi_Label___default.richText
    //TRANSLATABLE BUTTON TEXT
    property alias fi_Label_text: fi_Label___default.text
    //TEXTVAL 128
    property alias fi_Label_verticalAlignment: fi_Label___default.verticalAlignment

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------
    signal clicked() /*__mouseArea.clicked*/
    signal doubleClicked() /*__mouseArea.doubleClicked*/
    signal pressed() /*__mouseArea.pressed*/
    signal released() /*__mouseArea.released*/
    signal repeatingTriggered() /*__mouseArea.repeatingTriggered*/

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 327
    height: 48

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
        id: fi_Background_9seg_24_24_24_24___default
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: GreenHouseThemeManager.theme.asset("/367_3607.png")
        border.bottom: 23
        border.left: 23
        border.right: 23
        border.top: 23
    }
    ComponentsSet.Label {
        id: fi_Label___default
        anchors.left: parent.left
        anchors.leftMargin: -94
        anchors.right: parent.right
        anchors.rightMargin: -93
        anchors.verticalCenter: parent.verticalCenter
        z: 1
        height: 26
        text: qsTr("BUTTON TEXT", "FigmaNode::367:3608") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::367:3608") : "")
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
                target: fi_Background_9seg_24_24_24_24___default
                source: GreenHouseThemeManager.theme.asset("/367_3607.png")
            }
            PropertyChanges {
                target: fi_Label___default
                textColor: GreenHouseThemeManager.theme.color("Text/Grey 1 - Inactive")
            }
        },
        State {
            when: __mouseArea.pressed && !(root.selectionIndex == root.itemIndex)
            name: "pressed"
            PropertyChanges {
                target: fi_Background_9seg_24_24_24_24___default
                source: GreenHouseThemeManager.theme.asset("/367_3604.png")
            }
            PropertyChanges {
                target: fi_Label___default
                textColor: GreenHouseThemeManager.theme.color("Text/White")
            }
        },
        State {
            when: !__mouseArea.pressed && (root.selectionIndex == root.itemIndex)
            name: "selected"
            PropertyChanges {
                target: fi_Background_9seg_24_24_24_24___default
                source: GreenHouseThemeManager.theme.asset("/367_3610.png")
            }
            PropertyChanges {
                target: fi_Label___default
                textColor: GreenHouseThemeManager.theme.color("Text/White")
            }
        }
        ]
        transitions: [

        ]
    }

    //----------------------------------------------------------------------------------------------
}
