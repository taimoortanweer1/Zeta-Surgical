import QtQuick 2.14
import QtQuick.Controls 2.14

DecoratedViewportBase {
    id: root

    property alias contentX: viewport.contentX
    property alias contentY: viewport.contentY
    property alias contentWidth: viewport.contentWidth
    property alias contentHeight: viewport.contentHeight
    property alias currentIndex: viewport.currentIndex
    property alias currentItem: viewport.currentItem
    property alias boundsBehavior: viewport.boundsBehavior
    property alias interactive: viewport.interactive

    property alias cacheBuffer: viewport.cacheBuffer
    property alias delegate: viewport.delegate
    property alias section: viewport.section
    property alias model: viewport.model
    property alias count: viewport.count
    property alias spacing: viewport.spacing
    property alias orientation: viewport.orientation
    property alias keyNavigationEnabled: viewport.keyNavigationEnabled

    property alias highlightMoveDuration: viewport.highlightMoveDuration

    property alias fadeVisible: fade.visible

    readonly property int viewportWidth: viewport.width
    readonly property int viewportHeight: viewport.height

    readonly property alias viewportObject: viewport

    signal tabPressed(var event)
    signal backTabPressed(var event)

    horizontalScrollBarVisible: contentWidth > viewport.width
    verticalScrollBarVisible: contentHeight > viewport.height

    viewportEmpty: viewport.count === 0
    clip: true

    function positionViewAtEnd() { viewport.positionViewAtEnd() }

    function forceActiveFocus() {
        viewport.forceActiveFocus()
    }

    function itemAtIndex(index) {
        return viewport.itemAtIndex(index)
    }

    function positionViewAtIndex(index, mode) {
        viewport.positionViewAtIndex(index, mode)
    }

    ListView {
        id: viewport
        anchors.fill: parent

        ScrollBar.horizontal: root.horizontalScrollBar
        ScrollBar.vertical: root.verticalScrollBar

        Keys.onBacktabPressed: {
            root.backTabPressed(event)
        }
        Keys.onTabPressed: {
            root.tabPressed(event)
        }

        focus: true
        clip: false
    }

    Image {
        id: fade

        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        fillMode: Image.Tile
        visible: viewport.contentY + viewport.height !== viewport.contentHeight && viewport.height < viewport.contentHeight
        source: "qrc:/assets/fade.png"
    }
}
