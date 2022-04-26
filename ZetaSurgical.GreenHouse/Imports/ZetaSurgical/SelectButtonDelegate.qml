import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet


//USES BorderImage
//USES ComponentsSet.Label
//USES Item
//USES ComponentsSet.AutoRepeatMouseArea
//PREVIEW IMAGE qrc:/GeneratedComponents/assets/Button.png


//EDITABLE TRUE
Item {
    id: root
    
    //Exposed properties----------------------------------------------------------------------------
    property bool activated_flag: false
    property bool doubleClickEnabeld: false
    property int minimumRepeatInterval: 100
    property int repeateInterval: 1000
    //FONT Figma::Arial_ArialMT_24_50_0_0_0_0_0.2
    property alias fi_EXAMPLE_font: fi_EXAMPLE___activated.font
    //TEXTHAL 4
    property alias fi_EXAMPLE_horizontalAlignment: fi_EXAMPLE___activated.horizontalAlignment
    //REAL 20
    property alias fi_EXAMPLE_lineHeight: fi_EXAMPLE___activated.lineHeight
    //TEXTLINEHM 1
    property alias fi_EXAMPLE_lineHeightMode: fi_EXAMPLE___activated.lineHeightMode
    //REAL 1
    property alias fi_EXAMPLE_opacity: fi_EXAMPLE___activated.opacity
    //BOOL false
    property alias fi_EXAMPLE_richText: fi_EXAMPLE___activated.richText
    //TRANSLATABLE EXAMPLE
    property alias fi_EXAMPLE_text: fi_EXAMPLE___activated.text
    //TEXTVAL 128
    property alias fi_EXAMPLE_verticalAlignment: fi_EXAMPLE___activated.verticalAlignment
    
    //----------------------------------------------------------------------------------------------
    
    //Exposed signals-------------------------------------------------------------------------------
    signal clicked() /*__mouseArea.clicked*/
    signal doubleClicked() /*__mouseArea.doubleClicked*/
    signal pressed() /*__mouseArea.pressed*/
    signal released() /*__mouseArea.released*/
    signal repeatingTriggered() /*__mouseArea.repeatingTriggered*/
    
    //----------------------------------------------------------------------------------------------
    
    //Local bindings--------------------------------------------------------------------------------
    width: 352
    height: 56
    
    //----------------------------------------------------------------------------------------------
    
    //Children--------------------------------------------------------------------------------------
    Item {
        id: activated_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        visible: false
        
        
        
        BorderImage {
            id: fi_Background_9seg_29_29_29_29___activated
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: GreenHouseThemeManager.theme.asset("/387_2223.png")
            border.bottom: 27
            border.left: 27
            border.right: 27
            border.top: 27
            
            
            
            
            
        }
        ComponentsSet.Label {
            id: fi_EXAMPLE___activated
            anchors.left: parent.left
            anchors.leftMargin: -1
            anchors.right: parent.right
            anchors.rightMargin: -1
            anchors.verticalCenter: parent.verticalCenter
            z: 1
            height: 26
            text: qsTr("EXAMPLE", "FigmaNode::387:2224") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::387:2224") : "")
            font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_24_50_0_0_0_0_0.2")
            textColor: GreenHouseThemeManager.theme.color("Text/White")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            lineHeight: 20
            lineHeightMode: Text.FixedHeight
            
            
            
            
            
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
    BorderImage {
        id: fi_Background_9seg_29_29_29_29___default
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: GreenHouseThemeManager.theme.asset("/387_2226.png")
        border.bottom: 27
        border.left: 27
        border.right: 27
        border.top: 27
        
        
        
        
        
    }
    ComponentsSet.Label {
        id: fi_EXAMPLE___default
        anchors.left: parent.left
        anchors.leftMargin: -1
        anchors.right: parent.right
        anchors.rightMargin: -1
        anchors.verticalCenter: parent.verticalCenter
        z: 1
        height: 26
        text: fi_EXAMPLE___activated.text
        font: fi_EXAMPLE___activated.font
        textColor: GreenHouseThemeManager.theme.color("Text/White")
        opacity: fi_EXAMPLE___activated.opacity
        horizontalAlignment: fi_EXAMPLE___activated.horizontalAlignment
        verticalAlignment: fi_EXAMPLE___activated.verticalAlignment
        wrapMode: Text.WordWrap
        lineHeight: fi_EXAMPLE___activated.lineHeight
        lineHeightMode: fi_EXAMPLE___activated.lineHeightMode
        richText: fi_EXAMPLE___activated.richText
        
        
        
        
        
    }
    
    //----------------------------------------------------------------------------------------------
    
    //States----------------------------------------------------------------------------------------
    StateGroup { //
        states: [
        State {
            when: root.enabled && !__mouseArea.pressed
            name: "default"
            PropertyChanges {
                target: fi_Background_9seg_29_29_29_29___default
                source: GreenHouseThemeManager.theme.asset("/387_2226.png")
                
            }
            PropertyChanges {
                target: fi_EXAMPLE___default
                textColor: GreenHouseThemeManager.theme.color("Text/White")
                
            }
            
        },
        State {
            when: !root.enabled && !__mouseArea.pressed
            name: "disabled"
            PropertyChanges {
                target: fi_Background_9seg_29_29_29_29___default
                source: GreenHouseThemeManager.theme.asset("/387_2229.png")
                
            }
            PropertyChanges {
                target: fi_EXAMPLE___default
                textColor: GreenHouseThemeManager.theme.color("Text/Grey 1 - Inactive")
                
            }
            
        },
        State {
            when: root.enabled && __mouseArea.pressed
            name: "pressed"
            PropertyChanges {
                target: fi_Background_9seg_29_29_29_29___default
                source: GreenHouseThemeManager.theme.asset("/387_2232.png")
                
            }
            
        }
        ]
        transitions: [
        
        ]
    }
    StateGroup { // generic_activated
        states: [
        State {
            when: root.activated_flag
            name: "activated"
            PropertyChanges {
                target: activated_StateParent
                visible: true
                z: 999
                
            }
            
        }
        ]
        transitions: [
        
        ]
    }
    
    //----------------------------------------------------------------------------------------------
}
