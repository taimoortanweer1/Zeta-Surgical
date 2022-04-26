import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet


//USES Item
//USES ComponentsSet.AutoRepeatMouseArea
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
    property alias fi_Ellipse_220_opacity: fi_Ellipse_220___off.opacity
    //ASSET /Icons/View__SelectedState.png
    property alias icon___off_source: icon___off.source
    //REAL 1
    property alias icon_opacity: icon___off.opacity
    //ASSET /Icons/View__DefaultState.png
    property alias icon___on_source: icon___on.source
    
    //----------------------------------------------------------------------------------------------
    
    //Exposed signals-------------------------------------------------------------------------------
    signal doubleClicked() /*__mouseArea.doubleClicked*/
    signal pressed() /*__mouseArea.pressed*/
    signal released() /*__mouseArea.released*/
    signal repeatingTriggered() /*__mouseArea.repeatingTriggered*/
    signal toggled() /*__mouseArea.clicked*/
    
    //----------------------------------------------------------------------------------------------
    
    //Local bindings--------------------------------------------------------------------------------
    width: 64
    height: 64
    
    //----------------------------------------------------------------------------------------------
    
    //Children--------------------------------------------------------------------------------------
    Item {
        id: off_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        clip: true
        
        
        
        
        
    }
    Item {
        id: on_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        clip: true
        
        
        
        
        
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
    Image {
        id: fi_Ellipse_220___off
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: GreenHouseThemeManager.theme.asset("/184_2070.png")
        
        
        
        
        
    }
    Image {
        id: icon___off
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        z: 1
        source: GreenHouseThemeManager.theme.asset("/Icons/View__SelectedState.png")
        visible: off_StateParent.visible
        
        
        
        
        
    }
    Image {
        id: icon___on
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        z: 1
        source: GreenHouseThemeManager.theme.asset("/Icons/View__DefaultState.png")
        opacity: icon___off.opacity
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
                target: fi_Ellipse_220___off
                source: GreenHouseThemeManager.theme.asset("/184_2070.png")
                
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
                target: fi_Ellipse_220___off
                source: GreenHouseThemeManager.theme.asset("/184_2030.png")
                
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
