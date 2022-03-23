import QtQuick 2.14

import Controls 1.0
import Helpers 1.0

DecoratedSwitch {
    id: root

    property QtObject target: null

    width: parent.width
    function sync(val) {
        checked = val
    }
    layoutDirection: Qt.RightToLeft

    onTargetChanged: {
        if (target)
            checked = target.value
    }
    onCheckedChanged: {
        if (target && checked !== target.value) {
            target.value = checked
            Simulator.objectTriggered(target)
        }
    }

    onClicked: root.forceActiveFocus()
    enabled: target && !target.readOnly

    Connections {
        target: root.target
        function onValueChanged() { root.checked = root.target.value }
    }
}
