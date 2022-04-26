import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0


//USES Image
//PREVIEW IMAGE qrc:/GeneratedComponents/assets/ProgressBar.png


//EDITABLE TRUE
Item {
    id: root
    
    //Exposed properties----------------------------------------------------------------------------
    property int progressValue: 0
    
    //----------------------------------------------------------------------------------------------
    
    //Exposed signals-------------------------------------------------------------------------------
    
    //----------------------------------------------------------------------------------------------
    
    //Local bindings--------------------------------------------------------------------------------
    width: 16
    height: 24
    
    //----------------------------------------------------------------------------------------------
    
    //Children--------------------------------------------------------------------------------------
    Image {
        id: image0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        
        
        
        
        
    }
    
    //----------------------------------------------------------------------------------------------
    
    //States----------------------------------------------------------------------------------------
    StateGroup { //
        states: [
        State {
            when: root.progressValue < 0
            name: "Value_0_State"
            PropertyChanges {
                target: image0
                source: GreenHouseThemeManager.theme.asset("/591_3020.png")
                
            }
            
        },
        State {
            when: root.progressValue >= 0 && root.progressValue < 1
            name: "Value_1_State"
            PropertyChanges {
                target: image0
                source: GreenHouseThemeManager.theme.asset("/575_2737.png")
                
            }
            
        },
        State {
            when: root.progressValue >= 1
            name: "Value_2_State"
            PropertyChanges {
                target: image0
                source: GreenHouseThemeManager.theme.asset("/575_2736.png")
                
            }
            
        }
        ]
        transitions: [
        
        ]
    }
    
    //----------------------------------------------------------------------------------------------
}
