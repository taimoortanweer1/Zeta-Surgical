import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet

//USES BorderImage
//USES ComponentsSet.Label
//USES Item
//USES ComponentsSet.AutoRepeatMouseArea
//PREVIEW IMAGE qrc:/GeneratedComponents/assets/Button.png

//EDITABLE TRUE
Item {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    property bool doubleClickEnabeld: false
    property bool invalid_flag: false
    property int minimumRepeatInterval: 100
    property int repeateInterval: 1000
    //FONT Figma::Arial_ArialMT_30_50_0_0_0_0_-0.6
    property alias fi_Label_font: fi_Label___default.font
    //TEXTHAL 4
    property alias fi_Label_horizontalAlignment: fi_Label___default.horizontalAlignment
    //REAL 35.160000000000004
    property alias fi_Label_lineHeight: fi_Label___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_Label_lineHeightMode: fi_Label___default.lineHeightMode
    //REAL 1
    property alias fi_Label_opacity: fi_Label___default.opacity
    //BOOL false
    property alias fi_Label_richText: fi_Label___default.richText
    //TRANSLATABLE Q
    property alias fi_Label_text: fi_Label___default.text
    //COLOR Dark Ink
    property alias fi_Label_textColor: fi_Label___default.textColor
    //TEXTVAL 32
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
    width: 152
    height: 64

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    Item {
        id: invalid_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        visible: false

        BorderImage {
            id: fi_Rectangle_362___invalid
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: GreenHouseThemeManager.theme.asset("/211_6848.png")
            border.bottom: 10
            border.left: 10
            border.right: 10
            border.top: 10
        }
        ComponentsSet.Label {
            id: fi_Label___invalid
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 24
            anchors.bottom: parent.bottom
            z: 1
            height: 48
            text: fi_Label___default.text
            font: fi_Label___default.font
            textColor: fi_Label___default.textColor
            opacity: fi_Label___default.opacity
            horizontalAlignment: fi_Label___default.horizontalAlignment
            verticalAlignment: fi_Label___default.verticalAlignment
            wrapMode: Text.WordWrap
            lineHeight: fi_Label___default.lineHeight
            lineHeightMode: fi_Label___default.lineHeightMode
            richText: fi_Label___default.richText
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
        id: fi_Rectangle_362___default
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: GreenHouseThemeManager.theme.asset("/210_4927.png")
        border.bottom: 10
        border.left: 10
        border.right: 10
        border.top: 10
    }
    ComponentsSet.Label {
        id: fi_Label___default
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.rightMargin: 24
        anchors.bottom: parent.bottom
        z: 1
        height: 48
        text: qsTr("Q", "FigmaNode::370:6022") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::370:6022") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_30_50_0_0_0_0_-0.6")
        textColor: GreenHouseThemeManager.theme.color("Dark Ink")
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
        lineHeight: 35.160000000000004
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
                target: fi_Rectangle_362___default
                border.bottom: 10
                border.left: 10
                border.right: 10
                border.top: 10
                source: GreenHouseThemeManager.theme.asset("/210_4927.png")
            }
        },
        State {
            when: __mouseArea.pressed
            name: "pressed"
            PropertyChanges {
                target: fi_Rectangle_362___default
                border.bottom: 14
                border.left: 14
                border.right: 14
                border.top: 14
                source: GreenHouseThemeManager.theme.asset("/211_5215.png")
            }
        }
        ]
    }
    StateGroup { // generic_invalid
        states: [
        State {
            when: root.invalid_flag
            name: "invalid"
            PropertyChanges {
                target: invalid_StateParent
                visible: true
                z: 999
            }
        }
        ]
    }

    //----------------------------------------------------------------------------------------------
}
