import QtQuick 2.14
import QtQuick.Controls 2.14

import Styles 1.0
import Themes 1.0
import Controls 1.0
import Helpers 1.0

DecoratedTextField {
    id: root

    property bool _localValueChange: false
    property bool _externalValueChange: false
    property QtObject target: null

    textFieldStyle: Theme.propertyEditorFormStyle.fieldValueTextFieldStyle

    Connections {
        target: root.target
        function onValueChanged() {
            if (root._localValueChange) return;
            root._externalValueChange = true
            root.text = root.target.value
            root._externalValueChange = false
        }
    }

    readOnly: target && target.readOnly !== undefined  && target.readOnly

    onTargetChanged: {
        if (target)
            text = target.value
    }

    onTextChanged: {
        if (target && text !== target.value) {
            _localValueChange = true
            target.value = text
            _localValueChange = false
        }
    }
}
