import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import ZetaSurgical 1.0 as ZetaSurgicalSet
import Components 1.0 as ComponentsSet

//USES BorderImage
//USES ZetaSurgicalSet.SliderButton
//USES Item
//USES ComponentsSet.AutoRepeatMouseArea
//PREVIEW IMAGE qrc:/GeneratedComponents/assets/Button.png

//EDITABLE TRUE
Item {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    property bool doubleClickEnabeld: false
    property bool first_flag: false
    property int minimumRepeatInterval: 100
    property int repeateInterval: 1000
    property bool third_flag: false
    //BOOL false
    property alias fi_SliderButton_doubleClickEnabeld: fi_SliderButton___default.doubleClickEnabeld
    //BOOL true
    property alias fi_SliderButton_enabled: fi_SliderButton___default.enabled
    //FONT Figma::Arial_ArialMT_24_50_0_0_0_0_0.2
    property alias fi_SliderButton_fi_Text_font: fi_SliderButton___default.fi_Text_font
    //TEXTHAL 4
    property alias fi_SliderButton_fi_Text_horizontalAlignment: fi_SliderButton___default.fi_Text_horizontalAlignment
    //REAL 20
    property alias fi_SliderButton_fi_Text_lineHeight: fi_SliderButton___default.fi_Text_lineHeight
    //TEXTLINEHM 1
    property alias fi_SliderButton_fi_Text_lineHeightMode: fi_SliderButton___default.fi_Text_lineHeightMode
    //REAL 1
    property alias fi_SliderButton_fi_Text_opacity: fi_SliderButton___default.fi_Text_opacity
    //BOOL false
    property alias fi_SliderButton_fi_Text_richText: fi_SliderButton___default.fi_Text_richText
    //COLOR Text/White
    property alias fi_SliderButton_fi_Text_textColor: fi_SliderButton___default.fi_Text_textColor
    //TEXTVAL 128
    property alias fi_SliderButton_fi_Text_verticalAlignment: fi_SliderButton___default.fi_Text_verticalAlignment
    //INT 100
    property alias fi_SliderButton_minimumRepeatInterval: fi_SliderButton___default.minimumRepeatInterval
    //INT 1000
    property alias fi_SliderButton_repeateInterval: fi_SliderButton___default.repeateInterval

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------
    signal clicked() /*__mouseArea.clicked*/
    signal doubleClicked() /*__mouseArea.doubleClicked*/
    signal pressed() /*__mouseArea.pressed*/
    signal released() /*__mouseArea.released*/
    signal repeatingTriggered() /*__mouseArea.repeatingTriggered*/
    signal fi_SliderButton_clicked() /*fi_SliderButton___default.clicked*/
    signal fi_SliderButton_doubleClicked() /*fi_SliderButton___default.doubleClicked*/
    signal fi_SliderButton_pressed() /*fi_SliderButton___default.pressed*/
    signal fi_SliderButton_released() /*fi_SliderButton___default.released*/
    signal fi_SliderButton_repeatingTriggered() /*fi_SliderButton___default.repeatingTriggered*/
    signal fi_SliderButton___first_clicked() /*fi_SliderButton___first.clicked*/
    signal fi_SliderButton___first_doubleClicked() /*fi_SliderButton___first.doubleClicked*/
    signal fi_SliderButton___first_pressed() /*fi_SliderButton___first.pressed*/
    signal fi_SliderButton___first_released() /*fi_SliderButton___first.released*/
    signal fi_SliderButton___first_repeatingTriggered() /*fi_SliderButton___first.repeatingTriggered*/
    signal fi_SliderButton___third_clicked() /*fi_SliderButton___third.clicked*/
    signal fi_SliderButton___third_doubleClicked() /*fi_SliderButton___third.doubleClicked*/
    signal fi_SliderButton___third_pressed() /*fi_SliderButton___third.pressed*/
    signal fi_SliderButton___third_released() /*fi_SliderButton___third.released*/
    signal fi_SliderButton___third_repeatingTriggered() /*fi_SliderButton___third.repeatingTriggered*/

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 408
    height: 80

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    Item {
        id: default_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        BorderImage {
            id: fi_Button_1___default
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: GreenHouseThemeManager.theme.asset("/35_2020.png")
            border.bottom: 39
            border.left: 39
            border.right: 39
            border.top: 39
        }
        ZetaSurgicalSet.SliderButton {
            id: fi_SliderButton___default
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            z: 3
            fi_Text_text: qsTr("Axial", "FigmaNode::I174:2921;174:2866") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::I174:2921;174:2866") : "")

            onClicked: {
                root.fi_SliderButton_clicked();
            }
            onDoubleClicked: {
                root.fi_SliderButton_doubleClicked();
            }
            onPressed: {
                root.fi_SliderButton_pressed();
            }
            onReleased: {
                root.fi_SliderButton_released();
            }
            onRepeatingTriggered: {
                root.fi_SliderButton_repeatingTriggered();
            }
        }
    }
    Item {
        id: first_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        visible: false

        BorderImage {
            id: fi_Button_1___first
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: GreenHouseThemeManager.theme.asset("/174_2983.png")
            border.bottom: 39
            border.left: 39
            border.right: 39
            border.top: 39
        }
        ZetaSurgicalSet.SliderButton {
            id: fi_SliderButton___first
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            z: 3
            enabled: fi_SliderButton___default.enabled
            doubleClickEnabeld: fi_SliderButton___default.doubleClickEnabeld
            fi_Text_font: fi_SliderButton___default.fi_Text_font
            fi_Text_horizontalAlignment: fi_SliderButton___default.fi_Text_horizontalAlignment
            fi_Text_lineHeight: fi_SliderButton___default.fi_Text_lineHeight
            fi_Text_lineHeightMode: fi_SliderButton___default.fi_Text_lineHeightMode
            fi_Text_opacity: fi_SliderButton___default.fi_Text_opacity
            fi_Text_richText: fi_SliderButton___default.fi_Text_richText
            fi_Text_text: qsTr("Coronal", "FigmaNode::I174:2985;174:2866") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::I174:2985;174:2866") : "")
            fi_Text_textColor: fi_SliderButton___default.fi_Text_textColor
            fi_Text_verticalAlignment: fi_SliderButton___default.fi_Text_verticalAlignment
            minimumRepeatInterval: fi_SliderButton___default.minimumRepeatInterval
            repeateInterval: fi_SliderButton___default.repeateInterval

            onClicked: {
                root.fi_SliderButton___first_clicked();
            }
            onDoubleClicked: {
                root.fi_SliderButton___first_doubleClicked();
            }
            onPressed: {
                root.fi_SliderButton___first_pressed();
            }
            onReleased: {
                root.fi_SliderButton___first_released();
            }
            onRepeatingTriggered: {
                root.fi_SliderButton___first_repeatingTriggered();
            }
        }
    }
    Item {
        id: third_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        visible: false

        BorderImage {
            id: fi_Button_1___third
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: GreenHouseThemeManager.theme.asset("/174_3026.png")
            border.bottom: 39
            border.left: 39
            border.right: 39
            border.top: 39
        }
        ZetaSurgicalSet.SliderButton {
            id: fi_SliderButton___third
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            z: 3
            enabled: fi_SliderButton___default.enabled
            doubleClickEnabeld: fi_SliderButton___default.doubleClickEnabeld
            fi_Text_font: fi_SliderButton___default.fi_Text_font
            fi_Text_horizontalAlignment: fi_SliderButton___default.fi_Text_horizontalAlignment
            fi_Text_lineHeight: fi_SliderButton___default.fi_Text_lineHeight
            fi_Text_lineHeightMode: fi_SliderButton___default.fi_Text_lineHeightMode
            fi_Text_opacity: fi_SliderButton___default.fi_Text_opacity
            fi_Text_richText: fi_SliderButton___default.fi_Text_richText
            fi_Text_text: qsTr("Saggital", "FigmaNode::I174:3027;174:2866") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::I174:3027;174:2866") : "")
            fi_Text_textColor: fi_SliderButton___default.fi_Text_textColor
            fi_Text_verticalAlignment: fi_SliderButton___default.fi_Text_verticalAlignment
            minimumRepeatInterval: fi_SliderButton___default.minimumRepeatInterval
            repeateInterval: fi_SliderButton___default.repeateInterval

            onClicked: {
                root.fi_SliderButton___third_clicked();
            }
            onDoubleClicked: {
                root.fi_SliderButton___third_doubleClicked();
            }
            onPressed: {
                root.fi_SliderButton___third_pressed();
            }
            onReleased: {
                root.fi_SliderButton___third_released();
            }
            onRepeatingTriggered: {
                root.fi_SliderButton___third_repeatingTriggered();
            }
        }
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

    //----------------------------------------------------------------------------------------------

    //States----------------------------------------------------------------------------------------
    StateGroup { // generic_first
        states: [
        State {
            when: root.first_flag
            name: "first"
            PropertyChanges {
                target: first_StateParent
                visible: true
                z: 999
            }
        }
        ]
    }
    StateGroup { // generic_third
        states: [
        State {
            when: root.third_flag
            name: "third"
            PropertyChanges {
                target: third_StateParent
                visible: true
                z: 999
            }
        }
        ]
    }

    //----------------------------------------------------------------------------------------------
}
