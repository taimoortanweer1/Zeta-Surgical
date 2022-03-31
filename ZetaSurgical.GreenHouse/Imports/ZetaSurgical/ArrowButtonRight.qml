import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet

//USES Item
//USES ComponentsSet.AutoRepeatMouseArea
//USES BorderImage
//USES Image
//PREVIEW IMAGE qrc:/GeneratedComponents/assets/Button.png

//EDITABLE TRUE
Item {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    property bool doubleClickEnabeld: false
    property int minimumRepeatInterval: 100
    property int repeateInterval: 1000
    //REAL 1
    property alias icon_opacity: icon___default.opacity
    //ASSET /Icons/RightTriangle__DefaultState.png
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
    width: 64
    height: 64

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
        id: fi_Background_9seg_10_10_10_10___default
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: GreenHouseThemeManager.theme.asset("/48_2018.png")
        border.bottom: 10
        border.left: 10
        border.right: 10
        border.top: 10
    }
    Image {
        id: icon___default
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4
        z: 1
        source: GreenHouseThemeManager.theme.asset("/Icons/RightTriangle__DefaultState.png")
        visible: default_StateParent.visible
    }
    Image {
        id: icon___pressed
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4
        z: 1
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
                target: fi_Background_9seg_10_10_10_10___default
                source: GreenHouseThemeManager.theme.asset("/48_2018.png")
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
                target: fi_Background_9seg_10_10_10_10___default
                source: GreenHouseThemeManager.theme.asset("/164_7343.png")
            }
            PropertyChanges {
                target: pressed_StateParent
                visible: true
            }
        }
        ]
    }

    //----------------------------------------------------------------------------------------------
}
