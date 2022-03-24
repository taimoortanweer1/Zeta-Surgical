import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet

//USES ComponentsSet.RegularTextInput
//USES BorderImage
//USES ComponentsSet.Label
//USES Item
//USES ComponentsSet.AutoRepeatMouseArea
//PREVIEW IMAGE qrc:/GeneratedComponents/assets/TextInput.png

//EDITABLE TRUE
FocusScope {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    property bool doubleClickEnabeld: false
    property bool filled_flag: false
    property int minimumRepeatInterval: 100
    property int repeateInterval: 1000
    //FONT Figma::Arial_ArialMT_18_50_0_0_0_0_0.2
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
    //TEXTVAL 128
    property alias fi_ID_verticalAlignment: fi_ID___default.verticalAlignment
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
    signal clicked() /*__mouseArea.clicked*/
    signal doubleClicked() /*__mouseArea.doubleClicked*/
    signal pressed() /*__mouseArea.pressed*/
    signal released() /*__mouseArea.released*/
    signal repeatingTriggered() /*__mouseArea.repeatingTriggered*/
    signal input_accepted() /*input.accepted*/
    signal input_textChanged(string text) /*input.textChanged*/

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 528
    height: 80

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    ComponentsSet.RegularTextInput {
        id: input
        anchors.left: parent.left
        anchors.leftMargin: 90
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
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
            source: GreenHouseThemeManager.theme.asset("/11_1323.png")
            border.bottom: 39
            border.left: 39
            border.right: 39
            border.top: 39
        }
        ComponentsSet.Label {
            id: fi_ID___filled
            anchors.left: parent.left
            anchors.leftMargin: 19
            anchors.verticalCenter: parent.verticalCenter
            z: 2
            width: 52
            height: 82
            text: fi_ID___default.text
            font: fi_ID___default.font
            textColor: GreenHouseThemeManager.theme.color("Text/Blue 2 - Input")
            opacity: fi_ID___default.opacity
            horizontalAlignment: fi_ID___default.horizontalAlignment
            verticalAlignment: fi_ID___default.verticalAlignment
            wrapMode: Text.WordWrap
            lineHeight: fi_ID___default.lineHeight
            lineHeightMode: fi_ID___default.lineHeightMode
            richText: fi_ID___default.richText
        }
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
    BorderImage {
        id: fi_Rectangle___default
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: GreenHouseThemeManager.theme.asset("/7_56.png")
        border.bottom: 39
        border.left: 39
        border.right: 39
        border.top: 39
    }
    ComponentsSet.Label {
        id: fi_ID___default
        anchors.left: parent.left
        anchors.leftMargin: 19
        anchors.verticalCenter: parent.verticalCenter
        z: 2
        width: 52
        height: 82
        text: qsTr("ID", "FigmaNode::7:78") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::7:78") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_18_50_0_0_0_0_0.2")
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
            when: !input.activeFocus
            name: "default"
            PropertyChanges {
                target: fi_ID___default
                textColor: GreenHouseThemeManager.theme.color("Text/User Input Label")
            }
            PropertyChanges {
                target: fi_Rectangle___default
                source: GreenHouseThemeManager.theme.asset("/7_56.png")
            }
        },
        State {
            when: input.activeFocus
            name: "selected"
            PropertyChanges {
                target: fi_ID___default
                textColor: GreenHouseThemeManager.theme.color("Text/Blue 2 - Input")
            }
            PropertyChanges {
                target: fi_Rectangle___default
                source: GreenHouseThemeManager.theme.asset("/11_1315.png")
            }
            PropertyChanges {
                target: input
                color: GreenHouseThemeManager.theme.color("Text/Blue 2 - Input")
            }
        }
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
    }

    //----------------------------------------------------------------------------------------------
}
