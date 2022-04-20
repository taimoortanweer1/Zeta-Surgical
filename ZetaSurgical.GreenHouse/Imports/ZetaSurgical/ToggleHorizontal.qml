import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet

//USES Item
//USES ComponentsSet.AutoRepeatMouseArea
//USES BorderImage
//USES Image

//EDITABLE TRUE
Item {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    property bool doubleClickEnabeld: false
    property int minimumRepeatInterval: 100
    property bool on: false
    property int repeateInterval: 1000
    //REAL 1
    property alias fi_Ellipse_227_opacity: fi_Ellipse_227___off.opacity

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------
    signal doubleClicked() /*__mouseArea.doubleClicked*/
    signal pressed() /*__mouseArea.pressed*/
    signal released() /*__mouseArea.released*/
    signal repeatingTriggered() /*__mouseArea.repeatingTriggered*/
    signal toggled() /*__mouseArea.clicked*/

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 80
    height: 40

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    Item {
        id: off_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }
    Item {
        id: on_StateParent
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
            root.toggled();
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
        id: fi_Rectangle_108___off
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: GreenHouseThemeManager.theme.asset("/174_1852.png")
        border.bottom: 19
        border.left: 19
        border.right: 19
        border.top: 19
    }
    Image {
        id: fi_Ellipse_227___off
        anchors.left: parent.left
        anchors.leftMargin: 2
        anchors.right: parent.right
        anchors.rightMargin: 42
        anchors.top: parent.top
        anchors.topMargin: 2
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 2
        z: 1
        source: GreenHouseThemeManager.theme.asset("/174_1853.png")
        visible: off_StateParent.visible
    }
    Image {
        id: fi_Ellipse_227___on
        anchors.left: parent.left
        anchors.leftMargin: 42
        anchors.right: parent.right
        anchors.rightMargin: 2
        anchors.top: parent.top
        anchors.topMargin: 2
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 2
        z: 1
        source: GreenHouseThemeManager.theme.asset("/174_1850.png")
        opacity: fi_Ellipse_227___off.opacity
        visible: on_StateParent.visible
    }

    //----------------------------------------------------------------------------------------------

    //States----------------------------------------------------------------------------------------
    StateGroup { //
        states: [
        State {
            when: !root.on
            name: "off"
            PropertyChanges {
                target: fi_Rectangle_108___off
                source: GreenHouseThemeManager.theme.asset("/174_1852.png")
            }
            PropertyChanges {
                target: off_StateParent
                visible: true
            }
            PropertyChanges {
                target: on_StateParent
                visible: false
            }
        },
        State {
            when: root.on
            name: "on"
            PropertyChanges {
                target: fi_Rectangle_108___off
                source: GreenHouseThemeManager.theme.asset("/174_1849.png")
            }
            PropertyChanges {
                target: off_StateParent
                visible: false
            }
            PropertyChanges {
                target: on_StateParent
                visible: true
            }
        }
        ]
        transitions: [

        ]
    }

    //----------------------------------------------------------------------------------------------
}
