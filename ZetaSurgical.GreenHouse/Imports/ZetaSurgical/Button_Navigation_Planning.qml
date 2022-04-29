import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet

//USES Image
//USES ComponentsSet.Label
//USES Item
//USES ComponentsSet.AutoRepeatMouseArea
//PREVIEW IMAGE qrc:/GeneratedComponents/assets/Button.png

//EDITABLE TRUE
Item {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    property bool complete_flag: false
    property bool doubleClickEnabeld: false
    property int itemIndex: 0
    property int minimumRepeatInterval: 100
    property int repeateInterval: 1000
    property int selectionIndex: -1
    //FONT Figma::Arial_ArialMT_16_50_0_0_0_0_0.2
    property alias fi_Planning_font: fi_Planning___complete.font
    //TEXTHAL 4
    property alias fi_Planning_horizontalAlignment: fi_Planning___complete.horizontalAlignment
    //REAL 20
    property alias fi_Planning_lineHeight: fi_Planning___complete.lineHeight
    //TEXTLINEHM 1
    property alias fi_Planning_lineHeightMode: fi_Planning___complete.lineHeightMode
    //REAL 1
    property alias fi_Planning_opacity: fi_Planning___complete.opacity
    //BOOL false
    property alias fi_Planning_richText: fi_Planning___complete.richText
    //TRANSLATABLE Planning
    property alias fi_Planning_text: fi_Planning___complete.text
    //COLOR Icon/White
    property alias fi_Planning_textColor: fi_Planning___complete.textColor
    //TEXTVAL 32
    property alias fi_Planning_verticalAlignment: fi_Planning___complete.verticalAlignment
    //ASSET /Icons/NavbarPlanning__CompletedState.png
    property alias icon___complete_source: icon___complete.source
    //REAL 1
    property alias icon_opacity: icon___complete.opacity
    //ASSET /Icons/NavbarPlanning__DefaultState.png
    property alias icon___default_source: icon___default.source
    //ASSET /Icons/NavbarPlanning__SelectedState.png
    property alias icon___selected_source: icon___selected.source

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------
    signal clicked() /*__mouseArea.clicked*/
    signal doubleClicked() /*__mouseArea.doubleClicked*/
    signal pressed() /*__mouseArea.pressed*/
    signal released() /*__mouseArea.released*/
    signal repeatingTriggered() /*__mouseArea.repeatingTriggered*/

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 128
    height: 128

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    Item {
        id: complete_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        visible: false

        Image {
            id: icon___complete
            anchors.top: parent.top
            anchors.topMargin: 16
            anchors.horizontalCenter: parent.horizontalCenter
            width: 88
            height: 88
            source: GreenHouseThemeManager.theme.asset("/Icons/NavbarPlanning__CompletedState.png")
        }
        ComponentsSet.Label {
            id: fi_Planning___complete
            anchors.left: parent.left
            anchors.leftMargin: -1
            anchors.right: parent.right
            anchors.rightMargin: -1
            anchors.top: parent.top
            anchors.topMargin: 95
            z: 1
            height: 34
            text: qsTr("Planning", "FigmaNode::158:4930") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::158:4930") : "")
            font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_16_50_0_0_0_0_0.2")
            textColor: GreenHouseThemeManager.theme.color("Icon/White")
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            lineHeight: 20
            lineHeightMode: Text.FixedHeight
        }
    }
    Item {
        id: default_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }
    Item {
        id: selected_StateParent
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
    ComponentsSet.Label {
        id: fi_Planning___default
        anchors.left: parent.left
        anchors.leftMargin: -1
        anchors.right: parent.right
        anchors.rightMargin: -1
        anchors.top: parent.top
        anchors.topMargin: 95
        z: 1
        height: 34
        text: fi_Planning___complete.text
        font: fi_Planning___complete.font
        textColor: fi_Planning___complete.textColor
        opacity: fi_Planning___complete.opacity
        horizontalAlignment: fi_Planning___complete.horizontalAlignment
        verticalAlignment: fi_Planning___complete.verticalAlignment
        wrapMode: Text.WordWrap
        lineHeight: fi_Planning___complete.lineHeight
        lineHeightMode: fi_Planning___complete.lineHeightMode
        richText: fi_Planning___complete.richText
    }
    Image {
        id: icon___default
        anchors.top: parent.top
        anchors.topMargin: 16
        anchors.horizontalCenter: parent.horizontalCenter
        width: 88
        height: 88
        source: GreenHouseThemeManager.theme.asset("/Icons/NavbarPlanning__DefaultState.png")
        opacity: icon___complete.opacity
        visible: default_StateParent.visible
    }
    Image {
        id: icon___selected
        anchors.top: parent.top
        anchors.topMargin: 16
        anchors.horizontalCenter: parent.horizontalCenter
        width: 88
        height: 88
        source: GreenHouseThemeManager.theme.asset("/Icons/NavbarPlanning__SelectedState.png")
        opacity: icon___complete.opacity
        visible: selected_StateParent.visible
    }

    //----------------------------------------------------------------------------------------------

    //States----------------------------------------------------------------------------------------
    StateGroup { //
        states: [
        State {
            when: !(root.selectionIndex == root.itemIndex)
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
            when: (root.selectionIndex == root.itemIndex)
            name: "selected"
            PropertyChanges {
                target: default_StateParent
                visible: false
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
    StateGroup { // generic_complete
        states: [
        State {
            when: root.complete_flag
            name: "complete"
            PropertyChanges {
                target: complete_StateParent
                visible: true
                z: 999
            }
        }
        ]
        transitions: [

        ]
    }

    //----------------------------------------------------------------------------------------------
}
