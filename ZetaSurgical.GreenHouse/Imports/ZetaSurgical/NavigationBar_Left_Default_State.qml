import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Decorative 1.0 as DecorativeSet
import ZetaSurgical 1.0 as ZetaSurgicalSet

//USES DecorativeSet.DecoratedItem
//USES ZetaSurgicalSet.BackButton_Default_State
//USES Row
//USES ZetaSurgicalSet.Button_Navigation_Upload
//USES ZetaSurgicalSet.Button_Navigation_Segmentation
//USES ZetaSurgicalSet.Button_Navigation_Planning
//USES ZetaSurgicalSet.Button_Navigation_Positioning
//USES ZetaSurgicalSet.Button_Navigation_Navigation
//USES ZetaSurgicalSet.HomeButton
//USES Image
//USES Item

//EDITABLE TRUE
Item {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    //BOOL false
    property alias fi_BackButton_doubleClickEnabeld: fi_BackButton.doubleClickEnabeld
    //BOOL true
    property alias fi_BackButton_enabled: fi_BackButton.enabled
    //REAL 1
    property alias fi_BackButton_icon_opacity: fi_BackButton.icon_opacity
    //ASSET /Icons/LeftArrow__DefaultState.png
    property alias fi_BackButton_icon_source: fi_BackButton.icon_source
    //INT 100
    property alias fi_BackButton_minimumRepeatInterval: fi_BackButton.minimumRepeatInterval
    //INT 1000
    property alias fi_BackButton_repeateInterval: fi_BackButton.repeateInterval
    //BOOL true
    property alias fi_BackButton_visible: fi_BackButton.visible
    //BOOL false
    property alias fi_Button_Navigation_Navigation_complete_flag: fi_Button_Navigation_Navigation.complete_flag
    //BOOL false
    property alias fi_Button_Navigation_Navigation_doubleClickEnabeld: fi_Button_Navigation_Navigation.doubleClickEnabeld
    //BOOL true
    property alias fi_Button_Navigation_Navigation_enabled: fi_Button_Navigation_Navigation.enabled
    //FONT Figma::Arial_ArialMT_16_50_0_0_0_0_0.2
    property alias fi_Button_Navigation_Navigation_fi_Navigation_font: fi_Button_Navigation_Navigation.fi_Navigation_font
    //TEXTHAL 4
    property alias fi_Button_Navigation_Navigation_fi_Navigation_horizontalAlignment: fi_Button_Navigation_Navigation.fi_Navigation_horizontalAlignment
    //REAL 20
    property alias fi_Button_Navigation_Navigation_fi_Navigation_lineHeight: fi_Button_Navigation_Navigation.fi_Navigation_lineHeight
    //TEXTLINEHM 1
    property alias fi_Button_Navigation_Navigation_fi_Navigation_lineHeightMode: fi_Button_Navigation_Navigation.fi_Navigation_lineHeightMode
    //REAL 1
    property alias fi_Button_Navigation_Navigation_fi_Navigation_opacity: fi_Button_Navigation_Navigation.fi_Navigation_opacity
    //BOOL false
    property alias fi_Button_Navigation_Navigation_fi_Navigation_richText: fi_Button_Navigation_Navigation.fi_Navigation_richText
    //TRANSLATABLE Navigation
    property alias fi_Button_Navigation_Navigation_fi_Navigation_text: fi_Button_Navigation_Navigation.fi_Navigation_text
    //COLOR Icon/White
    property alias fi_Button_Navigation_Navigation_fi_Navigation_textColor: fi_Button_Navigation_Navigation.fi_Navigation_textColor
    //TEXTVAL 32
    property alias fi_Button_Navigation_Navigation_fi_Navigation_verticalAlignment: fi_Button_Navigation_Navigation.fi_Navigation_verticalAlignment
    //ASSET /Icons/NavbarNavigation__DefaultState.png
    property alias fi_Button_Navigation_Navigation_icon___complete_source: fi_Button_Navigation_Navigation.icon___complete_source
    //ASSET /Icons/NavbarNavigation__DefaultState.png
    property alias fi_Button_Navigation_Navigation_icon___default_source: fi_Button_Navigation_Navigation.icon___default_source
    //ASSET /Icons/NavbarNavigation__SelectedState.png
    property alias fi_Button_Navigation_Navigation_icon___selected_source: fi_Button_Navigation_Navigation.icon___selected_source
    //REAL 1
    property alias fi_Button_Navigation_Navigation_icon_opacity: fi_Button_Navigation_Navigation.icon_opacity
    //INT 0
    property alias fi_Button_Navigation_Navigation_itemIndex: fi_Button_Navigation_Navigation.itemIndex
    //INT 100
    property alias fi_Button_Navigation_Navigation_minimumRepeatInterval: fi_Button_Navigation_Navigation.minimumRepeatInterval
    //INT 1000
    property alias fi_Button_Navigation_Navigation_repeateInterval: fi_Button_Navigation_Navigation.repeateInterval
    //INT -1
    property alias fi_Button_Navigation_Navigation_selectionIndex: fi_Button_Navigation_Navigation.selectionIndex
    //BOOL false
    property alias fi_Button_Navigation_Planning_complete_flag: fi_Button_Navigation_Planning.complete_flag
    //BOOL false
    property alias fi_Button_Navigation_Planning_doubleClickEnabeld: fi_Button_Navigation_Planning.doubleClickEnabeld
    //BOOL true
    property alias fi_Button_Navigation_Planning_enabled: fi_Button_Navigation_Planning.enabled
    //FONT Figma::Arial_ArialMT_16_50_0_0_0_0_0.2
    property alias fi_Button_Navigation_Planning_fi_Planning_font: fi_Button_Navigation_Planning.fi_Planning_font
    //TEXTHAL 4
    property alias fi_Button_Navigation_Planning_fi_Planning_horizontalAlignment: fi_Button_Navigation_Planning.fi_Planning_horizontalAlignment
    //REAL 20
    property alias fi_Button_Navigation_Planning_fi_Planning_lineHeight: fi_Button_Navigation_Planning.fi_Planning_lineHeight
    //TEXTLINEHM 1
    property alias fi_Button_Navigation_Planning_fi_Planning_lineHeightMode: fi_Button_Navigation_Planning.fi_Planning_lineHeightMode
    //REAL 1
    property alias fi_Button_Navigation_Planning_fi_Planning_opacity: fi_Button_Navigation_Planning.fi_Planning_opacity
    //BOOL false
    property alias fi_Button_Navigation_Planning_fi_Planning_richText: fi_Button_Navigation_Planning.fi_Planning_richText
    //TRANSLATABLE Planning
    property alias fi_Button_Navigation_Planning_fi_Planning_text: fi_Button_Navigation_Planning.fi_Planning_text
    //COLOR Icon/White
    property alias fi_Button_Navigation_Planning_fi_Planning_textColor: fi_Button_Navigation_Planning.fi_Planning_textColor
    //TEXTVAL 32
    property alias fi_Button_Navigation_Planning_fi_Planning_verticalAlignment: fi_Button_Navigation_Planning.fi_Planning_verticalAlignment
    //ASSET /Icons/NavbarPlanning__DefaultState.png
    property alias fi_Button_Navigation_Planning_icon___complete_source: fi_Button_Navigation_Planning.icon___complete_source
    //ASSET /Icons/NavbarPlanning__DefaultState.png
    property alias fi_Button_Navigation_Planning_icon___default_source: fi_Button_Navigation_Planning.icon___default_source
    //ASSET /Icons/NavbarPlanning__SelectedState.png
    property alias fi_Button_Navigation_Planning_icon___selected_source: fi_Button_Navigation_Planning.icon___selected_source
    //REAL 1
    property alias fi_Button_Navigation_Planning_icon_opacity: fi_Button_Navigation_Planning.icon_opacity
    //INT 0
    property alias fi_Button_Navigation_Planning_itemIndex: fi_Button_Navigation_Planning.itemIndex
    //INT 100
    property alias fi_Button_Navigation_Planning_minimumRepeatInterval: fi_Button_Navigation_Planning.minimumRepeatInterval
    //INT 1000
    property alias fi_Button_Navigation_Planning_repeateInterval: fi_Button_Navigation_Planning.repeateInterval
    //INT -1
    property alias fi_Button_Navigation_Planning_selectionIndex: fi_Button_Navigation_Planning.selectionIndex
    //BOOL false
    property alias fi_Button_Navigation_Positioning_complete_flag: fi_Button_Navigation_Positioning.complete_flag
    //BOOL false
    property alias fi_Button_Navigation_Positioning_doubleClickEnabeld: fi_Button_Navigation_Positioning.doubleClickEnabeld
    //BOOL true
    property alias fi_Button_Navigation_Positioning_enabled: fi_Button_Navigation_Positioning.enabled
    //FONT Figma::Arial_ArialMT_16_50_0_0_0_0_0.2
    property alias fi_Button_Navigation_Positioning_fi_Positioning_font: fi_Button_Navigation_Positioning.fi_Positioning_font
    //TEXTHAL 4
    property alias fi_Button_Navigation_Positioning_fi_Positioning_horizontalAlignment: fi_Button_Navigation_Positioning.fi_Positioning_horizontalAlignment
    //REAL 20
    property alias fi_Button_Navigation_Positioning_fi_Positioning_lineHeight: fi_Button_Navigation_Positioning.fi_Positioning_lineHeight
    //TEXTLINEHM 1
    property alias fi_Button_Navigation_Positioning_fi_Positioning_lineHeightMode: fi_Button_Navigation_Positioning.fi_Positioning_lineHeightMode
    //REAL 1
    property alias fi_Button_Navigation_Positioning_fi_Positioning_opacity: fi_Button_Navigation_Positioning.fi_Positioning_opacity
    //BOOL false
    property alias fi_Button_Navigation_Positioning_fi_Positioning_richText: fi_Button_Navigation_Positioning.fi_Positioning_richText
    //TRANSLATABLE Positioning
    property alias fi_Button_Navigation_Positioning_fi_Positioning_text: fi_Button_Navigation_Positioning.fi_Positioning_text
    //COLOR Icon/White
    property alias fi_Button_Navigation_Positioning_fi_Positioning_textColor: fi_Button_Navigation_Positioning.fi_Positioning_textColor
    //TEXTVAL 32
    property alias fi_Button_Navigation_Positioning_fi_Positioning_verticalAlignment: fi_Button_Navigation_Positioning.fi_Positioning_verticalAlignment
    //ASSET /Icons/NavbarPositioning__DefaultState.png
    property alias fi_Button_Navigation_Positioning_icon___complete_source: fi_Button_Navigation_Positioning.icon___complete_source
    //ASSET /Icons/NavbarPositioning__DefaultState.png
    property alias fi_Button_Navigation_Positioning_icon___default_source: fi_Button_Navigation_Positioning.icon___default_source
    //ASSET /Icons/NavbarPositioning__SelectedState.png
    property alias fi_Button_Navigation_Positioning_icon___selected_source: fi_Button_Navigation_Positioning.icon___selected_source
    //REAL 1
    property alias fi_Button_Navigation_Positioning_icon_opacity: fi_Button_Navigation_Positioning.icon_opacity
    //INT 0
    property alias fi_Button_Navigation_Positioning_itemIndex: fi_Button_Navigation_Positioning.itemIndex
    //INT 100
    property alias fi_Button_Navigation_Positioning_minimumRepeatInterval: fi_Button_Navigation_Positioning.minimumRepeatInterval
    //INT 1000
    property alias fi_Button_Navigation_Positioning_repeateInterval: fi_Button_Navigation_Positioning.repeateInterval
    //INT -1
    property alias fi_Button_Navigation_Positioning_selectionIndex: fi_Button_Navigation_Positioning.selectionIndex
    //BOOL false
    property alias fi_Button_Navigation_Segmentation_complete_flag: fi_Button_Navigation_Segmentation.complete_flag
    //BOOL false
    property alias fi_Button_Navigation_Segmentation_doubleClickEnabeld: fi_Button_Navigation_Segmentation.doubleClickEnabeld
    //BOOL true
    property alias fi_Button_Navigation_Segmentation_enabled: fi_Button_Navigation_Segmentation.enabled
    //FONT Figma::Arial_ArialMT_16_50_0_0_0_0_0.2
    property alias fi_Button_Navigation_Segmentation_fi_Segmentation_font: fi_Button_Navigation_Segmentation.fi_Segmentation_font
    //TEXTHAL 4
    property alias fi_Button_Navigation_Segmentation_fi_Segmentation_horizontalAlignment: fi_Button_Navigation_Segmentation.fi_Segmentation_horizontalAlignment
    //REAL 20
    property alias fi_Button_Navigation_Segmentation_fi_Segmentation_lineHeight: fi_Button_Navigation_Segmentation.fi_Segmentation_lineHeight
    //TEXTLINEHM 1
    property alias fi_Button_Navigation_Segmentation_fi_Segmentation_lineHeightMode: fi_Button_Navigation_Segmentation.fi_Segmentation_lineHeightMode
    //REAL 1
    property alias fi_Button_Navigation_Segmentation_fi_Segmentation_opacity: fi_Button_Navigation_Segmentation.fi_Segmentation_opacity
    //BOOL false
    property alias fi_Button_Navigation_Segmentation_fi_Segmentation_richText: fi_Button_Navigation_Segmentation.fi_Segmentation_richText
    //TRANSLATABLE Segmentation
    property alias fi_Button_Navigation_Segmentation_fi_Segmentation_text: fi_Button_Navigation_Segmentation.fi_Segmentation_text
    //COLOR Icon/White
    property alias fi_Button_Navigation_Segmentation_fi_Segmentation_textColor: fi_Button_Navigation_Segmentation.fi_Segmentation_textColor
    //TEXTVAL 32
    property alias fi_Button_Navigation_Segmentation_fi_Segmentation_verticalAlignment: fi_Button_Navigation_Segmentation.fi_Segmentation_verticalAlignment
    //ASSET /Icons/NavbarSegmentation__DefaultState.png
    property alias fi_Button_Navigation_Segmentation_icon___complete_source: fi_Button_Navigation_Segmentation.icon___complete_source
    //ASSET /Icons/NavbarSegmentation__DefaultState.png
    property alias fi_Button_Navigation_Segmentation_icon___default_source: fi_Button_Navigation_Segmentation.icon___default_source
    //ASSET /Icons/NavbarSegmentation__SelectedState.png
    property alias fi_Button_Navigation_Segmentation_icon___selected_source: fi_Button_Navigation_Segmentation.icon___selected_source
    //REAL 1
    property alias fi_Button_Navigation_Segmentation_icon_opacity: fi_Button_Navigation_Segmentation.icon_opacity
    //INT 0
    property alias fi_Button_Navigation_Segmentation_itemIndex: fi_Button_Navigation_Segmentation.itemIndex
    //INT 100
    property alias fi_Button_Navigation_Segmentation_minimumRepeatInterval: fi_Button_Navigation_Segmentation.minimumRepeatInterval
    //INT 1000
    property alias fi_Button_Navigation_Segmentation_repeateInterval: fi_Button_Navigation_Segmentation.repeateInterval
    //INT -1
    property alias fi_Button_Navigation_Segmentation_selectionIndex: fi_Button_Navigation_Segmentation.selectionIndex
    //BOOL false
    property alias fi_Button_Navigation_Upload_complete_flag: fi_Button_Navigation_Upload.complete_flag
    //BOOL false
    property alias fi_Button_Navigation_Upload_doubleClickEnabeld: fi_Button_Navigation_Upload.doubleClickEnabeld
    //BOOL true
    property alias fi_Button_Navigation_Upload_enabled: fi_Button_Navigation_Upload.enabled
    //FONT Figma::Arial_ArialMT_16_50_0_0_0_0_0.2
    property alias fi_Button_Navigation_Upload_fi_Upload_font: fi_Button_Navigation_Upload.fi_Upload_font
    //TEXTHAL 4
    property alias fi_Button_Navigation_Upload_fi_Upload_horizontalAlignment: fi_Button_Navigation_Upload.fi_Upload_horizontalAlignment
    //REAL 20
    property alias fi_Button_Navigation_Upload_fi_Upload_lineHeight: fi_Button_Navigation_Upload.fi_Upload_lineHeight
    //TEXTLINEHM 1
    property alias fi_Button_Navigation_Upload_fi_Upload_lineHeightMode: fi_Button_Navigation_Upload.fi_Upload_lineHeightMode
    //REAL 1
    property alias fi_Button_Navigation_Upload_fi_Upload_opacity: fi_Button_Navigation_Upload.fi_Upload_opacity
    //BOOL false
    property alias fi_Button_Navigation_Upload_fi_Upload_richText: fi_Button_Navigation_Upload.fi_Upload_richText
    //TRANSLATABLE Upload
    property alias fi_Button_Navigation_Upload_fi_Upload_text: fi_Button_Navigation_Upload.fi_Upload_text
    //COLOR Icon/White
    property alias fi_Button_Navigation_Upload_fi_Upload_textColor: fi_Button_Navigation_Upload.fi_Upload_textColor
    //TEXTVAL 32
    property alias fi_Button_Navigation_Upload_fi_Upload_verticalAlignment: fi_Button_Navigation_Upload.fi_Upload_verticalAlignment
    //ASSET /Icons/NavbarUpload__DefaultState.png
    property alias fi_Button_Navigation_Upload_icon___complete_source: fi_Button_Navigation_Upload.icon___complete_source
    //ASSET /Icons/NavbarUpload__DefaultState.png
    property alias fi_Button_Navigation_Upload_icon___default_source: fi_Button_Navigation_Upload.icon___default_source
    //ASSET /Icons/NavbarUpload__SelectedState.png
    property alias fi_Button_Navigation_Upload_icon___selected_source: fi_Button_Navigation_Upload.icon___selected_source
    //REAL 1
    property alias fi_Button_Navigation_Upload_icon_opacity: fi_Button_Navigation_Upload.icon_opacity
    //INT 0
    property alias fi_Button_Navigation_Upload_itemIndex: fi_Button_Navigation_Upload.itemIndex
    //INT 100
    property alias fi_Button_Navigation_Upload_minimumRepeatInterval: fi_Button_Navigation_Upload.minimumRepeatInterval
    //INT 1000
    property alias fi_Button_Navigation_Upload_repeateInterval: fi_Button_Navigation_Upload.repeateInterval
    //INT -1
    property alias fi_Button_Navigation_Upload_selectionIndex: fi_Button_Navigation_Upload.selectionIndex
    //BOOL false
    property alias fi_HomeButton_doubleClickEnabeld: fi_HomeButton.doubleClickEnabeld
    //BOOL true
    property alias fi_HomeButton_enabled: fi_HomeButton.enabled
    //ASSET /Icons/ZetaLogoSmall__DefaultState.png
    property alias fi_HomeButton_icon___default_source: fi_HomeButton.icon___default_source
    //ASSET /Icons/ZetaLogoSmall__SelectedState.png
    property alias fi_HomeButton_icon___selected_source: fi_HomeButton.icon___selected_source
    //REAL 1
    property alias fi_HomeButton_icon_opacity: fi_HomeButton.icon_opacity
    //INT 0
    property alias fi_HomeButton_itemIndex: fi_HomeButton.itemIndex
    //INT 100
    property alias fi_HomeButton_minimumRepeatInterval: fi_HomeButton.minimumRepeatInterval
    //INT 1000
    property alias fi_HomeButton_repeateInterval: fi_HomeButton.repeateInterval
    //INT -1
    property alias fi_HomeButton_selectionIndex: fi_HomeButton.selectionIndex
    //REAL 1
    property alias fi_Line_11_opacity: fi_Line_11.opacity
    //ASSET /164_3606.png
    property alias fi_Line_11_source: fi_Line_11.source
    //INT 0
    property alias fi_Row_spacing: fi_Row.spacing

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------
    signal fi_BackButton_clicked() /*fi_BackButton.clicked*/
    signal fi_BackButton_doubleClicked() /*fi_BackButton.doubleClicked*/
    signal fi_BackButton_pressed() /*fi_BackButton.pressed*/
    signal fi_BackButton_released() /*fi_BackButton.released*/
    signal fi_BackButton_repeatingTriggered() /*fi_BackButton.repeatingTriggered*/
    signal fi_Button_Navigation_Navigation_clicked() /*fi_Button_Navigation_Navigation.clicked*/
    signal fi_Button_Navigation_Navigation_doubleClicked() /*fi_Button_Navigation_Navigation.doubleClicked*/
    signal fi_Button_Navigation_Navigation_pressed() /*fi_Button_Navigation_Navigation.pressed*/
    signal fi_Button_Navigation_Navigation_released() /*fi_Button_Navigation_Navigation.released*/
    signal fi_Button_Navigation_Navigation_repeatingTriggered() /*fi_Button_Navigation_Navigation.repeatingTriggered*/
    signal fi_Button_Navigation_Planning_clicked() /*fi_Button_Navigation_Planning.clicked*/
    signal fi_Button_Navigation_Planning_doubleClicked() /*fi_Button_Navigation_Planning.doubleClicked*/
    signal fi_Button_Navigation_Planning_pressed() /*fi_Button_Navigation_Planning.pressed*/
    signal fi_Button_Navigation_Planning_released() /*fi_Button_Navigation_Planning.released*/
    signal fi_Button_Navigation_Planning_repeatingTriggered() /*fi_Button_Navigation_Planning.repeatingTriggered*/
    signal fi_Button_Navigation_Positioning_clicked() /*fi_Button_Navigation_Positioning.clicked*/
    signal fi_Button_Navigation_Positioning_doubleClicked() /*fi_Button_Navigation_Positioning.doubleClicked*/
    signal fi_Button_Navigation_Positioning_pressed() /*fi_Button_Navigation_Positioning.pressed*/
    signal fi_Button_Navigation_Positioning_released() /*fi_Button_Navigation_Positioning.released*/
    signal fi_Button_Navigation_Positioning_repeatingTriggered() /*fi_Button_Navigation_Positioning.repeatingTriggered*/
    signal fi_Button_Navigation_Segmentation_clicked() /*fi_Button_Navigation_Segmentation.clicked*/
    signal fi_Button_Navigation_Segmentation_doubleClicked() /*fi_Button_Navigation_Segmentation.doubleClicked*/
    signal fi_Button_Navigation_Segmentation_pressed() /*fi_Button_Navigation_Segmentation.pressed*/
    signal fi_Button_Navigation_Segmentation_released() /*fi_Button_Navigation_Segmentation.released*/
    signal fi_Button_Navigation_Segmentation_repeatingTriggered() /*fi_Button_Navigation_Segmentation.repeatingTriggered*/
    signal fi_Button_Navigation_Upload_clicked() /*fi_Button_Navigation_Upload.clicked*/
    signal fi_Button_Navigation_Upload_doubleClicked() /*fi_Button_Navigation_Upload.doubleClicked*/
    signal fi_Button_Navigation_Upload_pressed() /*fi_Button_Navigation_Upload.pressed*/
    signal fi_Button_Navigation_Upload_released() /*fi_Button_Navigation_Upload.released*/
    signal fi_Button_Navigation_Upload_repeatingTriggered() /*fi_Button_Navigation_Upload.repeatingTriggered*/
    signal fi_HomeButton_clicked() /*fi_HomeButton.clicked*/
    signal fi_HomeButton_doubleClicked() /*fi_HomeButton.doubleClicked*/
    signal fi_HomeButton_pressed() /*fi_HomeButton.pressed*/
    signal fi_HomeButton_released() /*fi_HomeButton.released*/
    signal fi_HomeButton_repeatingTriggered() /*fi_HomeButton.repeatingTriggered*/

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 128
    height: 1080

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    DecorativeSet.DecoratedItem {
        id: fi_Rectangle_84
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 1080
        source: GreenHouseThemeManager.theme.asset("/7_697.png")
        horizontalCenterOffset: 10
        verticalCenterOffset: 10
    }
    Row {
        id: fi_Row
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 20
        z: 1
        width: 88
        height: 88

        ZetaSurgicalSet.BackButton_Default_State {
            id: fi_BackButton
            anchors.top: parent.top

            onClicked: {
                root.fi_BackButton_clicked();
            }
            onDoubleClicked: {
                root.fi_BackButton_doubleClicked();
            }
            onPressed: {
                root.fi_BackButton_pressed();
            }
            onReleased: {
                root.fi_BackButton_released();
            }
            onRepeatingTriggered: {
                root.fi_BackButton_repeatingTriggered();
            }
        }
    }
    ZetaSurgicalSet.Button_Navigation_Upload {
        id: fi_Button_Navigation_Upload
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 128
        z: 2
        icon___complete_source: GreenHouseThemeManager.theme.asset("/Icons/NavbarUpload__DefaultState.png")

        onClicked: {
            root.fi_Button_Navigation_Upload_clicked();
        }
        onDoubleClicked: {
            root.fi_Button_Navigation_Upload_doubleClicked();
        }
        onPressed: {
            root.fi_Button_Navigation_Upload_pressed();
        }
        onReleased: {
            root.fi_Button_Navigation_Upload_released();
        }
        onRepeatingTriggered: {
            root.fi_Button_Navigation_Upload_repeatingTriggered();
        }
    }
    ZetaSurgicalSet.Button_Navigation_Segmentation {
        id: fi_Button_Navigation_Segmentation
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 264
        z: 3
        icon___complete_source: GreenHouseThemeManager.theme.asset("/Icons/NavbarSegmentation__DefaultState.png")

        onClicked: {
            root.fi_Button_Navigation_Segmentation_clicked();
        }
        onDoubleClicked: {
            root.fi_Button_Navigation_Segmentation_doubleClicked();
        }
        onPressed: {
            root.fi_Button_Navigation_Segmentation_pressed();
        }
        onReleased: {
            root.fi_Button_Navigation_Segmentation_released();
        }
        onRepeatingTriggered: {
            root.fi_Button_Navigation_Segmentation_repeatingTriggered();
        }
    }
    ZetaSurgicalSet.Button_Navigation_Planning {
        id: fi_Button_Navigation_Planning
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 400
        z: 4
        icon___complete_source: GreenHouseThemeManager.theme.asset("/Icons/NavbarPlanning__DefaultState.png")

        onClicked: {
            root.fi_Button_Navigation_Planning_clicked();
        }
        onDoubleClicked: {
            root.fi_Button_Navigation_Planning_doubleClicked();
        }
        onPressed: {
            root.fi_Button_Navigation_Planning_pressed();
        }
        onReleased: {
            root.fi_Button_Navigation_Planning_released();
        }
        onRepeatingTriggered: {
            root.fi_Button_Navigation_Planning_repeatingTriggered();
        }
    }
    ZetaSurgicalSet.Button_Navigation_Positioning {
        id: fi_Button_Navigation_Positioning
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 536
        z: 5
        icon___complete_source: GreenHouseThemeManager.theme.asset("/Icons/NavbarPositioning__DefaultState.png")

        onClicked: {
            root.fi_Button_Navigation_Positioning_clicked();
        }
        onDoubleClicked: {
            root.fi_Button_Navigation_Positioning_doubleClicked();
        }
        onPressed: {
            root.fi_Button_Navigation_Positioning_pressed();
        }
        onReleased: {
            root.fi_Button_Navigation_Positioning_released();
        }
        onRepeatingTriggered: {
            root.fi_Button_Navigation_Positioning_repeatingTriggered();
        }
    }
    ZetaSurgicalSet.Button_Navigation_Navigation {
        id: fi_Button_Navigation_Navigation
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 672
        z: 6
        icon___complete_source: GreenHouseThemeManager.theme.asset("/Icons/NavbarNavigation__DefaultState.png")

        onClicked: {
            root.fi_Button_Navigation_Navigation_clicked();
        }
        onDoubleClicked: {
            root.fi_Button_Navigation_Navigation_doubleClicked();
        }
        onPressed: {
            root.fi_Button_Navigation_Navigation_pressed();
        }
        onReleased: {
            root.fi_Button_Navigation_Navigation_released();
        }
        onRepeatingTriggered: {
            root.fi_Button_Navigation_Navigation_repeatingTriggered();
        }
    }
    ZetaSurgicalSet.HomeButton {
        id: fi_HomeButton
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 952
        z: 7

        onClicked: {
            root.fi_HomeButton_clicked();
        }
        onDoubleClicked: {
            root.fi_HomeButton_doubleClicked();
        }
        onPressed: {
            root.fi_HomeButton_pressed();
        }
        onReleased: {
            root.fi_HomeButton_released();
        }
        onRepeatingTriggered: {
            root.fi_HomeButton_repeatingTriggered();
        }
    }
    Item {
        id: fi_Frame_17
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 936
        z: 8
        width: 128
        height: 16

        Image {
            id: fi_Line_11
            anchors.left: parent.left
            anchors.leftMargin: 17
            anchors.right: parent.right
            anchors.rightMargin: 16
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -1
            height: 0
            source: GreenHouseThemeManager.theme.asset("/164_3606.png")
        }
    }

    //----------------------------------------------------------------------------------------------

    //States----------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------
}
