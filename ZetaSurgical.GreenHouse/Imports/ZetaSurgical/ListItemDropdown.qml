import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet


//USES Item
//USES ComponentsSet.AutoRepeatMouseArea
//USES ComponentsSet.Label
//USES Rectangle
//USES BorderImage
//PREVIEW IMAGE qrc:/GeneratedComponents/assets/ComboBox.png


//EDITABLE TRUE
Item {
    id: root
    
    //Exposed properties----------------------------------------------------------------------------
    property bool doubleClickEnabeld: false
    property int minimumRepeatInterval: 100
    property int repeateInterval: 1000
    //COLOR Fill/Light Grey 1
    property alias fi_Rectangle_62___default_color: fi_Rectangle_62___default.color
    //REAL 1
    property alias fi_Rectangle_62___default_opacity: fi_Rectangle_62___default.opacity
    //FONT Figma::Arial_ArialMT_22_50_0_0_0_0_0.2
    property alias fi_label_Role_Value_font: fi_label_Role_Value___default.font
    //TEXTHAL 1
    property alias fi_label_Role_Value_horizontalAlignment: fi_label_Role_Value___default.horizontalAlignment
    //REAL 20
    property alias fi_label_Role_Value_lineHeight: fi_label_Role_Value___default.lineHeight
    //TEXTLINEHM 1
    property alias fi_label_Role_Value_lineHeightMode: fi_label_Role_Value___default.lineHeightMode
    //REAL 1
    property alias fi_label_Role_Value_opacity: fi_label_Role_Value___default.opacity
    //BOOL false
    property alias fi_label_Role_Value_richText: fi_label_Role_Value___default.richText
    //TRANSLATABLE Axial
    property alias fi_label_Role_Value_text: fi_label_Role_Value___default.text
    //COLOR Text/White
    property alias fi_label_Role_Value_textColor: fi_label_Role_Value___default.textColor
    //TEXTVAL 128
    property alias fi_label_Role_Value_verticalAlignment: fi_label_Role_Value___default.verticalAlignment
    
    //----------------------------------------------------------------------------------------------
    
    //Exposed signals-------------------------------------------------------------------------------
    signal clicked() /*__mouseArea.clicked*/
    signal doubleClicked() /*__mouseArea.doubleClicked*/
    signal pressed() /*__mouseArea.pressed*/
    signal released() /*__mouseArea.released*/
    signal repeatingTriggered() /*__mouseArea.repeatingTriggered*/
    
    //----------------------------------------------------------------------------------------------
    
    //Local bindings--------------------------------------------------------------------------------
    width: 160
    height: 64
    
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
        id: pressed_StateParent
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
    ComponentsSet.Label {
        id: fi_label_Role_Value___default
        anchors.right: parent.right
        anchors.rightMargin: -1
        anchors.verticalCenter: parent.verticalCenter
        z: 1
        width: 146
        height: 42
        text: qsTr("Axial", "FigmaNode::164:1736") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::164:1736") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_22_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Text/White")
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
        
        
        
        
        
    }
    Rectangle {
        id: fi_Rectangle_62___default
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        color: GreenHouseThemeManager.theme.color("Fill/Light Grey 1")
        border.color: GreenHouseThemeManager.theme.color("Outline/White")
        border.width: 1
        visible: default_StateParent.visible
        
        
        
        
        
    }
    BorderImage {
        id: fi_Rectangle_62___pressed
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: GreenHouseThemeManager.theme.asset("/164_1744.png")
        visible: pressed_StateParent.visible
        border.bottom: 14
        border.left: 14
        border.right: 14
        border.top: 14
        
        
        
        
        
    }
    
    //----------------------------------------------------------------------------------------------
    
    //States----------------------------------------------------------------------------------------
    StateGroup { //
        states: [
        State {
            when: !__mouseArea.pressed
            name: "default"
            PropertyChanges {
                target: default_StateParent
                visible: true
                
            }
            PropertyChanges {
                target: pressed_StateParent
                visible: false
                
            }
            
        },
        State {
            when: __mouseArea.pressed
            name: "pressed"
            PropertyChanges {
                target: default_StateParent
                visible: false
                
            }
            PropertyChanges {
                target: pressed_StateParent
                visible: true
                
            }
            
        }
        ]
        transitions: [
        
        ]
    }
    
    //----------------------------------------------------------------------------------------------
}
