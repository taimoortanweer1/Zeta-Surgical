import QtQuick 2.14
import QtQuick.Controls 2.14

import Controls 1.0
import Helpers 1.0

DecoratedSpinBox {
    id: root

    property QtObject target: null
    property bool _localValueChange: false
    Connections {
        target: root.target
        function onValueChanged() {
            if (root._localValueChange) return;
            var val = root.target.value
            if (val !== root.value)
                root.value = val
        }
    }

    onTargetChanged: {
        if (target)
            value = target.value
    }
    onValueChanged: {
        var val = value
        if (target) {
            _localValueChange = true
            target.value = val
            _localValueChange = false
        }
    }

    readOnly: target && target.readOnly
    editable: true
    from: validator.bottom
    to: validator.top
    validator: IntValidator {
        bottom: -2147483647
        top: 2147483647
    }
}
