import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet

//USES BorderImage
//USES ComponentsSet.RegularTextInput
//USES ComponentsSet.Label
//USES ComponentsSet.AutoRepeatMouseArea
//PREVIEW IMAGE qrc:/GeneratedComponents/assets/TextInput.png

//EDITABLE TRUE
FocusScope {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    property bool doubleClickEnabeld: false
    property int minimumRepeatInterval: 100
    property int repeateInterval: 1000
    //FONT Figma::Arial_ArialMT_22_50_0_0_0_0_0.2
    property alias fi_ID_font: fi_ID.font
    //TEXTHAL 4
    property alias fi_ID_horizontalAlignment: fi_ID.horizontalAlignment
    //COLOR Text/Blue 2 - Input
    property alias fi_ID_labelColor: fi_ID.textColor
    //REAL 20
    property alias fi_ID_lineHeight: fi_ID.lineHeight
    //TEXTLINEHM 1
    property alias fi_ID_lineHeightMode: fi_ID.lineHeightMode
    //REAL 1
    property alias fi_ID_opacity: fi_ID.opacity
    //BOOL false
    property alias fi_ID_richText: fi_ID.richText
    //TRANSLATABLE ID
    property alias fi_ID_text: fi_ID.text
    //TEXTVAL 128
    property alias fi_ID_verticalAlignment: fi_ID.verticalAlignment
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
    BorderImage {
        id: fi_Rectangle
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
    ComponentsSet.RegularTextInput {
        id: input
        anchors.left: parent.left
        anchors.leftMargin: 80
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        z: 998
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_28_50_0_0_0_0_0.2")
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
    ComponentsSet.Label {
        id: fi_ID
        anchors.left: parent.left
        anchors.leftMargin: -1
        anchors.verticalCenter: parent.verticalCenter
        z: 2
        width: 82
        height: 82
        text: qsTr("ID", "FigmaNode::11:1325") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::11:1325") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_22_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Text/Blue 2 - Input")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
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

    //----------------------------------------------------------------------------------------------

    //States----------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------
}
