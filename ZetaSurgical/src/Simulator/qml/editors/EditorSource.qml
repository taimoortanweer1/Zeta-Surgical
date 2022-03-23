import QtQuick 2.6

import GreenHouse.Simulator 1.0

QtObject {
    id: root

    function getEditor(type) {
        var res = internal.unknown;
        switch (type) {
            case SimulatorObject.ByteArray:
            case SimulatorObject.String:
            case SimulatorObject.ByteArray:
            res = internal.stringEditor
            break;
            case SimulatorObject.Int:
            res = internal.intEditor
            break;
            case SimulatorObject.Float:
            res = internal.realEditor
            break;
            case SimulatorObject.Double:
            res = internal.doubleEditor
            break;
            case SimulatorObject.Bool:
            res = internal.boolEditor
            break;
            case SimulatorObject.Model:
            res = internal.modelEditor
            break;
        }
        return res;
    }

    function getBackgroundColor(type) {
        var res = "#888888";
        switch (type) {
        case SimulatorObject.ByteArray:
        case SimulatorObject.String:
            res = "#00BB50"
            break;
        case SimulatorObject.Int:
            res = "#9d9433"
            break;
        case SimulatorObject.Float:
            res = "#994499"
            break;
        case SimulatorObject.Double:
            res = "#5d5dc7"
            break;
        case SimulatorObject.Bool:
            res = "#5CA0A5"
            break;
        case SimulatorObject.Model:
            res = "#BB5000"
            break;
        }
        return res;
    }

    property QtObject internal: QtObject {
        readonly property Component unknown: Component {
            Item {}
        }
        readonly property Component stringEditor: Component {
            StringEditor {}
        }
        readonly property Component intEditor: Component {
            IntEditor {}
        }
        readonly property Component realEditor: Component {
            FloatEditor {}
        }
        readonly property Component doubleEditor: Component {
            DoubleEditor {}
        }
        readonly property Component boolEditor: Component {
            BoolEditor {}
        }
        readonly property Component modelEditor: Component {
            ModelEditor {}
        }
    }
}
