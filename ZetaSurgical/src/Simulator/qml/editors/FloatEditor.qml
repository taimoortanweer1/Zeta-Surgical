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
            var val = Math.ceil(root.target.value * root._decimelsPower)
            if (val !== root.value)
                root.value = val
        }
    }

    onTargetChanged: {
        if (target)
            value = Math.ceil(target.value * _decimelsPower)
    }
    onValueChanged: {
        var val = value / _decimelsPower
        if (target) {
            _localValueChange = true
            target.value = val
            _localValueChange = false
        }
    }

    readOnly: target && target.readOnly !== undefined && target.readOnly
    editable: true
    property real min: -999.0
    property real max: 999.0
    property int decimals: 2
    property int _decimelsPower: Math.max(1, Math.pow(10, decimals))
    from: min * _decimelsPower
    to: max * _decimelsPower
    validator: DoubleValidator {
        bottom: Math.min(root.from, root.to)
        top: Math.max(root.from, root.to)
        decimals: root.decimals
    }
    textFromValue: function(value, locale) {
        return Number(value / _decimelsPower).toLocaleString(locale, 'f', root.decimals)
    }
    valueFromText: function(text, locale) {
        return Math.ceil(Number.fromLocaleString(locale, text) * root._decimelsPower);
    }
}
