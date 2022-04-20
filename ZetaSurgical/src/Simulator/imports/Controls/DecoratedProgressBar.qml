import QtQuick 2.14

Item {
    id: root

    property real value: 0
    property alias backgroundColor: background.color
    property alias fillColor: fillRectangle.color

    clip: true
    Rectangle {
        id: background
        anchors.fill: parent
        radius: 5
        color: "#5031CB6E"
        Item {
            id: fillRectangleClipper
            anchors {
                left: parent.left
                top:parent.top
                bottom: parent.bottom
            }
            width: {
                let progress = root.value;
                if(progress < 0)
                    progress = 0
                else if(progress > 1)
                    progress = 1
                root.width * progress
            }
            clip: true
            Rectangle {
                id: fillRectangle
                anchors {
                    left: parent.left
                    top:parent.top
                    bottom: parent.bottom
                }
                width: root.width
                radius: 5
                color: "#31CB6E"
            }
        }
    }
}
