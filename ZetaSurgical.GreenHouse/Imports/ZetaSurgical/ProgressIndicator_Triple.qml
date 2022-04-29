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
    width: 408
    height: 80

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
            when: root.progressValue < 1
            name: "Value_0_State"
            PropertyChanges {
                target: image0
                source: GreenHouseThemeManager.theme.asset("/366_3351.png")
            }
        },
        State {
            when: root.progressValue >= 1 && root.progressValue < 2
            name: "Value_1_State"
            PropertyChanges {
                target: image0
                source: GreenHouseThemeManager.theme.asset("/366_3350.png")
            }
        },
        State {
            when: root.progressValue >= 2
            name: "Value_2_State"
            PropertyChanges {
                target: image0
                source: GreenHouseThemeManager.theme.asset("/366_3349.png")
            }
        }
        ]
        transitions: [

        ]
    }

    //----------------------------------------------------------------------------------------------
}
