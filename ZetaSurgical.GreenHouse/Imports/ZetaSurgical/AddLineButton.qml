import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet

//USES Item
//USES ComponentsSet.AutoRepeatMouseArea
//USES BorderImage
//USES ComponentsSet.Label
//USES Image
//PREVIEW IMAGE qrc:/GeneratedComponents/assets/Button.png

//EDITABLE TRUE
Item {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    property bool doubleClickEnabeld: false
    property int minimumRepeatInterval: 100
    property int repeateInterval: 1000
    //FONT Figma::Arial_ArialMT_24_50_0_0_0_0_0.2
    property alias fi_ADD_POINT_font: fi_ADD_POINT___default.font
    //TEXTHAL 4
    property alias fi_ADD_POINT_horizontalAlignment: fi_ADD_POINT___default.horizontalAlignment
    //REAL 20
    property alias fi_ADD_POINT_lineHeight: fi_ADD_POINT___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_ADD_POINT_lineHeightMode: fi_ADD_POINT___default.lineHeightMode
    //REAL 1
    property alias fi_ADD_POINT_opacity: fi_ADD_POINT___default.opacity
    //BOOL false
    property alias fi_ADD_POINT_richText: fi_ADD_POINT___default.richText
    //TRANSLATABLE ADD POINT
    property alias fi_ADD_POINT_text: fi_ADD_POINT___default.text
    //COLOR Icon/White
    property alias fi_ADD_POINT_textColor: fi_ADD_POINT___default.textColor
    //TEXTVAL 128
    property alias fi_ADD_POINT_verticalAlignment: fi_ADD_POINT___default.verticalAlignment
    //REAL 1
    property alias icon_opacity: icon___default.opacity
    //ASSET /Icons/Plus__DefaultState.png
    property alias icon_source: icon___default.source

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
        id: default_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }
    Item {
        id: pressed_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
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
        source: GreenHouseThemeManager.theme.asset("/7_1300.png")
        border.bottom: 39
        border.left: 39
        border.right: 39
        border.top: 39
    }
    ComponentsSet.Label {
        id: fi_ADD_POINT___default
        anchors.left: parent.left
        anchors.leftMargin: 89
        anchors.right: parent.right
        anchors.rightMargin: 22
        anchors.verticalCenter: parent.verticalCenter
        z: 1
        height: 82
        text: qsTr("ADD POINT", "FigmaNode::7:1311") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::7:1311") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_24_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Icon/White")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }
    Image {
        id: icon___default
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        z: 2
        width: 48
        height: 48
        source: GreenHouseThemeManager.theme.asset("/Icons/Plus__DefaultState.png")
        visible: default_StateParent.visible
    }
    Image {
        id: icon___pressed
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        z: 2
        width: 48
        height: 48
        source: icon___default.source
        opacity: icon___default.opacity
        visible: pressed_StateParent.visible
    }

    //----------------------------------------------------------------------------------------------

    //States----------------------------------------------------------------------------------------
    StateGroup { //
        states: [
        State {
            when: !__mouseArea.pressed
            name: "default"
            PropertyChanges {
                target: default_StateParent
                visible: true
            }
            PropertyChanges {
                target: fi_Background_9seg_40_40_40_40___default
                source: GreenHouseThemeManager.theme.asset("/7_1300.png")
            }
            PropertyChanges {
                target: pressed_StateParent
                visible: false
            }
        },
        State {
            when: __mouseArea.pressed
            name: "pressed"
            PropertyChanges {
                target: default_StateParent
                visible: false
            }
            PropertyChanges {
                target: fi_Background_9seg_40_40_40_40___default
                source: GreenHouseThemeManager.theme.asset("/22_2501.png")
            }
            PropertyChanges {
                target: pressed_StateParent
                visible: true
            }
        }
        ]
        transitions: [

        ]
    }

    //----------------------------------------------------------------------------------------------
}
