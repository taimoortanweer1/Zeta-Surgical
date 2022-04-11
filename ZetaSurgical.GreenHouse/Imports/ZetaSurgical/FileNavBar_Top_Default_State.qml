import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import ZetaSurgical 1.0 as ZetaSurgicalSet

//USES ZetaSurgicalSet.SelectButton

//EDITABLE TRUE
Item {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    //BOOL false
    property alias fi_cdUsb_activated_flag: fi_cdUsb.activated_flag
    //BOOL false
    property alias fi_cdUsb_doubleClickEnabeld: fi_cdUsb.doubleClickEnabeld
    //BOOL true
    property alias fi_cdUsb_enabled: fi_cdUsb.enabled
    //FONT Figma::Arial_ArialMT_24_50_0_0_0_0_0.2
    property alias fi_cdUsb_fi_EXAMPLE_font: fi_cdUsb.fi_EXAMPLE_font
    //TEXTHAL 4
    property alias fi_cdUsb_fi_EXAMPLE_horizontalAlignment: fi_cdUsb.fi_EXAMPLE_horizontalAlignment
    //REAL 20
    property alias fi_cdUsb_fi_EXAMPLE_lineHeight: fi_cdUsb.fi_EXAMPLE_lineHeight
    //TEXTLINEHM 1
    property alias fi_cdUsb_fi_EXAMPLE_lineHeightMode: fi_cdUsb.fi_EXAMPLE_lineHeightMode
    //REAL 1
    property alias fi_cdUsb_fi_EXAMPLE_opacity: fi_cdUsb.fi_EXAMPLE_opacity
    //BOOL false
    property alias fi_cdUsb_fi_EXAMPLE_richText: fi_cdUsb.fi_EXAMPLE_richText
    //TRANSLATABLE CD / USB
    property alias fi_cdUsb_fi_EXAMPLE_text: fi_cdUsb.fi_EXAMPLE_text
    //TEXTVAL 128
    property alias fi_cdUsb_fi_EXAMPLE_verticalAlignment: fi_cdUsb.fi_EXAMPLE_verticalAlignment
    //INT 100
    property alias fi_cdUsb_minimumRepeatInterval: fi_cdUsb.minimumRepeatInterval
    //INT 1000
    property alias fi_cdUsb_repeateInterval: fi_cdUsb.repeateInterval
    //BOOL false
    property alias fi_local_activated_flag: fi_local.activated_flag
    //BOOL false
    property alias fi_local_doubleClickEnabeld: fi_local.doubleClickEnabeld
    //BOOL true
    property alias fi_local_enabled: fi_local.enabled
    //FONT Figma::Arial_ArialMT_24_50_0_0_0_0_0.2
    property alias fi_local_fi_EXAMPLE_font: fi_local.fi_EXAMPLE_font
    //TEXTHAL 4
    property alias fi_local_fi_EXAMPLE_horizontalAlignment: fi_local.fi_EXAMPLE_horizontalAlignment
    //REAL 20
    property alias fi_local_fi_EXAMPLE_lineHeight: fi_local.fi_EXAMPLE_lineHeight
    //TEXTLINEHM 1
    property alias fi_local_fi_EXAMPLE_lineHeightMode: fi_local.fi_EXAMPLE_lineHeightMode
    //REAL 1
    property alias fi_local_fi_EXAMPLE_opacity: fi_local.fi_EXAMPLE_opacity
    //BOOL false
    property alias fi_local_fi_EXAMPLE_richText: fi_local.fi_EXAMPLE_richText
    //TRANSLATABLE LOCAL
    property alias fi_local_fi_EXAMPLE_text: fi_local.fi_EXAMPLE_text
    //TEXTVAL 128
    property alias fi_local_fi_EXAMPLE_verticalAlignment: fi_local.fi_EXAMPLE_verticalAlignment
    //INT 100
    property alias fi_local_minimumRepeatInterval: fi_local.minimumRepeatInterval
    //INT 1000
    property alias fi_local_repeateInterval: fi_local.repeateInterval
    //BOOL false
    property alias fi_pacs_activated_flag: fi_pacs.activated_flag
    //BOOL false
    property alias fi_pacs_doubleClickEnabeld: fi_pacs.doubleClickEnabeld
    //BOOL true
    property alias fi_pacs_enabled: fi_pacs.enabled
    //FONT Figma::Arial_ArialMT_24_50_0_0_0_0_0.2
    property alias fi_pacs_fi_EXAMPLE_font: fi_pacs.fi_EXAMPLE_font
    //TEXTHAL 4
    property alias fi_pacs_fi_EXAMPLE_horizontalAlignment: fi_pacs.fi_EXAMPLE_horizontalAlignment
    //REAL 20
    property alias fi_pacs_fi_EXAMPLE_lineHeight: fi_pacs.fi_EXAMPLE_lineHeight
    //TEXTLINEHM 1
    property alias fi_pacs_fi_EXAMPLE_lineHeightMode: fi_pacs.fi_EXAMPLE_lineHeightMode
    //REAL 1
    property alias fi_pacs_fi_EXAMPLE_opacity: fi_pacs.fi_EXAMPLE_opacity
    //BOOL false
    property alias fi_pacs_fi_EXAMPLE_richText: fi_pacs.fi_EXAMPLE_richText
    //TRANSLATABLE PACS
    property alias fi_pacs_fi_EXAMPLE_text: fi_pacs.fi_EXAMPLE_text
    //TEXTVAL 128
    property alias fi_pacs_fi_EXAMPLE_verticalAlignment: fi_pacs.fi_EXAMPLE_verticalAlignment
    //INT 100
    property alias fi_pacs_minimumRepeatInterval: fi_pacs.minimumRepeatInterval
    //INT 1000
    property alias fi_pacs_repeateInterval: fi_pacs.repeateInterval

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------
    signal fi_cdUsb_clicked() /*fi_cdUsb.clicked*/
    signal fi_cdUsb_doubleClicked() /*fi_cdUsb.doubleClicked*/
    signal fi_cdUsb_pressed() /*fi_cdUsb.pressed*/
    signal fi_cdUsb_released() /*fi_cdUsb.released*/
    signal fi_cdUsb_repeatingTriggered() /*fi_cdUsb.repeatingTriggered*/
    signal fi_local_clicked() /*fi_local.clicked*/
    signal fi_local_doubleClicked() /*fi_local.doubleClicked*/
    signal fi_local_pressed() /*fi_local.pressed*/
    signal fi_local_released() /*fi_local.released*/
    signal fi_local_repeatingTriggered() /*fi_local.repeatingTriggered*/
    signal fi_pacs_clicked() /*fi_pacs.clicked*/
    signal fi_pacs_doubleClicked() /*fi_pacs.doubleClicked*/
    signal fi_pacs_pressed() /*fi_pacs.pressed*/
    signal fi_pacs_released() /*fi_pacs.released*/
    signal fi_pacs_repeatingTriggered() /*fi_pacs.repeatingTriggered*/

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 1792
    height: 144

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    ZetaSurgicalSet.SelectButton {
        id: fi_pacs
        anchors.left: parent.left
        anchors.leftMargin: 1224
        anchors.right: parent.right
        anchors.rightMargin: 96
        anchors.verticalCenter: parent.verticalCenter
        fi_EXAMPLE_text: qsTr("PACS", "FigmaNode::I174:1651;11:1303") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::I174:1651;11:1303") : "")

        onClicked: {
            root.fi_pacs_clicked();
        }
        onDoubleClicked: {
            root.fi_pacs_doubleClicked();
        }
        onPressed: {
            root.fi_pacs_pressed();
        }
        onReleased: {
            root.fi_pacs_released();
        }
        onRepeatingTriggered: {
            root.fi_pacs_repeatingTriggered();
        }
    }
    ZetaSurgicalSet.SelectButton {
        id: fi_cdUsb
        anchors.left: parent.left
        anchors.leftMargin: 660
        anchors.right: parent.right
        anchors.rightMargin: 660
        anchors.verticalCenter: parent.verticalCenter
        z: 1
        fi_EXAMPLE_text: qsTr("CD / USB", "FigmaNode::I174:1652;11:1303") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::I174:1652;11:1303") : "")

        onClicked: {
            root.fi_cdUsb_clicked();
        }
        onDoubleClicked: {
            root.fi_cdUsb_doubleClicked();
        }
        onPressed: {
            root.fi_cdUsb_pressed();
        }
        onReleased: {
            root.fi_cdUsb_released();
        }
        onRepeatingTriggered: {
            root.fi_cdUsb_repeatingTriggered();
        }
    }
    ZetaSurgicalSet.SelectButton {
        id: fi_local
        anchors.left: parent.left
        anchors.leftMargin: 96
        anchors.right: parent.right
        anchors.rightMargin: 1224
        anchors.verticalCenter: parent.verticalCenter
        z: 2
        fi_EXAMPLE_text: qsTr("LOCAL", "FigmaNode::I174:1653;11:1306") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::I174:1653;11:1306") : "")

        onClicked: {
            root.fi_local_clicked();
        }
        onDoubleClicked: {
            root.fi_local_doubleClicked();
        }
        onPressed: {
            root.fi_local_pressed();
        }
        onReleased: {
            root.fi_local_released();
        }
        onRepeatingTriggered: {
            root.fi_local_repeatingTriggered();
        }
    }

    //----------------------------------------------------------------------------------------------

    //States----------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------
}
