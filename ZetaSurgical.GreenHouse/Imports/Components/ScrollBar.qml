import QtQml 2.14 as QML
import QtQuick 2.14
import GreenHouse.Theming 1.0

//PREVIEW IMAGE qrc:/DefaultComponentSet/PreviewAssets/scrollbar.png
Item {
    id: root

    width: 64
    height: 64

    //BOOL
    property bool autoHide: true
    property bool horizontal: false

    //ITEMREF
    property Item increaseButton: null
    //ITEMREF
    property Item decreaseButton: null

    //ITEMREF
    property Item flickable: null

    //ASSET /placeholders/scrollbar/background.png
    property string background: GreenHouseThemeManager.theme.asset("/placeholders/scrollbar/background.png")
    property int backgroundLeftBorder: 2
    property int backgroundRightBorder: 2
    property int backgroundTopBorder: 2
    property int backgroundBottomBorder: 2
    property int scrollChangeValue: 30
    BorderImage {
        id: background

        anchors.fill: parent
        border.left: root.backgroundLeftBorder
        border.right: root.backgroundRightBorder
        border.top: root.backgroundTopBorder
        border.bottom: root.backgroundBottomBorder
        source: root.background
    }

    //ASSET /placeholders/scrollbar/fill.png
    property string indicator: GreenHouseThemeManager.theme.asset("/placeholders/scrollbar/fill.png")
    property int indicatorLeftBorder: 5
    property int indicatorRightBorder: 5
    property int indicatorTopBorder: 5
    property int indicatorBottomBorder: 5
    BorderImage {
        id: indicator

        anchors.left: root.horizontal ? undefined : parent.left
        anchors.right: root.horizontal ? undefined : parent.right
        anchors.top: root.horizontal ? parent.top : undefined
        anchors.bottom: root.horizontal ? parent.bottom : undefined

        x: {
            if (root.horizontal && root.flickable.contentWidth > 0) {
                return Math.max(Math.min((root.flickable.contentX/root.flickable.contentWidth) * root.width,
                                         root.width - width),
                                0);
            }
            return 0;
        }
        y: {
            if (!root.horizontal && root.flickable.contentHeight) {
                return Math.max(Math.min((root.flickable.contentY/root.flickable.contentHeight) * root.height,
                                         root.height - height),
                                0);
            }
            return 0;
        }
        width: {
            if (!root.horizontal)
                return root.width;
            if (root.flickable && root.flickable.contentWidth > 0) {
                return Math.max(root.width * Math.min(1.0, root.flickable.width/root.flickable.contentWidth),
                                border.left + border.right);
            }
            return root.width;
        }
        height: {
            if (root.horizontal)
                return root.height;
            if (root.flickable && root.flickable.contentHeight > 0) {
                return Math.max(root.height * Math.min(1.0, root.flickable.height/root.flickable.contentHeight),
                                border.top + border.bottom)
            }
            return root.height;
        }

        border.left: root.indicatorLeftBorder
        border.right: root.indicatorRightBorder
        border.top: root.indicatorTopBorder
        border.bottom: root.indicatorBottomBorder
        source: root.indicator
    }

    //BOOL true
    property alias touchPositioning: ma.enabled
    MouseArea {
        id: ma

        anchors.fill: parent

        property real handleCenter: root.horizontal ? indicator.width * 0.5 : indicator.height * 0.5
        function positionView(v) {
            if (root.horizontal) {
                root.flickable.contentX = Math.max(Math.min(root.flickable.contentWidth - root.flickable.width,
                                                            v), 0)
            } else {
                root.flickable.contentY = Math.max(Math.min(root.flickable.contentHeight - root.flickable.height,
                                                            v), 0)
            }
        }

        onPressed: {
            if (root.horizontal) {
                positionView(((mouse.x - handleCenter)/width) * root.flickable.contentWidth)
            } else {
                positionView(((mouse.y - handleCenter)/height) * root.flickable.contentHeight)
            }
        }
        onMouseXChanged:  {
            if (root.horizontal) {
                positionView(((mouse.x - handleCenter)/width) * root.flickable.contentWidth)
            }
        }
        onMouseYChanged: {
            if (!root.horizontal) {
                positionView(((mouse.y - handleCenter)/height) * root.flickable.contentHeight)
            }
        }
    }

    QML.Binding {
        target: root
        property: "visible"
        when: root.autoHide && root.flickable !== null
        value: {
            if (root.horizontal)
                return root.flickable.width < root.flickable.contentWidth
            else
                return root.flickable.height < root.flickable.contentHeight
        }
        restoreMode: Binding.RestoreBinding
    }

    Connections {
        ignoreUnknownSignals: true
        target: root.increaseButton
        function onClicked() {
            if(!root.flickable)
                return;
            if(root.horizontal) {
                var newContentX = root.flickable.contentX + root.scrollChangeValue
                if(newContentX >= (root.flickable.contentWidth - root.flickable.width))
                    newContentX = (root.flickable.contentWidth - root.flickable.width)
                root.flickable.contentX = newContentX
            }else{
                var newContentY = root.flickable.contentY + root.scrollChangeValue
                if(newContentY >= (root.flickable.contentHeight - root.flickable.height))
                    newContentY = (root.flickable.contentHeight - root.flickable.height)
                root.flickable.contentY = newContentY
            }
        }
    }

    Connections {
        ignoreUnknownSignals: true
        target: root.decreaseButton
        function onClicked() {
            if(!root.flickable)
                return;
            if(root.horizontal) {
                var newContentX = root.flickable.contentX - root.scrollChangeValue
                if(newContentX <= 0)
                    newContentX = 0
                root.flickable.contentX = newContentX
            }else{
                var newContentY = root.flickable.contentY - root.scrollChangeValue
                if(newContentY <= 0)
                    newContentY = 0
                root.flickable.contentY = newContentY
            }
        }
    }
}
