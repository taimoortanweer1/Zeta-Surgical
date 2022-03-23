import QtQuick 2.0
import QtQuick.Controls 2.7

//PREVIEW IMAGE qrc:/DefaultComponentSet/PreviewAssets/valueTumbler.png
//PARENTING FALSE
Item {
    id: root

    //MODEL
    property alias model: tumbler.model
    //DELEGATE
    property alias delegate: tumbler.delegate
    //INT 0
    property alias selectedIndex: tumbler.currentIndex

    property real offCenterOpacity: 0.5

    property int visibleItemCount: 3
    property bool wrap: true

    signal indexSelected(int index)

    width: 50
    height: 150

    Tumbler {
        id: tumbler

        onCurrentIndexChanged: {
            if (!moving)
                tumbler.positionViewAtIndex(currentIndex, Tumbler.Center)
        }
        onMovingChanged: {
            if (!moving)
                root.indexSelected(currentIndex)
        }
        anchors.fill: parent

        wrap: root.wrap
        visibleItemCount: root.visibleItemCount
    }
}
