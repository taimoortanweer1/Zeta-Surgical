import QtQuick 2.14

Item {
    id: root

    property alias backgroundVisible: bg.visible
    property bool light: false

    Image {
        id: bg

        anchors.fill: parent

        source: root.light ? "qrc:/assets/checkerboard_light.png" : "qrc:/assets/checkerboard.png"
        fillMode: Image.Tile
        z: -10000
    }
}
