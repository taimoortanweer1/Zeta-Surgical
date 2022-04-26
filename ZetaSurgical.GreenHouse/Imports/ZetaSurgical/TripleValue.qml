import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import ZetaSurgical 1.0 as ZetaSurgicalSet


//USES ZetaSurgicalSet.ProgressIndicator_Triple
//USES ZetaSurgicalSet.Buttons_TextOnly_Default_State
//PREVIEW IMAGE qrc:/GeneratedComponents/assets/TextInput.png


//EDITABLE TRUE
Item {
    id: root
    
    //Exposed properties----------------------------------------------------------------------------
    //INT 0
    property alias fi_Background_progressValue: fi_Background.progressValue
    //BOOL false
    property alias fi_Value2_doubleClickEnabeld: fi_Value2.doubleClickEnabeld
    //BOOL true
    property alias fi_Value2_enabled: fi_Value2.enabled
    //FONT Figma::Arial_ArialMT_24_50_0_0_0_0_0.2
    property alias fi_Value2_fi_Text_font: fi_Value2.fi_Text_font
    //TEXTHAL 4
    property alias fi_Value2_fi_Text_horizontalAlignment: fi_Value2.fi_Text_horizontalAlignment
    //COLOR Text/White
    property alias fi_Value2_fi_Text_labelColor: fi_Value2.fi_Text_labelColor
    //REAL 20
    property alias fi_Value2_fi_Text_lineHeight: fi_Value2.fi_Text_lineHeight
    //TEXTLINEHM 1
    property alias fi_Value2_fi_Text_lineHeightMode: fi_Value2.fi_Text_lineHeightMode
    //REAL 1
    property alias fi_Value2_fi_Text_opacity: fi_Value2.fi_Text_opacity
    //BOOL false
    property alias fi_Value2_fi_Text_richText: fi_Value2.fi_Text_richText
    //TRANSLATABLE Axial
    property alias fi_Value2_fi_Text_text: fi_Value2.fi_Text_text
    //TEXTVAL 128
    property alias fi_Value2_fi_Text_verticalAlignment: fi_Value2.fi_Text_verticalAlignment
    //INT 100
    property alias fi_Value2_minimumRepeatInterval: fi_Value2.minimumRepeatInterval
    //INT 1000
    property alias fi_Value2_repeateInterval: fi_Value2.repeateInterval
    //BOOL false
    property alias fi__Value1_doubleClickEnabeld: fi__Value1.doubleClickEnabeld
    //BOOL true
    property alias fi__Value1_enabled: fi__Value1.enabled
    //FONT Figma::Arial_ArialMT_24_50_0_0_0_0_0.2
    property alias fi__Value1_fi_Text_font: fi__Value1.fi_Text_font
    //TEXTHAL 4
    property alias fi__Value1_fi_Text_horizontalAlignment: fi__Value1.fi_Text_horizontalAlignment
    //COLOR Text/White
    property alias fi__Value1_fi_Text_labelColor: fi__Value1.fi_Text_labelColor
    //REAL 20
    property alias fi__Value1_fi_Text_lineHeight: fi__Value1.fi_Text_lineHeight
    //TEXTLINEHM 1
    property alias fi__Value1_fi_Text_lineHeightMode: fi__Value1.fi_Text_lineHeightMode
    //REAL 1
    property alias fi__Value1_fi_Text_opacity: fi__Value1.fi_Text_opacity
    //BOOL false
    property alias fi__Value1_fi_Text_richText: fi__Value1.fi_Text_richText
    //TRANSLATABLE Coronal
    property alias fi__Value1_fi_Text_text: fi__Value1.fi_Text_text
    //TEXTVAL 128
    property alias fi__Value1_fi_Text_verticalAlignment: fi__Value1.fi_Text_verticalAlignment
    //INT 100
    property alias fi__Value1_minimumRepeatInterval: fi__Value1.minimumRepeatInterval
    //INT 1000
    property alias fi__Value1_repeateInterval: fi__Value1.repeateInterval
    //BOOL false
    property alias fi__Value3_doubleClickEnabeld: fi__Value3.doubleClickEnabeld
    //BOOL true
    property alias fi__Value3_enabled: fi__Value3.enabled
    //FONT Figma::Arial_ArialMT_24_50_0_0_0_0_0.2
    property alias fi__Value3_fi_Text_font: fi__Value3.fi_Text_font
    //TEXTHAL 4
    property alias fi__Value3_fi_Text_horizontalAlignment: fi__Value3.fi_Text_horizontalAlignment
    //COLOR Text/White
    property alias fi__Value3_fi_Text_labelColor: fi__Value3.fi_Text_labelColor
    //REAL 20
    property alias fi__Value3_fi_Text_lineHeight: fi__Value3.fi_Text_lineHeight
    //TEXTLINEHM 1
    property alias fi__Value3_fi_Text_lineHeightMode: fi__Value3.fi_Text_lineHeightMode
    //REAL 1
    property alias fi__Value3_fi_Text_opacity: fi__Value3.fi_Text_opacity
    //BOOL false
    property alias fi__Value3_fi_Text_richText: fi__Value3.fi_Text_richText
    //TRANSLATABLE Saggital
    property alias fi__Value3_fi_Text_text: fi__Value3.fi_Text_text
    //TEXTVAL 128
    property alias fi__Value3_fi_Text_verticalAlignment: fi__Value3.fi_Text_verticalAlignment
    //INT 100
    property alias fi__Value3_minimumRepeatInterval: fi__Value3.minimumRepeatInterval
    //INT 1000
    property alias fi__Value3_repeateInterval: fi__Value3.repeateInterval
    
    //----------------------------------------------------------------------------------------------
    
    //Exposed signals-------------------------------------------------------------------------------
    signal fi_Value2_clicked() /*fi_Value2.clicked*/
    signal fi_Value2_doubleClicked() /*fi_Value2.doubleClicked*/
    signal fi_Value2_pressed() /*fi_Value2.pressed*/
    signal fi_Value2_released() /*fi_Value2.released*/
    signal fi_Value2_repeatingTriggered() /*fi_Value2.repeatingTriggered*/
    signal fi__Value1_clicked() /*fi__Value1.clicked*/
    signal fi__Value1_doubleClicked() /*fi__Value1.doubleClicked*/
    signal fi__Value1_pressed() /*fi__Value1.pressed*/
    signal fi__Value1_released() /*fi__Value1.released*/
    signal fi__Value1_repeatingTriggered() /*fi__Value1.repeatingTriggered*/
    signal fi__Value3_clicked() /*fi__Value3.clicked*/
    signal fi__Value3_doubleClicked() /*fi__Value3.doubleClicked*/
    signal fi__Value3_pressed() /*fi__Value3.pressed*/
    signal fi__Value3_released() /*fi__Value3.released*/
    signal fi__Value3_repeatingTriggered() /*fi__Value3.repeatingTriggered*/
    
    //----------------------------------------------------------------------------------------------
    
    //Local bindings--------------------------------------------------------------------------------
    width: 408
    height: 80
    
    //----------------------------------------------------------------------------------------------
    
    //Children--------------------------------------------------------------------------------------
    ZetaSurgicalSet.ProgressIndicator_Triple {
        id: fi_Background
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        z: -1
        
        
        
        
        
    }
    ZetaSurgicalSet.Buttons_TextOnly_Default_State {
        id: fi__Value1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.rightMargin: 272
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        z: 1
        fi_Text_text: qsTr("Coronal", "FigmaNode::I366:3363;366:3357") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::I366:3363;366:3357") : "")
        
        
        
        
        onClicked: {
            root.fi__Value1_clicked();
        }
        onDoubleClicked: {
            root.fi__Value1_doubleClicked();
        }
        onPressed: {
            root.fi__Value1_pressed();
        }
        onReleased: {
            root.fi__Value1_released();
        }
        onRepeatingTriggered: {
            root.fi__Value1_repeatingTriggered();
        }
        
    }
    ZetaSurgicalSet.Buttons_TextOnly_Default_State {
        id: fi_Value2
        anchors.left: parent.left
        anchors.leftMargin: 136
        anchors.right: parent.right
        anchors.rightMargin: 136
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        z: 2
        fi_Text_text: qsTr("Axial", "FigmaNode::I366:3365;366:3357") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::I366:3365;366:3357") : "")
        
        
        
        
        onClicked: {
            root.fi_Value2_clicked();
        }
        onDoubleClicked: {
            root.fi_Value2_doubleClicked();
        }
        onPressed: {
            root.fi_Value2_pressed();
        }
        onReleased: {
            root.fi_Value2_released();
        }
        onRepeatingTriggered: {
            root.fi_Value2_repeatingTriggered();
        }
        
    }
    ZetaSurgicalSet.Buttons_TextOnly_Default_State {
        id: fi__Value3
        anchors.left: parent.left
        anchors.leftMargin: 272
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        z: 3
        fi_Text_text: qsTr("Saggital", "FigmaNode::I366:3367;366:3357") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::I366:3367;366:3357") : "")
        
        
        
        
        onClicked: {
            root.fi__Value3_clicked();
        }
        onDoubleClicked: {
            root.fi__Value3_doubleClicked();
        }
        onPressed: {
            root.fi__Value3_pressed();
        }
        onReleased: {
            root.fi__Value3_released();
        }
        onRepeatingTriggered: {
            root.fi__Value3_repeatingTriggered();
        }
        
    }
    
    //----------------------------------------------------------------------------------------------
    
    //States----------------------------------------------------------------------------------------
    
    //----------------------------------------------------------------------------------------------
}
