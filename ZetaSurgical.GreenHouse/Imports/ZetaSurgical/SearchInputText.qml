import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet

//USES BorderImage
//USES Image
//USES Item
//USES ComponentsSet.RegularTextInput
//PREVIEW IMAGE qrc:/GeneratedComponents/assets/TextInput.png

//EDITABLE TRUE
FocusScope {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    property bool filled_flag: false
    //ASSET /Icons/Search__DefaultState.png
    property alias icon___default_source: icon___default.source
    //REAL 1
    property alias icon_opacity: icon___default.opacity
    //ASSET /Icons/Search__SelectedState.png
    property alias icon___filled_source: icon___filled.source
    //ASSET /Icons/Search__SelectedState.png
    property alias icon___selected_source: icon___selected.source
    //BOOL false
    property alias input_autoClear: input.autoClear
    //COLOR Text/User Input Label
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
    width: 816
    height: 48

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    Item {
        id: default_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        BorderImage {
            id: fi_Rectangle___default
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: GreenHouseThemeManager.theme.asset("/7_1289.png")
            border.bottom: 23
            border.left: 23
            border.right: 23
            border.top: 23
        }
        Image {
            id: icon___default
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.verticalCenter: parent.verticalCenter
            z: 2
            width: 32
            height: 32
            source: GreenHouseThemeManager.theme.asset("/Icons/Search__DefaultState.png")
        }
    }
    ComponentsSet.RegularTextInput {
        id: input
        anchors.left: parent.left
        anchors.leftMargin: 64
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -2
        z: 998
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_28_50_0_0_0_0_0.2")
        color: GreenHouseThemeManager.theme.color("Text/User Input Label")
        verticalAlignment: Text.AlignVCenter
        clip: true

        onAccepted: {
            root.input_accepted();
        }
        onTextChanged: {
            root.input_textChanged(text);
        }
    }
    Item {
        id: filled_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        visible: false

        BorderImage {
            id: fi_Rectangle___filled
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: GreenHouseThemeManager.theme.asset("/15_1729.png")
            border.bottom: 24
            border.left: 24
            border.right: 24
            border.top: 24
        }
        Image {
            id: icon___filled
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.top: parent.top
            anchors.topMargin: 8
            z: 2
            width: 32
            height: 32
            source: GreenHouseThemeManager.theme.asset("/Icons/Search__SelectedState.png")
            opacity: icon___default.opacity
        }
    }
    Item {
        id: selected_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        BorderImage {
            id: fi_Rectangle___selected
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: GreenHouseThemeManager.theme.asset("/11_1351.png")
            border.bottom: 24
            border.left: 24
            border.right: 24
            border.top: 24
        }
        Image {
            id: icon___selected
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -1
            z: 2
            width: 32
            height: 32
            source: GreenHouseThemeManager.theme.asset("/Icons/Search__SelectedState.png")
            opacity: icon___default.opacity
        }
    }

    //----------------------------------------------------------------------------------------------

    //States----------------------------------------------------------------------------------------
    StateGroup { //
        states: [
        State {
            when: !input.activeFocus
            name: "default"
            PropertyChanges {
                target: default_StateParent
                visible: true
            }
            PropertyChanges {
                target: selected_StateParent
                visible: false
            }
        },
        State {
            when: input.activeFocus
            name: "selected"
            PropertyChanges {
                target: default_StateParent
                visible: false
            }
            PropertyChanges {
                target: input
                color: GreenHouseThemeManager.theme.color("Text/Blue 2 - Input")
            }
            PropertyChanges {
                target: selected_StateParent
                visible: true
            }
        }
        ]
        transitions: [

        ]
    }
    StateGroup { // HintAndInput
        states: [
        State {
            when: input.text === "" && !input.activeFocus
            name: "InputEmptyAndNotFocused"
        },
        State {
            when: input.text !== "" || input.activeFocus
            name: "InputNotEmptyOrFocused"
        }
        ]
        transitions: [

        ]
    }
    StateGroup { // generic_filled
        states: [
        State {
            when: root.filled_flag
            name: "filled"
            PropertyChanges {
                target: filled_StateParent
                visible: true
                z: 999
            }
            PropertyChanges {
                target: input
                color: GreenHouseThemeManager.theme.color("Text/Blue 2 - Input")
            }
        }
        ]
        transitions: [

        ]
    }

    //----------------------------------------------------------------------------------------------
}
