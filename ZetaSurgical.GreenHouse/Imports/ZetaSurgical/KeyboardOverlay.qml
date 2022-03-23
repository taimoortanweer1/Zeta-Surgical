import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Decorative 1.0 as DecorativeSet

//USES Item
//USES Image
//USES DecorativeSet.DecoratedItem
//USES Rectangle

//EDITABLE TRUE
Item {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    //COLOR Figma::0_196_196_196
    property alias fi_Rectangle_9_color: fi_Rectangle_9.color
    //REAL 1
    property alias fi_Rectangle_9_opacity: fi_Rectangle_9.opacity
    //REAL 1
    property alias fi_Union_opacity: fi_Union.opacity
    //ASSET /7_1443.png
    property alias fi_Union_source: fi_Union.source

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 1920
    height: 428

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    Item {
        id: fi_TouchKeyboard
        anchors.left: parent.left
        anchors.leftMargin: 7
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 18
        width: 1906
        height: 410

        Item {
            id: fi__iPad___Toolbar
            anchors.left: parent.left
            anchors.top: parent.top
            width: 1906
            height: 62

            Item {
                id: fi_Helpers
                anchors.left: parent.left
                anchors.leftMargin: 11
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 18
                width: 122
                height: 32
                clip: true

                Item {
                    id: fi_previous
                    anchors.left: parent.left
                    anchors.top: parent.top
                    width: 32
                    height: 32
                    clip: true
                }
                Item {
                    id: fi_next
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    z: 1
                    width: 32
                    height: 32
                    clip: true
                }
                Item {
                    id: fi_clipboard
                    anchors.right: parent.right
                    anchors.top: parent.top
                    z: 2
                    width: 32
                    height: 32
                    clip: true

                    Image {
                        id: fi_Union
                        anchors.left: parent.left
                        anchors.leftMargin: 6
                        anchors.top: parent.top
                        anchors.topMargin: 4
                        z: 1
                        width: 21
                        height: 25
                        source: GreenHouseThemeManager.theme.asset("/7_1443.png")
                    }
                }
            }
        }
        Item {
            id: fi__iPad___Numeric
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 62
            z: 1
            width: 1906
            height: 60

            DecorativeSet.DecoratedItem {
                id: fi__Keys___Button
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: 134
                source: GreenHouseThemeManager.theme.asset("/7_1445.png")
                verticalCenterOffset: 1
            }
            Item {
                id: fi_wrapper
                anchors.left: parent.left
                anchors.leftMargin: 4
                anchors.right: parent.right
                anchors.rightMargin: 146
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                z: 1

                DecorativeSet.DecoratedItem {
                    id: fi__Keys___Top_Row
                    anchors.left: parent.left
                    anchors.leftMargin: 1627
                    anchors.right: parent.right
                    anchors.rightMargin: 2
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    z: 12
                    source: GreenHouseThemeManager.theme.asset("/7_1484.png")
                    verticalCenterOffset: 1
                }
            }
        }
        Rectangle {
            id: fi_Rectangle_9
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 122
            z: 2
            width: 1906
            height: 6
            color: GreenHouseThemeManager.theme.color("Figma::0_196_196_196")
            border.color: GreenHouseThemeManager.theme.color("Figma::0_0_0_0")
            border.width: 1
        }
        DecorativeSet.DecoratedItem {
            id: fi__iPad___Alphabet_QWERTY
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 128
            z: 3
            width: 1906
            height: 198
            source: GreenHouseThemeManager.theme.asset("/7_1488.png")
        }
        DecorativeSet.DecoratedItem {
            id: fi__iPad___Controller
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 326
            z: 4
            width: 1906
            height: 72
            source: GreenHouseThemeManager.theme.asset("/7_1581.png")
            clip: true
        }
        Item {
            id: fi__iPad___Dragger
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 398
            z: 5
            width: 1906
            height: 12
            clip: true
        }
    }

    //----------------------------------------------------------------------------------------------

    //States----------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------
}
