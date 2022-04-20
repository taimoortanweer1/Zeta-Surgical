import QtQuick 2.14
import QtQuick.Controls 2.14

DecoratedViewportBase {
    id: root

    default property alias content: contentWrapper.data

    property alias contentX: viewport.contentX
    property alias contentY: viewport.contentY
    property alias contentWidth: contentWrapper.implicitWidth
    property alias contentHeight: contentWrapper.implicitHeight
    property alias boundsBehavior: viewport.boundsBehavior
    property alias interactive: viewport.interactive
    property alias contentItem: viewport.contentItem

    property alias fadeVisible: fade.visible

    readonly property alias dragging: viewport.dragging
    readonly property alias atXBeginning: viewport.atXBeginning
    readonly property alias atYBeginning: viewport.atYBeginning

    readonly property Flickable viewport: viewport
    readonly property int viewportWidth: viewport.width
    readonly property int viewportHeight: viewport.height

    horizontalScrollBarVisible: contentWidth > viewport.width
    verticalScrollBarVisible: contentHeight > viewport.height
    clip: true

    Flickable {
        id: viewport
        anchors.fill: parent

        contentWidth: contentWrapper.width
        contentHeight: contentWrapper.height

        ScrollBar.horizontal: root.horizontalScrollBar
        ScrollBar.vertical: root.verticalScrollBar

        focus: true
        clip: false

        FocusScope {
            id: contentWrapper
            focus: true
        }
    }

    Image {
        id: fade

        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottomMargin: -1

        fillMode: Image.Tile
        visible: viewport.contentY + viewport.height !== viewport.contentHeight && viewport.height < viewport.contentHeight
        source: "qrc:/assets/fade.png"
    }
}
