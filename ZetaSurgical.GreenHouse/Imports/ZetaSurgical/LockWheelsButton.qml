import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet
import ZetaSurgical 1.0 as ZetaSurgicalSet

//USES Item
//USES ComponentsSet.AutoRepeatMouseArea
//USES BorderImage
//USES ComponentsSet.Label
//USES ZetaSurgicalSet.ToggleButton_Left_Selection
//USES ZetaSurgicalSet.ToggleButton_Right_Selection
//PREVIEW IMAGE qrc:/GeneratedComponents/assets/Button.png

//EDITABLE TRUE
Item {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    property bool doubleClickEnabeld: false
    property int itemIndex: 0
    property int minimumRepeatInterval: 100
    property int repeateInterval: 1000
    property int selectionIndex: -1
    //FONT Figma::Arial_ArialMT_22_50_0_0_0_0_0.2
    property alias fi_Lock_Wheels_font: fi_Lock_Wheels___default.font
    //TEXTHAL 4
    property alias fi_Lock_Wheels_horizontalAlignment: fi_Lock_Wheels___default.horizontalAlignment
    //REAL 30
    property alias fi_Lock_Wheels_lineHeight: fi_Lock_Wheels___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_Lock_Wheels_lineHeightMode: fi_Lock_Wheels___default.lineHeightMode
    //REAL 1
    property alias fi_Lock_Wheels_opacity: fi_Lock_Wheels___default.opacity
    //BOOL false
    property alias fi_Lock_Wheels_richText: fi_Lock_Wheels___default.richText
    //TRANSLATABLE Lock Wheels
    property alias fi_Lock_Wheels_text: fi_Lock_Wheels___default.text
    //COLOR Dark Ink
    property alias fi_Lock_Wheels_textColor: fi_Lock_Wheels___default.textColor
    //TEXTVAL 128
    property alias fi_Lock_Wheels_verticalAlignment: fi_Lock_Wheels___default.verticalAlignment
    //BOOL false
    property alias fi_ToggleButton_Left_Selection___default_doubleClickEnabeld: fi_ToggleButton_Left_Selection___default.doubleClickEnabeld
    //BOOL true
    property alias fi_ToggleButton_Left_Selection___default_enabled: fi_ToggleButton_Left_Selection___default.enabled
    //REAL 1
    property alias fi_ToggleButton_Left_Selection___default_fi_Ellipse_227_opacity: fi_ToggleButton_Left_Selection___default.fi_Ellipse_227_opacity
    //ASSET /174_1853.png
    property alias fi_ToggleButton_Left_Selection___default_fi_Ellipse_227_source: fi_ToggleButton_Left_Selection___default.fi_Ellipse_227_source
    //INT 100
    property alias fi_ToggleButton_Left_Selection___default_minimumRepeatInterval: fi_ToggleButton_Left_Selection___default.minimumRepeatInterval
    //INT 1000
    property alias fi_ToggleButton_Left_Selection___default_repeateInterval: fi_ToggleButton_Left_Selection___default.repeateInterval
    //BOOL false
    property alias fi_ToggleButton_Right_Selection___selected_doubleClickEnabeld: fi_ToggleButton_Right_Selection___selected.doubleClickEnabeld
    //BOOL true
    property alias fi_ToggleButton_Right_Selection___selected_enabled: fi_ToggleButton_Right_Selection___selected.enabled
    //REAL 1
    property alias fi_ToggleButton_Right_Selection___selected_fi_Ellipse_227_opacity: fi_ToggleButton_Right_Selection___selected.fi_Ellipse_227_opacity
    //ASSET /174_1850.png
    property alias fi_ToggleButton_Right_Selection___selected_fi_Ellipse_227_source: fi_ToggleButton_Right_Selection___selected.fi_Ellipse_227_source
    //INT 100
    property alias fi_ToggleButton_Right_Selection___selected_minimumRepeatInterval: fi_ToggleButton_Right_Selection___selected.minimumRepeatInterval
    //INT 1000
    property alias fi_ToggleButton_Right_Selection___selected_repeateInterval: fi_ToggleButton_Right_Selection___selected.repeateInterval

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------
    signal clicked() /*__mouseArea.clicked*/
    signal doubleClicked() /*__mouseArea.doubleClicked*/
    signal pressed() /*__mouseArea.pressed*/
    signal released() /*__mouseArea.released*/
    signal repeatingTriggered() /*__mouseArea.repeatingTriggered*/
    signal fi_ToggleButton_Left_Selection_clicked() /*fi_ToggleButton_Left_Selection___default.clicked*/
    signal fi_ToggleButton_Left_Selection_doubleClicked() /*fi_ToggleButton_Left_Selection___default.doubleClicked*/
    signal fi_ToggleButton_Left_Selection_pressed() /*fi_ToggleButton_Left_Selection___default.pressed*/
    signal fi_ToggleButton_Left_Selection_released() /*fi_ToggleButton_Left_Selection___default.released*/
    signal fi_ToggleButton_Left_Selection_repeatingTriggered() /*fi_ToggleButton_Left_Selection___default.repeatingTriggered*/
    signal fi_ToggleButton_Right_Selection___selected_clicked() /*fi_ToggleButton_Right_Selection___selected.clicked*/
    signal fi_ToggleButton_Right_Selection___selected_doubleClicked() /*fi_ToggleButton_Right_Selection___selected.doubleClicked*/
    signal fi_ToggleButton_Right_Selection___selected_pressed() /*fi_ToggleButton_Right_Selection___selected.pressed*/
    signal fi_ToggleButton_Right_Selection___selected_released() /*fi_ToggleButton_Right_Selection___selected.released*/
    signal fi_ToggleButton_Right_Selection___selected_repeatingTriggered() /*fi_ToggleButton_Right_Selection___selected.repeatingTriggered*/

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 296
    height: 88

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
        id: selected_StateParent
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
        id: fi_Rectangle_356___default
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: GreenHouseThemeManager.theme.asset("/174_1884.png")
        border.bottom: 15
        border.left: 15
        border.right: 15
        border.top: 15
    }
    ComponentsSet.Label {
        id: fi_Lock_Wheels___default
        anchors.left: parent.left
        anchors.leftMargin: -1
        anchors.top: parent.top
        anchors.topMargin: -1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -1
        z: 2
        width: 186
        text: qsTr("Lock Wheels", "FigmaNode::174:1860") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::174:1860") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_22_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Dark Ink")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 30
        lineHeightMode: Text.FixedHeight
    }
    ZetaSurgicalSet.ToggleButton_Left_Selection {
        id: fi_ToggleButton_Left_Selection___default
        anchors.right: parent.right
        anchors.rightMargin: 16
        anchors.verticalCenter: parent.verticalCenter
        z: 1
        visible: default_StateParent.visible
        rotation: -90

        onClicked: {
            root.fi_ToggleButton_Left_Selection_clicked();
        }
        onDoubleClicked: {
            root.fi_ToggleButton_Left_Selection_doubleClicked();
        }
        onPressed: {
            root.fi_ToggleButton_Left_Selection_pressed();
        }
        onReleased: {
            root.fi_ToggleButton_Left_Selection_released();
        }
        onRepeatingTriggered: {
            root.fi_ToggleButton_Left_Selection_repeatingTriggered();
        }
    }
    ZetaSurgicalSet.ToggleButton_Right_Selection {
        id: fi_ToggleButton_Right_Selection___selected
        anchors.right: parent.right
        anchors.rightMargin: 16
        anchors.verticalCenter: parent.verticalCenter
        z: 1
        visible: selected_StateParent.visible
        fi_Ellipse_227_source: GreenHouseThemeManager.theme.asset("/174_1850.png")
        rotation: -90

        onClicked: {
            root.fi_ToggleButton_Right_Selection___selected_clicked();
        }
        onDoubleClicked: {
            root.fi_ToggleButton_Right_Selection___selected_doubleClicked();
        }
        onPressed: {
            root.fi_ToggleButton_Right_Selection___selected_pressed();
        }
        onReleased: {
            root.fi_ToggleButton_Right_Selection___selected_released();
        }
        onRepeatingTriggered: {
            root.fi_ToggleButton_Right_Selection___selected_repeatingTriggered();
        }
    }

    //----------------------------------------------------------------------------------------------

    //States----------------------------------------------------------------------------------------
    StateGroup { //
        states: [
        State {
            when: !(root.selectionIndex == root.itemIndex)
            name: "default"
            PropertyChanges {
                target: default_StateParent
                visible: true
            }
            PropertyChanges {
                target: fi_Rectangle_356___default
                source: GreenHouseThemeManager.theme.asset("/174_1884.png")
            }
            PropertyChanges {
                target: selected_StateParent
                visible: false
            }
        },
        State {
            when: (root.selectionIndex == root.itemIndex)
            name: "selected"
            PropertyChanges {
                target: default_StateParent
                visible: false
            }
            PropertyChanges {
                target: fi_Rectangle_356___default
                source: GreenHouseThemeManager.theme.asset("/174_1896.png")
            }
            PropertyChanges {
                target: selected_StateParent
                visible: true
            }
        }
        ]
    }

    //----------------------------------------------------------------------------------------------
}
