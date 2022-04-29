import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet

//USES BorderImage
//USES ComponentsSet.RegularTextInput

//EDITABLE TRUE
FocusScope {
    id: root

    //Exposed properties----------------------------------------------------------------------------
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
    width: 100
    height: 40

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    BorderImage {
        id: fi_BG_9seg_24_24_24_24
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: GreenHouseThemeManager.theme.asset("/628_3477.png")
        border.bottom: 19
        border.left: 19
        border.right: 19
        border.top: 19
    }
    ComponentsSet.RegularTextInput {
        id: input
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        z: 998
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_32_50_0_0_0_0_0.2")
        color: GreenHouseThemeManager.theme.color("Text/Blue 2 - Input")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        clip: true

        onAccepted: {
            root.input_accepted();
        }
        onTextChanged: {
            root.input_textChanged(text);
        }
    }

    //----------------------------------------------------------------------------------------------

    //States----------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------
}
