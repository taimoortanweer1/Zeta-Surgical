import QtQuick 2.14

import Helpers 1.0

// NOTE: Splitter uses custom drag handling, since built-in Qt drag handling has bugs (such as the
// new visual position of the drag target not being reflected in the corresponding Item's "x" and
// "y" properties.
Item {
    id: root

    implicitWidth: splitterThickness
    implicitHeight: 10

    property int orientation: Qt.Horizontal

    readonly property alias dragging: controlArea.dragging

    property bool interactive: minimumPosition <= maximumPosition

    property real minimumPosition: controlArea.defaultMinimumPosition
    property real maximumPosition: controlArea.defaultMaximumPosition
    property real preferredInitialPosition: controlArea.defaultPreferredInitialPosition
    readonly property alias lastPreferedPosition: controlArea.lastPreferredPosition

    property real splitterThickness: 1
    property real controlAreaThickness: 5
    property real dragThresholdDistance: 5

    signal xPositionReduced(var value)

    function reduceXPosition(pixels) {
        if(d.internalUpdate)
            return
        const unaccommodatedPixels = pixels - (controlArea.lastPreferredPosition - minimumPosition)
        controlArea.lastPreferredPosition = Math.max(controlArea.lastPreferredPosition - pixels, minimumPosition);
        root.xPositionReduced(unaccommodatedPixels > 0 ? unaccommodatedPixels : 0)
    }

    MouseArea {
        id: controlArea

        anchors.fill: parent

        property real defaultMinimumPosition: 0
        property real defaultMaximumPosition: root.parent.width
        property real defaultPreferredInitialPosition: 0.5 * (defaultMinimumPosition + defaultMaximumPosition)

        property real lastPreferredPosition: root.preferredInitialPosition

        property point initialPoint
        property point dragStartPoint
        property bool dragging: false
        readonly property real dragThresholdDistance: root.dragThresholdDistance
        property string directionProperty

        function distance(point1, point2, directionProperty) {
            return point2[directionProperty] - point1[directionProperty]
        }
        function updatePosition(initialPoint, dragStartPoint, dragFinishPoint, directionProperty, minimumPosition, maximumPosition) {
            const desiredPosition = initialPoint[directionProperty]
                    + distance(dragStartPoint, dragFinishPoint, directionProperty)
            lastPreferredPosition = Math.max(minimumPosition, Math.min(maximumPosition, desiredPosition))
        }

        visible: root.interactive

        onPositionChanged: {
            if (!pressed)
                return

            d.internalUpdate = true

            const newDragPoint = controlArea.mapToItem(root.parent, mouse.x, mouse.y)
            if (!dragging) {
                if (Math.abs(distance(dragStartPoint, newDragPoint, directionProperty)) < dragThresholdDistance)
                    return

                dragging = true
            }

            updatePosition(initialPoint, dragStartPoint, newDragPoint, directionProperty, root.minimumPosition, root.maximumPosition)
            d.internalUpdate = false
        }

        onPressed: {
            initialPoint = Qt.point(root.x, root.y)
            dragStartPoint = controlArea.mapToItem(root.parent, mouse.x, mouse.y)
        }

        onReleased: {
            if (!dragging) {
                initialPoint = Qt.point(0, 0)
                dragStartPoint = Qt.point(0, 0)
                return
            }

            const newDragPoint = controlArea.mapToItem(root.parent, mouse.x, mouse.y)
            updatePosition(initialPoint, dragStartPoint, newDragPoint, directionProperty, root.minimumPosition, root.maximumPosition)

            initialPoint = Qt.point(0, 0)
            dragStartPoint = Qt.point(0, 0)
            dragging = false
        }
    }

    QtObject {
        id: d
        property bool internalUpdate: false
    }

    StateGroup {
        states: [
            // Horizontal Splitter
            State {
                when: root.orientation !== Qt.Vertical
                PropertyChanges {
                    target: root
                    x: Math.max(root.minimumPosition, Math.min(root.maximumPosition, controlArea.lastPreferredPosition))
                    implicitWidth: root.splitterThickness
                    implicitHeight: 10
                }
                PropertyChanges {
                    target: controlArea
                    anchors.topMargin: 0
                    anchors.leftMargin: 0.5 * (root.width - root.controlAreaThickness)
                    anchors.rightMargin: 0.5 * (root.width - root.controlAreaThickness)
                    anchors.bottomMargin: 0
                    cursorShape: Qt.SplitHCursor
                    defaultMaximumPosition: root.parent.width
                    directionProperty: "x"
                    lastPreferredPosition: root.preferredInitialPosition
                }
            },
            // Vertical Splitter
            State {
                when: root.orientation === Qt.Vertical
                PropertyChanges {
                    target: root
                    y: Math.max(root.minimumPosition, Math.min(root.maximumPosition, controlArea.lastPreferredPosition))
                    implicitWidth: 10
                    implicitHeight: root.splitterThickness
                }
                PropertyChanges {
                    target: controlArea
                    anchors.topMargin: 0.5 * (root.height - root.controlAreaThickness)
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0.5 * (root.height - root.controlAreaThickness)
                    cursorShape: Qt.SplitVCursor
                    defaultMaximumPosition: root.parent.height
                    directionProperty: "y"
                    lastPreferredPosition: root.preferredInitialPosition
                }
            }
        ]
    }

    BorderRectangle {
        id: background

        anchors.fill: parent

        color: DrawFunctions.borderColor
    }
}
