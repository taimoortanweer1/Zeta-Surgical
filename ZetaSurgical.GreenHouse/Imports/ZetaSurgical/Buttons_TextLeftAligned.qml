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
    property bool activated_flag: false
    property bool doubleClickEnabeld: false
    property int minimumRepeatInterval: 100
    property int repeateInterval: 1000
    //FONT Figma::Arial_ArialMT_24_50_0_0_0_0_0.2
    property alias fi_Default_Target_font: fi_Default_Target___activated.font
    //TEXTHAL 1
    property alias fi_Default_Target_horizontalAlignment: fi_Default_Target___activated.horizontalAlignment
    //REAL 20
    property alias fi_Default_Target_lineHeight: fi_Default_Target___activated.lineHeight
    //TEXTLINEHM 1
    property alias fi_Default_Target_lineHeightMode: fi_Default_Target___activated.lineHeightMode
    //REAL 1
    property alias fi_Default_Target_opacity: fi_Default_Target___activated.opacity
    //BOOL false
    property alias fi_Default_Target_richText: fi_Default_Target___activated.richText
    //TRANSLATABLE Default Target
    property alias fi_Default_Target_text: fi_Default_Target___activated.text
    //COLOR Icon/White
    property alias fi_Default_Target_textColor: fi_Default_Target___activated.textColor
    //TEXTVAL 128
    property alias fi_Default_Target_verticalAlignment: fi_Default_Target___activated.verticalAlignment

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
    Item {
        id: activated_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        visible: false

        BorderImage {
            id: fi_Background_9seg_40_40_40_40___activated
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: GreenHouseThemeManager.theme.asset("/34_2803.png")
            border.bottom: 39
            border.left: 39
            border.right: 39
            border.top: 39
        }
        ComponentsSet.Label {
            id: fi_Default_Target___activated
            anchors.left: parent.left
            anchors.leftMargin: 31
            anchors.right: parent.right
            anchors.rightMargin: 143
            anchors.verticalCenter: parent.verticalCenter
            z: 1
            height: 82
            text: qsTr("Default Target", "FigmaNode::34:2804") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::34:2804") : "")
            font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_24_50_0_0_0_0_0.2")
            textColor: GreenHouseThemeManager.theme.color("Icon/White")
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            lineHeight: 20
            lineHeightMode: Text.FixedHeight
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
        id: fi_Background_9seg_40_40_40_40___default
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: GreenHouseThemeManager.theme.asset("/34_2708.png")
        border.bottom: 39
        border.left: 39
        border.right: 39
        border.top: 39
    }
    ComponentsSet.Label {
        id: fi_Default_Target___default
        anchors.left: parent.left
        anchors.leftMargin: 31
        anchors.right: parent.right
        anchors.rightMargin: 143
        anchors.verticalCenter: parent.verticalCenter
        z: 1
        height: 82
        text: fi_Default_Target___activated.text
        font: fi_Default_Target___activated.font
        textColor: fi_Default_Target___activated.textColor
        opacity: fi_Default_Target___activated.opacity
        horizontalAlignment: fi_Default_Target___activated.horizontalAlignment
        verticalAlignment: fi_Default_Target___activated.verticalAlignment
        wrapMode: Text.WordWrap
        lineHeight: fi_Default_Target___activated.lineHeight
        lineHeightMode: fi_Default_Target___activated.lineHeightMode
        richText: fi_Default_Target___activated.richText
    }

    //----------------------------------------------------------------------------------------------

    //States----------------------------------------------------------------------------------------
    StateGroup { //
        states: [
        State {
            when: !__mouseArea.pressed
            name: "default"
            PropertyChanges {
                target: fi_Background_9seg_40_40_40_40___default
                source: GreenHouseThemeManager.theme.asset("/34_2708.png")
            }
        },
        State {
            when: __mouseArea.pressed
            name: "pressed"
            PropertyChanges {
                target: fi_Background_9seg_40_40_40_40___default
                source: GreenHouseThemeManager.theme.asset("/146_1677.png")
            }
        }
        ]
    }
    StateGroup { // generic_activated
        states: [
        State {
            when: root.activated_flag
            name: "activated"
            PropertyChanges {
                target: activated_StateParent
                visible: true
                z: 999
            }
        }
        ]
    }

    //----------------------------------------------------------------------------------------------
}
