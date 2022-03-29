import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import ZetaSurgical 1.0 as ZetaSurgicalSet

//USES ZetaSurgicalSet.Buttons_TextLeftAligned
//USES ZetaSurgicalSet.ModifyButton_Default_State
//USES ZetaSurgicalSet.DeleteButton_Default_State

//EDITABLE TRUE
Item {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    //BOOL false
    property alias fi_Buttons_TextLeftAligned_doubleClickEnabeld: fi_Buttons_TextLeftAligned.doubleClickEnabeld
    //BOOL true
    property alias fi_Buttons_TextLeftAligned_enabled: fi_Buttons_TextLeftAligned.enabled
    //FONT Figma::Arial_ArialMT_24_50_0_0_0_0_0.2
    property alias fi_Buttons_TextLeftAligned_fi_Default_Target_font: fi_Buttons_TextLeftAligned.fi_Default_Target_font
    //TEXTHAL 1
    property alias fi_Buttons_TextLeftAligned_fi_Default_Target_horizontalAlignment: fi_Buttons_TextLeftAligned.fi_Default_Target_horizontalAlignment
    //REAL 20
    property alias fi_Buttons_TextLeftAligned_fi_Default_Target_lineHeight: fi_Buttons_TextLeftAligned.fi_Default_Target_lineHeight
    //TEXTLINEHM 1
    property alias fi_Buttons_TextLeftAligned_fi_Default_Target_lineHeightMode: fi_Buttons_TextLeftAligned.fi_Default_Target_lineHeightMode
    //REAL 1
    property alias fi_Buttons_TextLeftAligned_fi_Default_Target_opacity: fi_Buttons_TextLeftAligned.fi_Default_Target_opacity
    //BOOL false
    property alias fi_Buttons_TextLeftAligned_fi_Default_Target_richText: fi_Buttons_TextLeftAligned.fi_Default_Target_richText
    //TRANSLATABLE Default Target
    property alias fi_Buttons_TextLeftAligned_fi_Default_Target_text: fi_Buttons_TextLeftAligned.fi_Default_Target_text
    //COLOR Icon/White
    property alias fi_Buttons_TextLeftAligned_fi_Default_Target_textColor: fi_Buttons_TextLeftAligned.fi_Default_Target_textColor
    //TEXTVAL 128
    property alias fi_Buttons_TextLeftAligned_fi_Default_Target_verticalAlignment: fi_Buttons_TextLeftAligned.fi_Default_Target_verticalAlignment
    //INT 0
    property alias fi_Buttons_TextLeftAligned_itemIndex: fi_Buttons_TextLeftAligned.itemIndex
    //INT 100
    property alias fi_Buttons_TextLeftAligned_minimumRepeatInterval: fi_Buttons_TextLeftAligned.minimumRepeatInterval
    //INT 1000
    property alias fi_Buttons_TextLeftAligned_repeateInterval: fi_Buttons_TextLeftAligned.repeateInterval
    //INT -1
    property alias fi_Buttons_TextLeftAligned_selectionIndex: fi_Buttons_TextLeftAligned.selectionIndex
    //BOOL false
    property alias fi_DeleteButton_doubleClickEnabeld: fi_DeleteButton.doubleClickEnabeld
    //BOOL true
    property alias fi_DeleteButton_enabled: fi_DeleteButton.enabled
    //REAL 1
    property alias fi_DeleteButton_fi_Ellipse_220_opacity: fi_DeleteButton.fi_Ellipse_220_opacity
    //ASSET /34_2732.png
    property alias fi_DeleteButton_fi_Ellipse_220_source: fi_DeleteButton.fi_Ellipse_220_source
    //REAL 1
    property alias fi_DeleteButton_icon_opacity: fi_DeleteButton.icon_opacity
    //ASSET /Icons/Delete__DefaultState.png
    property alias fi_DeleteButton_icon_source: fi_DeleteButton.icon_source
    //INT 100
    property alias fi_DeleteButton_minimumRepeatInterval: fi_DeleteButton.minimumRepeatInterval
    //INT 1000
    property alias fi_DeleteButton_repeateInterval: fi_DeleteButton.repeateInterval
    //BOOL false
    property alias fi_ModifyButton_doubleClickEnabeld: fi_ModifyButton.doubleClickEnabeld
    //BOOL true
    property alias fi_ModifyButton_enabled: fi_ModifyButton.enabled
    //REAL 1
    property alias fi_ModifyButton_fi_Ellipse_220_opacity: fi_ModifyButton.fi_Ellipse_220_opacity
    //ASSET /34_2747.png
    property alias fi_ModifyButton_fi_Ellipse_220_source: fi_ModifyButton.fi_Ellipse_220_source
    //REAL 1
    property alias fi_ModifyButton_icon_opacity: fi_ModifyButton.icon_opacity
    //ASSET /Icons/Edit__DefaultState.png
    property alias fi_ModifyButton_icon_source: fi_ModifyButton.icon_source
    //INT 100
    property alias fi_ModifyButton_minimumRepeatInterval: fi_ModifyButton.minimumRepeatInterval
    //INT 1000
    property alias fi_ModifyButton_repeateInterval: fi_ModifyButton.repeateInterval

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------
    signal fi_Buttons_TextLeftAligned_clicked() /*fi_Buttons_TextLeftAligned.clicked*/
    signal fi_Buttons_TextLeftAligned_doubleClicked() /*fi_Buttons_TextLeftAligned.doubleClicked*/
    signal fi_Buttons_TextLeftAligned_pressed() /*fi_Buttons_TextLeftAligned.pressed*/
    signal fi_Buttons_TextLeftAligned_released() /*fi_Buttons_TextLeftAligned.released*/
    signal fi_Buttons_TextLeftAligned_repeatingTriggered() /*fi_Buttons_TextLeftAligned.repeatingTriggered*/
    signal fi_DeleteButton_clicked() /*fi_DeleteButton.clicked*/
    signal fi_DeleteButton_doubleClicked() /*fi_DeleteButton.doubleClicked*/
    signal fi_DeleteButton_pressed() /*fi_DeleteButton.pressed*/
    signal fi_DeleteButton_released() /*fi_DeleteButton.released*/
    signal fi_DeleteButton_repeatingTriggered() /*fi_DeleteButton.repeatingTriggered*/
    signal fi_ModifyButton_clicked() /*fi_ModifyButton.clicked*/
    signal fi_ModifyButton_doubleClicked() /*fi_ModifyButton.doubleClicked*/
    signal fi_ModifyButton_pressed() /*fi_ModifyButton.pressed*/
    signal fi_ModifyButton_released() /*fi_ModifyButton.released*/
    signal fi_ModifyButton_repeatingTriggered() /*fi_ModifyButton.repeatingTriggered*/

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 368
    height: 80

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    ZetaSurgicalSet.Buttons_TextLeftAligned {
        id: fi_Buttons_TextLeftAligned
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        onClicked: {
            root.fi_Buttons_TextLeftAligned_clicked();
        }
        onDoubleClicked: {
            root.fi_Buttons_TextLeftAligned_doubleClicked();
        }
        onPressed: {
            root.fi_Buttons_TextLeftAligned_pressed();
        }
        onReleased: {
            root.fi_Buttons_TextLeftAligned_released();
        }
        onRepeatingTriggered: {
            root.fi_Buttons_TextLeftAligned_repeatingTriggered();
        }
    }
    ZetaSurgicalSet.ModifyButton_Default_State {
        id: fi_ModifyButton
        anchors.right: parent.right
        anchors.rightMargin: 96
        anchors.verticalCenter: parent.verticalCenter
        z: 1
        clip: true

        onClicked: {
            root.fi_ModifyButton_clicked();
        }
        onDoubleClicked: {
            root.fi_ModifyButton_doubleClicked();
        }
        onPressed: {
            root.fi_ModifyButton_pressed();
        }
        onReleased: {
            root.fi_ModifyButton_released();
        }
        onRepeatingTriggered: {
            root.fi_ModifyButton_repeatingTriggered();
        }
    }
    ZetaSurgicalSet.DeleteButton_Default_State {
        id: fi_DeleteButton
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.verticalCenter: parent.verticalCenter
        z: 2
        clip: true

        onClicked: {
            root.fi_DeleteButton_clicked();
        }
        onDoubleClicked: {
            root.fi_DeleteButton_doubleClicked();
        }
        onPressed: {
            root.fi_DeleteButton_pressed();
        }
        onReleased: {
            root.fi_DeleteButton_released();
        }
        onRepeatingTriggered: {
            root.fi_DeleteButton_repeatingTriggered();
        }
    }

    //----------------------------------------------------------------------------------------------

    //States----------------------------------------------------------------------------------------

    //----------------------------------------------------------------------------------------------
}
