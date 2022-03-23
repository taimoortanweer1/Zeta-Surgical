import QtQuick 2.0

//PREVIEW IMAGE qrc:/DefaultComponentSet/PreviewAssets/mouse.png
MouseArea {
    id: root

    property int repeateInterval: 1000
    property int minimumRepeatInterval: 100
    property bool doubleClickEnabeld: false
    signal repeatingTriggered

    QtObject {
        id: internal

        property int repeateInterval: 1000
    }

    Timer {
        id: repeatTimer

        running: root.containsMouse && root.pressed
        interval: internal.repeateInterval
        //first emit done onPressed
        triggeredOnStart: false
        repeat: true
        onTriggered: {
            root.repeatingTriggered()
            if (internal.repeateInterval > root.minimumRepeatInterval) {
                var delta = Math.max((internal.repeateInterval - root.minimumRepeatInterval)/2, root.minimumRepeatInterval)
                internal.repeateInterval = Math.max(internal.repeateInterval - delta, root.minimumRepeatInterval)
            }
        }
    }

    onPressed: {
        internal.repeateInterval = root.repeateInterval
        //we should emit it once even if does not containsMouse
        //(happens on touch screen)
        root.repeatingTriggered()
    }
    onDoubleClicked: mouse.accepted = root.doubleClickEnabeld
}
