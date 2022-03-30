import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import ZetaSurgical 1.0 as ZetaSurgicalSet

//USES Rectangle
//USES ZetaSurgicalSet.TripleSelectSliderButton
//USES ZetaSurgicalSet.PointDisplayLabel
//USES Item
//PREVIEW IMAGE qrc:/GeneratedComponents/assets/Panel.png

//EDITABLE TRUE
Item {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    property bool coronal_flag: false
    property bool saggital_flag: false
    //FONT Figma::Arial_BoldMT_28_75_0_0_0_0_0
    property alias fi_PointDisplayLabel_fi_CoordinateDisplayLabel_fi_01_font: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_font
    //TEXTHAL 4
    property alias fi_PointDisplayLabel_fi_CoordinateDisplayLabel_fi_01_horizontalAlignment: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_horizontalAlignment
    //COLOR Text/White
    property alias fi_PointDisplayLabel_fi_CoordinateDisplayLabel_fi_01_labelColor: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_labelColor
    //REAL 16
    property alias fi_PointDisplayLabel_fi_CoordinateDisplayLabel_fi_01_lineHeight: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_lineHeight
    //TEXTLINEHM 1
    property alias fi_PointDisplayLabel_fi_CoordinateDisplayLabel_fi_01_lineHeightMode: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_lineHeightMode
    //REAL 1
    property alias fi_PointDisplayLabel_fi_CoordinateDisplayLabel_fi_01_opacity: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_opacity
    //BOOL false
    property alias fi_PointDisplayLabel_fi_CoordinateDisplayLabel_fi_01_richText: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_richText
    //TRANSLATABLE 0.1
    property alias fi_PointDisplayLabel_fi_CoordinateDisplayLabel_fi_01_text: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_text
    //TEXTVAL 128
    property alias fi_PointDisplayLabel_fi_CoordinateDisplayLabel_fi_01_verticalAlignment: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_verticalAlignment
    //REAL 1
    property alias fi_PointDisplayLabel_fi_Ellipse_232_opacity: fi_PointDisplayLabel___coronal.fi_Ellipse_232_opacity
    //ASSET /174_2720.png
    property alias fi_PointDisplayLabel_fi_Ellipse_232_source: fi_PointDisplayLabel___coronal.fi_Ellipse_232_source
    //FONT Figma::Arial_ArialMT_18_50_0_0_0_0_0.2
    property alias fi_PointDisplayLabel_fi_LeftRightLabel_font: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_font
    //TEXTHAL 4
    property alias fi_PointDisplayLabel_fi_LeftRightLabel_horizontalAlignment: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_horizontalAlignment
    //COLOR Dark Ink
    property alias fi_PointDisplayLabel_fi_LeftRightLabel_labelColor: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_labelColor
    //REAL 20
    property alias fi_PointDisplayLabel_fi_LeftRightLabel_lineHeight: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_lineHeight
    //TEXTLINEHM 1
    property alias fi_PointDisplayLabel_fi_LeftRightLabel_lineHeightMode: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_lineHeightMode
    //REAL 1
    property alias fi_PointDisplayLabel_fi_LeftRightLabel_opacity: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_opacity
    //BOOL false
    property alias fi_PointDisplayLabel_fi_LeftRightLabel_richText: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_richText
    //TEXTVAL 128
    property alias fi_PointDisplayLabel_fi_LeftRightLabel_verticalAlignment: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_verticalAlignment
    //FONT Figma::Arial_ArialMT_18_50_0_0_0_0_0.2
    property alias fi_PointDisplayLabel_fi_UpDownLabel_font: fi_PointDisplayLabel___coronal.fi_UpDownLabel_font
    //TEXTHAL 4
    property alias fi_PointDisplayLabel_fi_UpDownLabel_horizontalAlignment: fi_PointDisplayLabel___coronal.fi_UpDownLabel_horizontalAlignment
    //COLOR Dark Ink
    property alias fi_PointDisplayLabel_fi_UpDownLabel_labelColor: fi_PointDisplayLabel___coronal.fi_UpDownLabel_labelColor
    //REAL 20
    property alias fi_PointDisplayLabel_fi_UpDownLabel_lineHeight: fi_PointDisplayLabel___coronal.fi_UpDownLabel_lineHeight
    //TEXTLINEHM 1
    property alias fi_PointDisplayLabel_fi_UpDownLabel_lineHeightMode: fi_PointDisplayLabel___coronal.fi_UpDownLabel_lineHeightMode
    //REAL 1
    property alias fi_PointDisplayLabel_fi_UpDownLabel_opacity: fi_PointDisplayLabel___coronal.fi_UpDownLabel_opacity
    //BOOL false
    property alias fi_PointDisplayLabel_fi_UpDownLabel_richText: fi_PointDisplayLabel___coronal.fi_UpDownLabel_richText
    //TEXTVAL 128
    property alias fi_PointDisplayLabel_fi_UpDownLabel_verticalAlignment: fi_PointDisplayLabel___coronal.fi_UpDownLabel_verticalAlignment
    //COLOR Figma::0_0_0_0
    property alias fi_Rectangle_107_color: fi_Rectangle_107___coronal.color
    //REAL 1
    property alias fi_Rectangle_107_opacity: fi_Rectangle_107___coronal.opacity
    //BOOL false
    property alias fi_pointAdjustmentAxisSelection_doubleClickEnabeld: fi_pointAdjustmentAxisSelection___coronal.doubleClickEnabeld
    //BOOL true
    property alias fi_pointAdjustmentAxisSelection_enabled: fi_pointAdjustmentAxisSelection___coronal.enabled
    //BOOL false
    property alias fi_pointAdjustmentAxisSelection_fi_SliderButton_doubleClickEnabeld: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_doubleClickEnabeld
    //BOOL true
    property alias fi_pointAdjustmentAxisSelection_fi_SliderButton_enabled: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_enabled
    //FONT Figma::Arial_ArialMT_24_50_0_0_0_0_0.2
    property alias fi_pointAdjustmentAxisSelection_fi_SliderButton_fi_Text_font: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_font
    //TEXTHAL 4
    property alias fi_pointAdjustmentAxisSelection_fi_SliderButton_fi_Text_horizontalAlignment: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_horizontalAlignment
    //REAL 20
    property alias fi_pointAdjustmentAxisSelection_fi_SliderButton_fi_Text_lineHeight: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_lineHeight
    //TEXTLINEHM 1
    property alias fi_pointAdjustmentAxisSelection_fi_SliderButton_fi_Text_lineHeightMode: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_lineHeightMode
    //REAL 1
    property alias fi_pointAdjustmentAxisSelection_fi_SliderButton_fi_Text_opacity: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_opacity
    //BOOL false
    property alias fi_pointAdjustmentAxisSelection_fi_SliderButton_fi_Text_richText: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_richText
    //COLOR Text/White
    property alias fi_pointAdjustmentAxisSelection_fi_SliderButton_fi_Text_textColor: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_textColor
    //TEXTVAL 128
    property alias fi_pointAdjustmentAxisSelection_fi_SliderButton_fi_Text_verticalAlignment: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_verticalAlignment
    //INT 100
    property alias fi_pointAdjustmentAxisSelection_fi_SliderButton_minimumRepeatInterval: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_minimumRepeatInterval
    //INT 1000
    property alias fi_pointAdjustmentAxisSelection_fi_SliderButton_repeateInterval: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_repeateInterval
    //BOOL false
    property alias fi_pointAdjustmentAxisSelection_first_flag: fi_pointAdjustmentAxisSelection___coronal.first_flag
    //INT 100
    property alias fi_pointAdjustmentAxisSelection_minimumRepeatInterval: fi_pointAdjustmentAxisSelection___coronal.minimumRepeatInterval
    //INT 1000
    property alias fi_pointAdjustmentAxisSelection_repeateInterval: fi_pointAdjustmentAxisSelection___coronal.repeateInterval
    //BOOL false
    property alias fi_pointAdjustmentAxisSelection_third_flag: fi_pointAdjustmentAxisSelection___coronal.third_flag

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------
    signal fi_pointAdjustmentAxisSelection___coronal_clicked() /*fi_pointAdjustmentAxisSelection___coronal.clicked*/
    signal fi_pointAdjustmentAxisSelection___coronal_doubleClicked() /*fi_pointAdjustmentAxisSelection___coronal.doubleClicked*/
    signal fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton___first_clicked() /*fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton___first_clicked*/
    signal fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton___first_doubleClicked() /*fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton___first_doubleClicked*/
    signal fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton___first_pressed() /*fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton___first_pressed*/
    signal fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton___first_released() /*fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton___first_released*/
    signal fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton___first_repeatingTriggered() /*fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton___first_repeatingTriggered*/
    signal fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton___third_clicked() /*fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton___third_clicked*/
    signal fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton___third_doubleClicked() /*fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton___third_doubleClicked*/
    signal fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton___third_pressed() /*fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton___third_pressed*/
    signal fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton___third_released() /*fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton___third_released*/
    signal fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton___third_repeatingTriggered() /*fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton___third_repeatingTriggered*/
    signal fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton_clicked() /*fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_clicked*/
    signal fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton_doubleClicked() /*fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_doubleClicked*/
    signal fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton_pressed() /*fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_pressed*/
    signal fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton_released() /*fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_released*/
    signal fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton_repeatingTriggered() /*fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_repeatingTriggered*/
    signal fi_pointAdjustmentAxisSelection___coronal_pressed() /*fi_pointAdjustmentAxisSelection___coronal.pressed*/
    signal fi_pointAdjustmentAxisSelection___coronal_released() /*fi_pointAdjustmentAxisSelection___coronal.released*/
    signal fi_pointAdjustmentAxisSelection___coronal_repeatingTriggered() /*fi_pointAdjustmentAxisSelection___coronal.repeatingTriggered*/
    signal fi_pointAdjustmentAxisSelection_clicked() /*fi_pointAdjustmentAxisSelection___default.clicked*/
    signal fi_pointAdjustmentAxisSelection_doubleClicked() /*fi_pointAdjustmentAxisSelection___default.doubleClicked*/
    signal fi_pointAdjustmentAxisSelection_fi_SliderButton___first_clicked() /*fi_pointAdjustmentAxisSelection___default.fi_SliderButton___first_clicked*/
    signal fi_pointAdjustmentAxisSelection_fi_SliderButton___first_doubleClicked() /*fi_pointAdjustmentAxisSelection___default.fi_SliderButton___first_doubleClicked*/
    signal fi_pointAdjustmentAxisSelection_fi_SliderButton___first_pressed() /*fi_pointAdjustmentAxisSelection___default.fi_SliderButton___first_pressed*/
    signal fi_pointAdjustmentAxisSelection_fi_SliderButton___first_released() /*fi_pointAdjustmentAxisSelection___default.fi_SliderButton___first_released*/
    signal fi_pointAdjustmentAxisSelection_fi_SliderButton___first_repeatingTriggered() /*fi_pointAdjustmentAxisSelection___default.fi_SliderButton___first_repeatingTriggered*/
    signal fi_pointAdjustmentAxisSelection_fi_SliderButton___third_clicked() /*fi_pointAdjustmentAxisSelection___default.fi_SliderButton___third_clicked*/
    signal fi_pointAdjustmentAxisSelection_fi_SliderButton___third_doubleClicked() /*fi_pointAdjustmentAxisSelection___default.fi_SliderButton___third_doubleClicked*/
    signal fi_pointAdjustmentAxisSelection_fi_SliderButton___third_pressed() /*fi_pointAdjustmentAxisSelection___default.fi_SliderButton___third_pressed*/
    signal fi_pointAdjustmentAxisSelection_fi_SliderButton___third_released() /*fi_pointAdjustmentAxisSelection___default.fi_SliderButton___third_released*/
    signal fi_pointAdjustmentAxisSelection_fi_SliderButton___third_repeatingTriggered() /*fi_pointAdjustmentAxisSelection___default.fi_SliderButton___third_repeatingTriggered*/
    signal fi_pointAdjustmentAxisSelection_fi_SliderButton_clicked() /*fi_pointAdjustmentAxisSelection___default.fi_SliderButton_clicked*/
    signal fi_pointAdjustmentAxisSelection_fi_SliderButton_doubleClicked() /*fi_pointAdjustmentAxisSelection___default.fi_SliderButton_doubleClicked*/
    signal fi_pointAdjustmentAxisSelection_fi_SliderButton_pressed() /*fi_pointAdjustmentAxisSelection___default.fi_SliderButton_pressed*/
    signal fi_pointAdjustmentAxisSelection_fi_SliderButton_released() /*fi_pointAdjustmentAxisSelection___default.fi_SliderButton_released*/
    signal fi_pointAdjustmentAxisSelection_fi_SliderButton_repeatingTriggered() /*fi_pointAdjustmentAxisSelection___default.fi_SliderButton_repeatingTriggered*/
    signal fi_pointAdjustmentAxisSelection_pressed() /*fi_pointAdjustmentAxisSelection___default.pressed*/
    signal fi_pointAdjustmentAxisSelection_released() /*fi_pointAdjustmentAxisSelection___default.released*/
    signal fi_pointAdjustmentAxisSelection_repeatingTriggered() /*fi_pointAdjustmentAxisSelection___default.repeatingTriggered*/
    signal fi_pointAdjustmentAxisSelection___saggital_clicked() /*fi_pointAdjustmentAxisSelection___saggital.clicked*/
    signal fi_pointAdjustmentAxisSelection___saggital_doubleClicked() /*fi_pointAdjustmentAxisSelection___saggital.doubleClicked*/
    signal fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton___first_clicked() /*fi_pointAdjustmentAxisSelection___saggital.fi_SliderButton___first_clicked*/
    signal fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton___first_doubleClicked() /*fi_pointAdjustmentAxisSelection___saggital.fi_SliderButton___first_doubleClicked*/
    signal fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton___first_pressed() /*fi_pointAdjustmentAxisSelection___saggital.fi_SliderButton___first_pressed*/
    signal fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton___first_released() /*fi_pointAdjustmentAxisSelection___saggital.fi_SliderButton___first_released*/
    signal fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton___first_repeatingTriggered() /*fi_pointAdjustmentAxisSelection___saggital.fi_SliderButton___first_repeatingTriggered*/
    signal fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton___third_clicked() /*fi_pointAdjustmentAxisSelection___saggital.fi_SliderButton___third_clicked*/
    signal fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton___third_doubleClicked() /*fi_pointAdjustmentAxisSelection___saggital.fi_SliderButton___third_doubleClicked*/
    signal fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton___third_pressed() /*fi_pointAdjustmentAxisSelection___saggital.fi_SliderButton___third_pressed*/
    signal fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton___third_released() /*fi_pointAdjustmentAxisSelection___saggital.fi_SliderButton___third_released*/
    signal fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton___third_repeatingTriggered() /*fi_pointAdjustmentAxisSelection___saggital.fi_SliderButton___third_repeatingTriggered*/
    signal fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton_clicked() /*fi_pointAdjustmentAxisSelection___saggital.fi_SliderButton_clicked*/
    signal fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton_doubleClicked() /*fi_pointAdjustmentAxisSelection___saggital.fi_SliderButton_doubleClicked*/
    signal fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton_pressed() /*fi_pointAdjustmentAxisSelection___saggital.fi_SliderButton_pressed*/
    signal fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton_released() /*fi_pointAdjustmentAxisSelection___saggital.fi_SliderButton_released*/
    signal fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton_repeatingTriggered() /*fi_pointAdjustmentAxisSelection___saggital.fi_SliderButton_repeatingTriggered*/
    signal fi_pointAdjustmentAxisSelection___saggital_pressed() /*fi_pointAdjustmentAxisSelection___saggital.pressed*/
    signal fi_pointAdjustmentAxisSelection___saggital_released() /*fi_pointAdjustmentAxisSelection___saggital.released*/
    signal fi_pointAdjustmentAxisSelection___saggital_repeatingTriggered() /*fi_pointAdjustmentAxisSelection___saggital.repeatingTriggered*/

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 456
    height: 484

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    Item {
        id: coronal_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        visible: false

        Rectangle {
            id: fi_Rectangle_107___coronal
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            color: GreenHouseThemeManager.theme.color("Figma::0_0_0_0")
            border.color: GreenHouseThemeManager.theme.color("Figma::0_0_0_0")
            border.width: 1
        }
        ZetaSurgicalSet.TripleSelectSliderButton {
            id: fi_pointAdjustmentAxisSelection___coronal
            anchors.top: parent.top
            anchors.topMargin: 32
            anchors.horizontalCenter: parent.horizontalCenter
            z: 1
            width: 392

            onClicked: {
                root.fi_pointAdjustmentAxisSelection___coronal_clicked();
            }
            onDoubleClicked: {
                root.fi_pointAdjustmentAxisSelection___coronal_doubleClicked();
            }
            onFi_SliderButton___first_clicked: {
                root.fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton___first_clicked();
            }
            onFi_SliderButton___first_doubleClicked: {
                root.fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton___first_doubleClicked();
            }
            onFi_SliderButton___first_pressed: {
                root.fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton___first_pressed();
            }
            onFi_SliderButton___first_released: {
                root.fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton___first_released();
            }
            onFi_SliderButton___first_repeatingTriggered: {
                root.fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton___first_repeatingTriggered();
            }
            onFi_SliderButton___third_clicked: {
                root.fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton___third_clicked();
            }
            onFi_SliderButton___third_doubleClicked: {
                root.fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton___third_doubleClicked();
            }
            onFi_SliderButton___third_pressed: {
                root.fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton___third_pressed();
            }
            onFi_SliderButton___third_released: {
                root.fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton___third_released();
            }
            onFi_SliderButton___third_repeatingTriggered: {
                root.fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton___third_repeatingTriggered();
            }
            onFi_SliderButton_clicked: {
                root.fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton_clicked();
            }
            onFi_SliderButton_doubleClicked: {
                root.fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton_doubleClicked();
            }
            onFi_SliderButton_pressed: {
                root.fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton_pressed();
            }
            onFi_SliderButton_released: {
                root.fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton_released();
            }
            onFi_SliderButton_repeatingTriggered: {
                root.fi_pointAdjustmentAxisSelection___coronal_fi_SliderButton_repeatingTriggered();
            }
            onPressed: {
                root.fi_pointAdjustmentAxisSelection___coronal_pressed();
            }
            onReleased: {
                root.fi_pointAdjustmentAxisSelection___coronal_released();
            }
            onRepeatingTriggered: {
                root.fi_pointAdjustmentAxisSelection___coronal_repeatingTriggered();
            }
        }
        ZetaSurgicalSet.PointDisplayLabel {
            id: fi_PointDisplayLabel___coronal
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 72
            anchors.horizontalCenter: parent.horizontalCenter
            z: 6
            fi_UpDownLabel_text: qsTr("D-V", "FigmaNode::I174:3240;174:2728") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::I174:3240;174:2728") : "")
        }
    }
    Item {
        id: default_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Rectangle {
            id: fi_Rectangle_107___default
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            color: fi_Rectangle_107___coronal.color
            opacity: fi_Rectangle_107___coronal.opacity
            border.color: GreenHouseThemeManager.theme.color("Figma::0_0_0_0")
            border.width: 1
        }
        ZetaSurgicalSet.PointDisplayLabel {
            id: fi_PointDisplayLabel___default
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 72
            anchors.horizontalCenter: parent.horizontalCenter
            z: 5
            fi_CoordinateDisplayLabel_fi_01_font: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_font
            fi_CoordinateDisplayLabel_fi_01_horizontalAlignment: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_horizontalAlignment
            fi_CoordinateDisplayLabel_fi_01_labelColor: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_labelColor
            fi_CoordinateDisplayLabel_fi_01_lineHeight: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_lineHeight
            fi_CoordinateDisplayLabel_fi_01_lineHeightMode: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_lineHeightMode
            fi_CoordinateDisplayLabel_fi_01_opacity: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_opacity
            fi_CoordinateDisplayLabel_fi_01_richText: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_richText
            fi_CoordinateDisplayLabel_fi_01_text: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_text
            fi_CoordinateDisplayLabel_fi_01_verticalAlignment: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_verticalAlignment
            fi_Ellipse_232_opacity: fi_PointDisplayLabel___coronal.fi_Ellipse_232_opacity
            fi_Ellipse_232_source: fi_PointDisplayLabel___coronal.fi_Ellipse_232_source
            fi_LeftRightLabel_font: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_font
            fi_LeftRightLabel_horizontalAlignment: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_horizontalAlignment
            fi_LeftRightLabel_labelColor: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_labelColor
            fi_LeftRightLabel_lineHeight: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_lineHeight
            fi_LeftRightLabel_lineHeightMode: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_lineHeightMode
            fi_LeftRightLabel_opacity: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_opacity
            fi_LeftRightLabel_richText: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_richText
            fi_LeftRightLabel_verticalAlignment: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_verticalAlignment
            fi_UpDownLabel_font: fi_PointDisplayLabel___coronal.fi_UpDownLabel_font
            fi_UpDownLabel_horizontalAlignment: fi_PointDisplayLabel___coronal.fi_UpDownLabel_horizontalAlignment
            fi_UpDownLabel_labelColor: fi_PointDisplayLabel___coronal.fi_UpDownLabel_labelColor
            fi_UpDownLabel_lineHeight: fi_PointDisplayLabel___coronal.fi_UpDownLabel_lineHeight
            fi_UpDownLabel_lineHeightMode: fi_PointDisplayLabel___coronal.fi_UpDownLabel_lineHeightMode
            fi_UpDownLabel_opacity: fi_PointDisplayLabel___coronal.fi_UpDownLabel_opacity
            fi_UpDownLabel_richText: fi_PointDisplayLabel___coronal.fi_UpDownLabel_richText
            fi_UpDownLabel_verticalAlignment: fi_PointDisplayLabel___coronal.fi_UpDownLabel_verticalAlignment
        }
        ZetaSurgicalSet.TripleSelectSliderButton {
            id: fi_pointAdjustmentAxisSelection___default
            anchors.top: parent.top
            anchors.topMargin: 32
            anchors.horizontalCenter: parent.horizontalCenter
            z: 6
            width: 392
            enabled: fi_pointAdjustmentAxisSelection___coronal.enabled
            doubleClickEnabeld: fi_pointAdjustmentAxisSelection___coronal.doubleClickEnabeld
            fi_SliderButton_doubleClickEnabeld: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_doubleClickEnabeld
            fi_SliderButton_enabled: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_enabled
            fi_SliderButton_fi_Text_font: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_font
            fi_SliderButton_fi_Text_horizontalAlignment: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_horizontalAlignment
            fi_SliderButton_fi_Text_lineHeight: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_lineHeight
            fi_SliderButton_fi_Text_lineHeightMode: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_lineHeightMode
            fi_SliderButton_fi_Text_opacity: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_opacity
            fi_SliderButton_fi_Text_richText: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_richText
            fi_SliderButton_fi_Text_textColor: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_textColor
            fi_SliderButton_fi_Text_verticalAlignment: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_verticalAlignment
            fi_SliderButton_minimumRepeatInterval: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_minimumRepeatInterval
            fi_SliderButton_repeateInterval: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_repeateInterval
            first_flag: fi_pointAdjustmentAxisSelection___coronal.first_flag
            minimumRepeatInterval: fi_pointAdjustmentAxisSelection___coronal.minimumRepeatInterval
            repeateInterval: fi_pointAdjustmentAxisSelection___coronal.repeateInterval
            third_flag: fi_pointAdjustmentAxisSelection___coronal.third_flag

            onClicked: {
                root.fi_pointAdjustmentAxisSelection_clicked();
            }
            onDoubleClicked: {
                root.fi_pointAdjustmentAxisSelection_doubleClicked();
            }
            onFi_SliderButton___first_clicked: {
                root.fi_pointAdjustmentAxisSelection_fi_SliderButton___first_clicked();
            }
            onFi_SliderButton___first_doubleClicked: {
                root.fi_pointAdjustmentAxisSelection_fi_SliderButton___first_doubleClicked();
            }
            onFi_SliderButton___first_pressed: {
                root.fi_pointAdjustmentAxisSelection_fi_SliderButton___first_pressed();
            }
            onFi_SliderButton___first_released: {
                root.fi_pointAdjustmentAxisSelection_fi_SliderButton___first_released();
            }
            onFi_SliderButton___first_repeatingTriggered: {
                root.fi_pointAdjustmentAxisSelection_fi_SliderButton___first_repeatingTriggered();
            }
            onFi_SliderButton___third_clicked: {
                root.fi_pointAdjustmentAxisSelection_fi_SliderButton___third_clicked();
            }
            onFi_SliderButton___third_doubleClicked: {
                root.fi_pointAdjustmentAxisSelection_fi_SliderButton___third_doubleClicked();
            }
            onFi_SliderButton___third_pressed: {
                root.fi_pointAdjustmentAxisSelection_fi_SliderButton___third_pressed();
            }
            onFi_SliderButton___third_released: {
                root.fi_pointAdjustmentAxisSelection_fi_SliderButton___third_released();
            }
            onFi_SliderButton___third_repeatingTriggered: {
                root.fi_pointAdjustmentAxisSelection_fi_SliderButton___third_repeatingTriggered();
            }
            onFi_SliderButton_clicked: {
                root.fi_pointAdjustmentAxisSelection_fi_SliderButton_clicked();
            }
            onFi_SliderButton_doubleClicked: {
                root.fi_pointAdjustmentAxisSelection_fi_SliderButton_doubleClicked();
            }
            onFi_SliderButton_pressed: {
                root.fi_pointAdjustmentAxisSelection_fi_SliderButton_pressed();
            }
            onFi_SliderButton_released: {
                root.fi_pointAdjustmentAxisSelection_fi_SliderButton_released();
            }
            onFi_SliderButton_repeatingTriggered: {
                root.fi_pointAdjustmentAxisSelection_fi_SliderButton_repeatingTriggered();
            }
            onPressed: {
                root.fi_pointAdjustmentAxisSelection_pressed();
            }
            onReleased: {
                root.fi_pointAdjustmentAxisSelection_released();
            }
            onRepeatingTriggered: {
                root.fi_pointAdjustmentAxisSelection_repeatingTriggered();
            }
        }
    }
    Item {
        id: saggital_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        visible: false

        Rectangle {
            id: fi_Rectangle_107___saggital
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            color: fi_Rectangle_107___coronal.color
            opacity: fi_Rectangle_107___coronal.opacity
            border.color: GreenHouseThemeManager.theme.color("Figma::0_0_0_0")
            border.width: 1
        }
        ZetaSurgicalSet.PointDisplayLabel {
            id: fi_PointDisplayLabel___saggital
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 72
            anchors.horizontalCenter: parent.horizontalCenter
            z: 5
            fi_CoordinateDisplayLabel_fi_01_font: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_font
            fi_CoordinateDisplayLabel_fi_01_horizontalAlignment: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_horizontalAlignment
            fi_CoordinateDisplayLabel_fi_01_labelColor: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_labelColor
            fi_CoordinateDisplayLabel_fi_01_lineHeight: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_lineHeight
            fi_CoordinateDisplayLabel_fi_01_lineHeightMode: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_lineHeightMode
            fi_CoordinateDisplayLabel_fi_01_opacity: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_opacity
            fi_CoordinateDisplayLabel_fi_01_richText: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_richText
            fi_CoordinateDisplayLabel_fi_01_text: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_text
            fi_CoordinateDisplayLabel_fi_01_verticalAlignment: fi_PointDisplayLabel___coronal.fi_CoordinateDisplayLabel_fi_01_verticalAlignment
            fi_Ellipse_232_opacity: fi_PointDisplayLabel___coronal.fi_Ellipse_232_opacity
            fi_Ellipse_232_source: fi_PointDisplayLabel___coronal.fi_Ellipse_232_source
            fi_LeftRightLabel_font: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_font
            fi_LeftRightLabel_horizontalAlignment: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_horizontalAlignment
            fi_LeftRightLabel_labelColor: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_labelColor
            fi_LeftRightLabel_lineHeight: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_lineHeight
            fi_LeftRightLabel_lineHeightMode: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_lineHeightMode
            fi_LeftRightLabel_opacity: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_opacity
            fi_LeftRightLabel_richText: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_richText
            fi_LeftRightLabel_text: qsTr("A-P", "FigmaNode::I174:3345;174:2727") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::I174:3345;174:2727") : "")
            fi_LeftRightLabel_verticalAlignment: fi_PointDisplayLabel___coronal.fi_LeftRightLabel_verticalAlignment
            fi_UpDownLabel_font: fi_PointDisplayLabel___coronal.fi_UpDownLabel_font
            fi_UpDownLabel_horizontalAlignment: fi_PointDisplayLabel___coronal.fi_UpDownLabel_horizontalAlignment
            fi_UpDownLabel_labelColor: fi_PointDisplayLabel___coronal.fi_UpDownLabel_labelColor
            fi_UpDownLabel_lineHeight: fi_PointDisplayLabel___coronal.fi_UpDownLabel_lineHeight
            fi_UpDownLabel_lineHeightMode: fi_PointDisplayLabel___coronal.fi_UpDownLabel_lineHeightMode
            fi_UpDownLabel_opacity: fi_PointDisplayLabel___coronal.fi_UpDownLabel_opacity
            fi_UpDownLabel_richText: fi_PointDisplayLabel___coronal.fi_UpDownLabel_richText
            fi_UpDownLabel_text: qsTr("D-V", "FigmaNode::I174:3345;174:2728") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::I174:3345;174:2728") : "")
            fi_UpDownLabel_verticalAlignment: fi_PointDisplayLabel___coronal.fi_UpDownLabel_verticalAlignment
        }
        ZetaSurgicalSet.TripleSelectSliderButton {
            id: fi_pointAdjustmentAxisSelection___saggital
            anchors.top: parent.top
            anchors.topMargin: 32
            anchors.horizontalCenter: parent.horizontalCenter
            z: 6
            width: 392
            enabled: fi_pointAdjustmentAxisSelection___coronal.enabled
            doubleClickEnabeld: fi_pointAdjustmentAxisSelection___coronal.doubleClickEnabeld
            fi_SliderButton_doubleClickEnabeld: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_doubleClickEnabeld
            fi_SliderButton_enabled: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_enabled
            fi_SliderButton_fi_Text_font: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_font
            fi_SliderButton_fi_Text_horizontalAlignment: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_horizontalAlignment
            fi_SliderButton_fi_Text_lineHeight: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_lineHeight
            fi_SliderButton_fi_Text_lineHeightMode: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_lineHeightMode
            fi_SliderButton_fi_Text_opacity: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_opacity
            fi_SliderButton_fi_Text_richText: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_richText
            fi_SliderButton_fi_Text_textColor: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_textColor
            fi_SliderButton_fi_Text_verticalAlignment: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_fi_Text_verticalAlignment
            fi_SliderButton_minimumRepeatInterval: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_minimumRepeatInterval
            fi_SliderButton_repeateInterval: fi_pointAdjustmentAxisSelection___coronal.fi_SliderButton_repeateInterval
            first_flag: fi_pointAdjustmentAxisSelection___coronal.first_flag
            minimumRepeatInterval: fi_pointAdjustmentAxisSelection___coronal.minimumRepeatInterval
            repeateInterval: fi_pointAdjustmentAxisSelection___coronal.repeateInterval
            third_flag: fi_pointAdjustmentAxisSelection___coronal.third_flag

            onClicked: {
                root.fi_pointAdjustmentAxisSelection___saggital_clicked();
            }
            onDoubleClicked: {
                root.fi_pointAdjustmentAxisSelection___saggital_doubleClicked();
            }
            onFi_SliderButton___first_clicked: {
                root.fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton___first_clicked();
            }
            onFi_SliderButton___first_doubleClicked: {
                root.fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton___first_doubleClicked();
            }
            onFi_SliderButton___first_pressed: {
                root.fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton___first_pressed();
            }
            onFi_SliderButton___first_released: {
                root.fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton___first_released();
            }
            onFi_SliderButton___first_repeatingTriggered: {
                root.fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton___first_repeatingTriggered();
            }
            onFi_SliderButton___third_clicked: {
                root.fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton___third_clicked();
            }
            onFi_SliderButton___third_doubleClicked: {
                root.fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton___third_doubleClicked();
            }
            onFi_SliderButton___third_pressed: {
                root.fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton___third_pressed();
            }
            onFi_SliderButton___third_released: {
                root.fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton___third_released();
            }
            onFi_SliderButton___third_repeatingTriggered: {
                root.fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton___third_repeatingTriggered();
            }
            onFi_SliderButton_clicked: {
                root.fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton_clicked();
            }
            onFi_SliderButton_doubleClicked: {
                root.fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton_doubleClicked();
            }
            onFi_SliderButton_pressed: {
                root.fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton_pressed();
            }
            onFi_SliderButton_released: {
                root.fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton_released();
            }
            onFi_SliderButton_repeatingTriggered: {
                root.fi_pointAdjustmentAxisSelection___saggital_fi_SliderButton_repeatingTriggered();
            }
            onPressed: {
                root.fi_pointAdjustmentAxisSelection___saggital_pressed();
            }
            onReleased: {
                root.fi_pointAdjustmentAxisSelection___saggital_released();
            }
            onRepeatingTriggered: {
                root.fi_pointAdjustmentAxisSelection___saggital_repeatingTriggered();
            }
        }
    }

    //----------------------------------------------------------------------------------------------

    //States----------------------------------------------------------------------------------------
    StateGroup { // generic_coronal
        states: [
        State {
            when: root.coronal_flag
            name: "coronal"
            PropertyChanges {
                target: coronal_StateParent
                visible: true
                z: 999
            }
        }
        ]
    }
    StateGroup { // generic_saggital
        states: [
        State {
            when: root.saggital_flag
            name: "saggital"
            PropertyChanges {
                target: saggital_StateParent
                visible: true
                z: 999
            }
        }
        ]
    }

    //----------------------------------------------------------------------------------------------
}
