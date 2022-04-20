import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet
import ZetaSurgical 1.0 as ZetaSurgicalSet

//USES ComponentsSet.Label
//USES Image
//USES ZetaSurgicalSet.ProgressIndicator_SortOrder
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
    property alias fi_Label_font: fi_Label.font
    //TEXTHAL 1
    property alias fi_Label_horizontalAlignment: fi_Label.horizontalAlignment
    //COLOR Outline/White
    property alias fi_Label_labelColor: fi_Label.textColor
    //REAL 20
    property alias fi_Label_lineHeight: fi_Label.lineHeight
    //TEXTLINEHM 1
    property alias fi_Label_lineHeightMode: fi_Label.lineHeightMode
    //REAL 1
    property alias fi_Label_opacity: fi_Label.opacity
    //BOOL false
    property alias fi_Label_richText: fi_Label.richText
    //TRANSLATABLE Name
    property alias fi_Label_text: fi_Label.text
    //TEXTVAL 128
    property alias fi_Label_verticalAlignment: fi_Label.verticalAlignment
    //REAL 1
    property alias fi_Line_108_opacity: fi_Line_108.opacity
    //ASSET /365_2930.png
    property alias fi_Line_108_source: fi_Line_108.source
    //INT 0
    property alias fi_ProgressIndicator_SortOrder_progressValue: fi_ProgressIndicator_SortOrder.progressValue

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
    height: 64

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    ComponentsSet.Label {
        id: fi_Label
        anchors.left: parent.left
        anchors.leftMargin: -1
        anchors.right: parent.right
        anchors.rightMargin: -1
        anchors.top: parent.top
        anchors.topMargin: -1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -1
        text: qsTr("Name", "FigmaNode::365:2926") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::365:2926") : "")
        font: GreenHouseThemeManager.theme.font("Figma::Arial_ArialMT_24_50_0_0_0_0_0.2")
        textColor: GreenHouseThemeManager.theme.color("Outline/White")
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        lineHeight: 20
        lineHeightMode: Text.FixedHeight
    }
    Image {
        id: fi_Line_108
        anchors.right: parent.right
        anchors.rightMargin: 1
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -1
        z: 1
        width: 0
        height: 41
        source: GreenHouseThemeManager.theme.asset("/365_2930.png")
    }
    ZetaSurgicalSet.ProgressIndicator_SortOrder {
        id: fi_ProgressIndicator_SortOrder
        anchors.right: parent.right
        anchors.rightMargin: 24
        anchors.top: parent.top
        anchors.topMargin: 18
        z: 2
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
