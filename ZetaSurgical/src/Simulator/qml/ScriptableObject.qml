import QtQuick 2.0

import GreenHouse.Simulator 1.0

QtObject {
    id: handlerRoot
    property QtObject self: null
    property Component timerCmp: Component {
        id: timerObjectCmp
        QtObject {
            property var action
            function trigger() { if (action) action(); }
            }
    }
    function startTimerLoop(interval, action) {
        var timerHandler = timerObjectCmp.createObject(handlerRoot)
        timerHandler.action = action
        self.installTimer(interval, timerHandler)
        return timerHandler
    }
    function stopTimerLoop(loopObject) {
        self.uninstallTimer(loopObject)
    }
}
