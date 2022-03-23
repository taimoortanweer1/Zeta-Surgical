import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import ZetaSurgical 1.0 as ZetaSurgicalSet
import Components 1.0 as ComponentsSet

//USES BorderImage
//USES ComponentsSet.Label
//USES Image
//USES Item
//USES ComponentsSet.ModelView
//USES ComponentsSet.DropDownContainer
//USES ComponentsSet.FocusArea
//USES ZetaSurgicalSet.ListItemDropdown
//PREVIEW IMAGE qrc:/GeneratedComponents/assets/ComboBox.png

//EDITABLE TRUE
Item {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    property bool pressed_flag: false
    property int selectionIndex: -1
    //INT 0
    property alias maximumItemsVisible: expanded_StateParent.maximumItemsVisible
    //FONT Figma::Arial_ArialMT_18_50_0_0_0_0_0.2
    property alias fi_Coronal_font: fi_Coronal___collapsed.font
    //TEXTHAL 1
    property alias fi_Coronal_horizontalAlignment: fi_Coronal___collapsed.horizontalAlignment
    //REAL 20
    property alias fi_Coronal_lineHeight: fi_Coronal___collapsed.lineHeight
    //TEXTLINEHM 1
    property alias fi_Coronal_lineHeightMode: fi_Coronal___collapsed.lineHeightMode
    //REAL 1
    property alias fi_Coronal_opacity: fi_Coronal___collapsed.opacity
    //BOOL false
    property alias fi_Coronal_richText: fi_Coronal___collapsed.richText
    //TRANSLATABLE Coronal
    property alias fi_Coronal_text: fi_Coronal___collapsed.text
    //COLOR Text/White
    property alias fi_Coronal_textColor: fi_Coronal___collapsed.textColor
    //TEXTVAL 128
    property alias fi_Coronal_verticalAlignment: fi_Coronal___collapsed.verticalAlignment
    //INT -1
    property alias fi_ListView_DropDown_FitDelegate_currentDelegate: fi_ListView_DropDown_FitDelegate.currentDelegate
    //MODEL
    property alias fi_ListView_DropDown_FitDelegate_viewModel: fi_ListView_DropDown_FitDelegate.viewModel
    //REAL 1
    property alias icon_opacity: icon___collapsed.opacity
    //ASSET /Icons/DownTriangle__DefaultState.png
    property alias icon_source: icon___collapsed.source

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------
    signal clicked() /*__focusArea.clicked*/
    signal fi_ListItemDropdown_doubleClicked(int index) /*fi_ListItemDropdown.doubleClicked*/
    signal fi_ListItemDropdown_pressed(int index) /*fi_ListItemDropdown.pressed*/
    signal fi_ListItemDropdown_released(int index) /*fi_ListItemDropdown.released*/
    signal fi_ListItemDropdown_repeatingTriggered(int index) /*fi_ListItemDropdown.repeatingTriggered*/
    signal selectionMade(int index) /*fi_ListItemDropdown.clicked*/
    signal fi_ListView_DropDown_FitDelegate_currentIndexUpdated(var index) /*fi_ListView_DropDown_FitDelegate.currentIndexUpdated*/
    signal fi_ListView_DropDown_FitDelegate_isDragging(var dragging) /*fi_ListView_DropDown_FitDelegate.isDragging*/

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 160
    height: 64

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    Component {
        id: fi_ListView_DropDown_FitDelegate_delegate_cmp
        FocusScope {
            id: fi_ListView_DropDown_FitDelegate_delegate
            anchors.left: parent && (!ListView.view || ListView.view.orientation === ListView.Vertical) ? parent.left : undefined
            anchors.right: parent && (!ListView.view || ListView.view.orientation === ListView.Vertical) ? parent.right : undefined
            width: 160
            height: 64

            ZetaSurgicalSet.ListItemDropdown {
                id: fi_ListItemDropdown
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                onClicked: {
                    root.selectionMade(index);
                }
                onDoubleClicked: {
                    root.fi_ListItemDropdown_doubleClicked(index);
                }
                onPressed: {
                    root.fi_ListItemDropdown_pressed(index);
                }
                onReleased: {
                    root.fi_ListItemDropdown_released(index);
                }
                onRepeatingTriggered: {
                    root.fi_ListItemDropdown_repeatingTriggered(index);
                }
            }
        }
    }
    Item {
        id: collapsed_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 64

        BorderImage {
            id: fi_Rectangle_62___collapsed
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: GreenHouseThemeManager.theme.asset("/20_1961.png")
            border.bottom: 5
            border.left: 5
            border.right: 5
            border.top: 5
        }
        ComponentsSet.Label {
            id: fi_Coronal___collapsed
            anchors.right: parent.right
            anchors.rightMargin: -1
            anchors.verticalCenter: parent.verticalCenter
            z: 1
            width: 146
            height: 42
            text: qsTr("Coronal", "FigmaNode::21:6440") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::21:6440") : "")
            font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_18_50_0_0_0_0_0.2")
            textColor: GreenHouseThemeManager.theme.color("Text/White")
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            lineHeight: 20
            lineHeightMode: Text.FixedHeight
        }
        Image {
            id: icon___collapsed
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            z: 2
            width: 64
            height: 64
            source: GreenHouseThemeManager.theme.asset("/Icons/DownTriangle__DefaultState.png")
        }
    }
    ComponentsSet.DropDownContainer {
        id: expanded_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        delegateHeight: 64
        dropDownItem: fi_ListView_DropDown_FitDelegate

        BorderImage {
            id: fi_Rectangle_62___expanded
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            height: 64
            source: GreenHouseThemeManager.theme.asset("/164_1724.png")
            border.left: 5
            border.right: 5
        }
        Image {
            id: icon___expanded
            anchors.right: parent.right
            anchors.top: parent.top
            z: 1
            width: 64
            height: 64
            source: icon___collapsed.source
            opacity: icon___collapsed.opacity
        }
        ComponentsSet.Label {
            id: fi_Coronal___expanded
            anchors.right: parent.right
            anchors.rightMargin: -1
            anchors.top: parent.top
            anchors.topMargin: 11
            z: 2
            width: 146
            height: 42
            text: fi_Coronal___collapsed.text
            font: fi_Coronal___collapsed.font
            textColor: fi_Coronal___collapsed.textColor
            opacity: fi_Coronal___collapsed.opacity
            horizontalAlignment: fi_Coronal___collapsed.horizontalAlignment
            verticalAlignment: fi_Coronal___collapsed.verticalAlignment
            wrapMode: Text.WordWrap
            lineHeight: fi_Coronal___collapsed.lineHeight
            lineHeightMode: fi_Coronal___collapsed.lineHeightMode
            richText: fi_Coronal___collapsed.richText
        }
        ComponentsSet.ModelView {
            id: fi_ListView_DropDown_FitDelegate
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 64
            anchors.bottom: parent.bottom
            z: 3
            width: 160
            viewDelegate: fi_ListView_DropDown_FitDelegate_delegate_cmp
            currentDelegate: root.selectionIndex

            onCurrentIndexUpdated: {
                root.fi_ListView_DropDown_FitDelegate_currentIndexUpdated(index);
            }
            onIsDragging: {
                root.fi_ListView_DropDown_FitDelegate_isDragging(dragging);
            }
        }
    }
    Item {
        id: pressed_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        visible: false

        BorderImage {
            id: fi_Rectangle_62___pressed
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: GreenHouseThemeManager.theme.asset("/164_1681.png")
            border.bottom: 14
            border.left: 14
            border.right: 14
            border.top: 14
        }
        ComponentsSet.Label {
            id: fi_Coronal___pressed
            anchors.right: parent.right
            anchors.rightMargin: -1
            anchors.verticalCenter: parent.verticalCenter
            z: 1
            width: 146
            height: 42
            text: fi_Coronal___collapsed.text
            font: fi_Coronal___collapsed.font
            textColor: fi_Coronal___collapsed.textColor
            opacity: fi_Coronal___collapsed.opacity
            horizontalAlignment: fi_Coronal___collapsed.horizontalAlignment
            verticalAlignment: fi_Coronal___collapsed.verticalAlignment
            wrapMode: Text.WordWrap
            lineHeight: fi_Coronal___collapsed.lineHeight
            lineHeightMode: fi_Coronal___collapsed.lineHeightMode
            richText: fi_Coronal___collapsed.richText
        }
        Image {
            id: icon___pressed
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            z: 2
            width: 64
            height: 64
            source: icon___collapsed.source
            opacity: icon___collapsed.opacity
        }
    }
    ComponentsSet.FocusArea {
        id: __focusArea
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        onClicked: {
            root.clicked();
        }
    }

    //----------------------------------------------------------------------------------------------

    //States----------------------------------------------------------------------------------------
    StateGroup { //
        states: [
        State {
            when: !__focusArea.focused
            name: "collapsed"
            PropertyChanges {
                target: collapsed_StateParent
                visible: true
            }
            PropertyChanges {
                target: expanded_StateParent
                visible: false
            }
        },
        State {
            when: __focusArea.focused
            name: "expanded"
            PropertyChanges {
                target: collapsed_StateParent
                visible: false
            }
            PropertyChanges {
                target: expanded_StateParent
                visible: true
            }
            PropertyChanges {
                target: root
                z: 2147483646
            }
        }
        ]
    }
    StateGroup { // generic_pressed
        states: [
        State {
            when: root.pressed_flag
            name: "pressed"
            PropertyChanges {
                target: pressed_StateParent
                visible: true
                z: 999
            }
        }
        ]
    }

    //----------------------------------------------------------------------------------------------
}
