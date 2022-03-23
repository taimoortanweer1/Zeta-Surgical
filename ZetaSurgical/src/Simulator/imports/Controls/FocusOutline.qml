import QtQuick 2.14
import QtQuick.Shapes 1.14

Shape {
    id: root
    ShapePath {
        id: shapePath
        strokeColor: "lightgray"
        strokeStyle: ShapePath.DashLine
        fillColor: "transparent"
        startX: 0
        startY: 0
        PathLine {x: root.width - shapePath.strokeWidth; y: 0}
        PathLine {x: root.width - shapePath.strokeWidth; y: root.height - shapePath.strokeWidth}
        PathLine {x: shapePath.strokeWidth; y: root.height - shapePath.strokeWidth}
        PathLine {x: shapePath.strokeWidth; y: shapePath.strokeWidth}
    }
}
