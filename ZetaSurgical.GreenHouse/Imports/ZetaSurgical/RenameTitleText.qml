import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet

//USES ComponentsSet.RegularTextInput
//USES BorderImage
//USES ComponentsSet.Label

//EDITABLE TRUE
FocusScope {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    property int itemIndex: 0
    property int selectionIndex: -1
    //FONT Figma::Arial_ArialMT_22_50_0_0_0_0_0.2
    property alias fi_ID_font: fi_ID___default.font
    //TEXTHAL 4
    property alias fi_ID_horizontalAlignment: fi_ID___default.horizontalAlignment
    //REAL 20
    property alias fi_ID_lineHeight: fi_ID___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_ID_lineHeightMode: fi_ID___default.lineHeightMode
    //REAL 1
    property alias fi_ID_opacity: fi_ID___default.opacity
    //BOOL false
    property alias fi_ID_richText: fi_ID___default.richText
    //TRANSLATABLE ID
    property alias fi_ID_text: fi_ID___default.text
    //COLOR Text/User Input Label
    property alias fi_ID_textColor: fi_ID___default.textColor
    //TEXTVAL 128
    property alias fi_ID_verticalAlignment: fi_ID___default.verticalAlignment
    //BOOL false
    property alias input_autoClear: input.autoClear
    //COLOR Text/Blue 2 - Input
    property alias input_color: input.color
    //TEXTECHOMODE 0
    property alias input_echoMode: input.echoMode
    //BOOL true
    property alias input_enabled: input.enabled
    //BOOL false
    property alias input_focus: input.inputFocus
    //STRING
    property alias input_inputMask: input.inputMask
    //TEXTINPUTHINTS 0
    property alias input_inputMethodHints: input.inputMethodHints
    //TRANSLATABLE
    property alias input_inputText: input.text
    //STRING
    property alias input_passwordCharacter: input.passwordCharacter
    //STRING
    property alias input_regExp: input.regExp

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------
    signal input_accepted() /*input.accepted*/
    signal input_textChanged(string text) /*input.textChanged*/

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 328
    height: 48

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    ComponentsSet.RegularTextInput {
        id: input
        anchors.left: parent.left
        anchors.leftMargin: 72
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        z: 998
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_32_50_0_0_0_0_0.2")
        color: GreenHouseThemeManager.theme.color("Text/Blue 2 - Input")
        verticalAlignment: Text.AlignVCenter
        clip: true

        onAccepted: {
            root.input_accepted();
        }
        onTextChanged: {
            root.input_textChanged(text);
        }
    }
    BorderImage {
        id: fi_Rectangle___default
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: GreenHouseThemeManager.theme.asset("/536_2724.png")
        border.bottom: 23
        border.left: 23
        border.right: 23
        border.top: 23
    }
    ComponentsSet.Label {
        id: fi_ID___default
        anchors.left: parent.left
        anchors.leftMargin: -1
        anchors.verticalCenter: parent.verticalCenter
        z: 2
        width: 66
        height: 50
        text: qsTr("ID", "FigmaNode::536:2754") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::536:2754") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_22_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Text/User Input Label")
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
            when: !(root.selectionIndex == root.itemIndex)
            name: "default"
            PropertyChanges {
                target: fi_Rectangle___default
                source: GreenHouseThemeManager.theme.asset("/536_2724.png")
            }
        },
        State {
            when: (root.selectionIndex == root.itemIndex)
            name: "selected"
            PropertyChanges {
                target: fi_Rectangle___default
                source: GreenHouseThemeManager.theme.asset("/536_2763.png")
            }
        }
        ]
    }

    //----------------------------------------------------------------------------------------------
}