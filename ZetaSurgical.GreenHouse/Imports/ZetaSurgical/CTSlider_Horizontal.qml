import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0

//USES BorderImage
//PREVIEW IMAGE qrc:/GeneratedComponents/assets/Slider.png

//EDITABLE TRUE
Item {
    id: root

    //Exposed properties----------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 176
    height: 40

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    BorderImage {
        id: fi_Rectangle_10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        height: 8
        source: GreenHouseThemeManager.theme.asset("/78_2160.png")
        border.bottom: 3
        border.left: 3
        border.right: 3
        border.top: 3
    }
    BorderImage {
        id: fi_Rectangle_11
        anchors.left: parent.left
        anchors.leftMargin: 24
        anchors.verticalCenter: parent.verticalCenter
        z: 1
        width: 24
        height: 24
        source: GreenHouseThemeManager.theme.asset("/78_2161.png")
        border.bottom: 11
        border.left: 11
        border.right: 11
        border.top: 11
    }

    //----------------------------------------------------------------------------------------------

    //States----------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------
}
