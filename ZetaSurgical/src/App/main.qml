import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    id: window

    visible: true

    property double desiredWidth: 1920
    property double desiredHeight: 1080

    width: desiredWidth
    height: desiredHeight

    title: qsTr("GreenHouse Application")

    Item {
        id: root
        anchors.centerIn: parent

        width: window.desiredWidth
        height: window.desiredHeight

        scale: Math.min(window.width / width, window.height / height)

        function onLayerCreated(name, layer) {
        }

        function onLayerRemoved(name) {
        }

        function onItemCreated(name, item) {
        }

        function onItemRemoved(name) {
        }
    }
    Component.onCompleted: Integration.mainWindowCreated(root, window)
}
