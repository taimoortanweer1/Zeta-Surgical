import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet


//USES ComponentsSet.AutoRepeatMouseArea
//USES BorderImage
//USES ComponentsSet.Label
//PREVIEW IMAGE qrc:/GeneratedComponents/assets/Button.png


//EDITABLE TRUE
Item {
    id: root
    
    //Exposed properties----------------------------------------------------------------------------
    property bool doubleClickEnabeld: false
    property int minimumRepeatInterval: 100
    property int repeateInterval: 1000
    //FONT Figma::Arial_ArialMT_20_50_0_0_0_0_-0.4
    property alias fi_Letter_font: fi_Letter___default.font
    //TEXTHAL 2
    property alias fi_Letter_horizontalAlignment: fi_Letter___default.horizontalAlignment
    //REAL 23.44
    property alias fi_Letter_lineHeight: fi_Letter___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_Letter_lineHeightMode: fi_Letter___default.lineHeightMode
    //REAL 1
    property alias fi_Letter_opacity: fi_Letter___default.opacity
    //BOOL false
    property alias fi_Letter_richText: fi_Letter___default.richText
    //TRANSLATABLE shift
    property alias fi_Letter_text: fi_Letter___default.text
    //COLOR Dark Ink
    property alias fi_Letter_textColor: fi_Letter___default.textColor
    //TEXTVAL 64
    property alias fi_Letter_verticalAlignment: fi_Letter___default.verticalAlignment
    
    //----------------------------------------------------------------------------------------------
    
    //Exposed signals-------------------------------------------------------------------------------
    signal clicked() /*__mouseArea.clicked*/
    signal doubleClicked() /*__mouseArea.doubleClicked*/
    signal pressed() /*__mouseArea.pressed*/
    signal released() /*__mouseArea.released*/
    signal repeatingTriggered() /*__mouseArea.repeatingTriggered*/
    
    //----------------------------------------------------------------------------------------------
    
    //Local bindings--------------------------------------------------------------------------------
    width: 60
    height: 64
    
    //----------------------------------------------------------------------------------------------
    
    //Children--------------------------------------------------------------------------------------
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
        id: fi_Rectangle_360___default
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: GreenHouseThemeManager.theme.asset("/614_3336.png")
        border.bottom: 10
        border.left: 10
        border.right: 10
        border.top: 10
        
        
        
        
        
    }
    ComponentsSet.Label {
        id: fi_Letter___default
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.rightMargin: 16
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 16
        z: 1
        text: qsTr("shift", "FigmaNode::614:3337") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::614:3337") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_20_50_0_0_0_0_-0.4")
        textColor: GreenHouseThemeManager.theme.color("Dark Ink")
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignBottom
        wrapMode: Text.WordWrap
        lineHeight: 23.44
        lineHeightMode: Text.FixedHeight
        
        
        
        
        
    }
    
    //----------------------------------------------------------------------------------------------
    
    //States----------------------------------------------------------------------------------------
    StateGroup { //
        states: [
        State {
            when: !__mouseArea.pressed
            name: "default"
            PropertyChanges {
                target: fi_Rectangle_360___default
                border.bottom: 10
                border.left: 10
                border.right: 10
                border.top: 10
                source: GreenHouseThemeManager.theme.asset("/614_3336.png")
                
            }
            
        },
        State {
            when: __mouseArea.pressed
            name: "pressed"
            PropertyChanges {
                target: fi_Rectangle_360___default
                border.bottom: 14
                border.left: 14
                border.right: 14
                border.top: 14
                source: GreenHouseThemeManager.theme.asset("/614_3358.png")
                
            }
            
        }
        ]
        transitions: [
        
        ]
    }
    
    //----------------------------------------------------------------------------------------------
}
