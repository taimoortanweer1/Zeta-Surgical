import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet


//USES ComponentsSet.Label
//USES ComponentsSet.AutoRepeatMouseArea
//PREVIEW IMAGE qrc:/GeneratedComponents/assets/Button.png


//EDITABLE TRUE
Item {
    id: root
    
    //Exposed properties----------------------------------------------------------------------------
    property bool doubleClickEnabeld: false
    property int minimumRepeatInterval: 100
    property int repeateInterval: 1000
    //FONT Figma::Arial_ArialMT_24_50_0_0_0_0_0.2
    property alias fi_Text_font: fi_Text.font
    //TEXTHAL 4
    property alias fi_Text_horizontalAlignment: fi_Text.horizontalAlignment
    //COLOR Text/White
    property alias fi_Text_labelColor: fi_Text.textColor
    //REAL 20
    property alias fi_Text_lineHeight: fi_Text.lineHeight
    //TEXTLINEHM 1
    property alias fi_Text_lineHeightMode: fi_Text.lineHeightMode
    //REAL 1
    property alias fi_Text_opacity: fi_Text.opacity
    //BOOL false
    property alias fi_Text_richText: fi_Text.richText
    //TRANSLATABLE Text
    property alias fi_Text_text: fi_Text.text
    //TEXTVAL 128
    property alias fi_Text_verticalAlignment: fi_Text.verticalAlignment
    
    //----------------------------------------------------------------------------------------------
    
    //Exposed signals-------------------------------------------------------------------------------
    signal clicked() /*__mouseArea.clicked*/
    signal doubleClicked() /*__mouseArea.doubleClicked*/
    signal pressed() /*__mouseArea.pressed*/
    signal released() /*__mouseArea.released*/
    signal repeatingTriggered() /*__mouseArea.repeatingTriggered*/
    
    //----------------------------------------------------------------------------------------------
    
    //Local bindings--------------------------------------------------------------------------------
    width: 136
    height: 80
    
    //----------------------------------------------------------------------------------------------
    
    //Children--------------------------------------------------------------------------------------
    ComponentsSet.Label {
        id: fi_Text
        anchors.left: parent.left
        anchors.leftMargin: -1
        anchors.right: parent.right
        anchors.rightMargin: -1
        anchors.verticalCenter: parent.verticalCenter
        height: 26
        text: qsTr("Text", "FigmaNode::366:3357") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::366:3357") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_24_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Text/White")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
        
        
        
        
        
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
    
    //----------------------------------------------------------------------------------------------
}
