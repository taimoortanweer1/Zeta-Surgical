import QtQuick 2.14

FocusScope {
    id: root

    width: implicitWidth
    height: implicitHeight
    implicitWidth: 62
    implicitHeight: 24

    opacity: enabled && !readOnly ? 1.0 : 0.5

    property alias readOnly: textInput.readOnly
    property bool stealth: false
    readonly property alias activeInputFocus: textInput.activeFocus
    property alias validator: textInput.validator
    property alias inputMethodHints: textInput.inputMethodHints
    readonly property alias displayText: textInput.text
    property bool editable: true
    property bool hoverEnabled: true
    property int stepSize: 1
    property int from: 0
    property int to: 99
    property int value: 0
    readonly property bool hovered: hoverDetector.containsMouse
                                    || textInput.activeFocus
                                    || upButton.activeFocus
                                    || downButton.activeFocus
    property var textFromValue: function(value, locale) {
        return Number(value).toLocaleString(locale, "f", 0)
    }
    property var valueFromText: function(text, locale) {
        return Number.fromLocaleString(locale, text)
    }
    onValueChanged: textInput.text = textFromValue(value, Qt.locale())

    function increment() {
        let val = value + stepSize;
        if (val <= to)
            value = val
    }
    function decrement() {
        let val = value - stepSize;
        if (val >= from)
            value = val
    }
    function abandonChanges() {
        textInput.text = value
    }

    signal editingFinished

    Keys.onPressed: {
        if (event.key === Qt.Key_Up && textInput.activeFocus) {
            increment()
            event.accepted = true
        } else if (event.key === Qt.Key_Down  && textInput.activeFocus) {
            decrement()
            event.accepted = true
        }
    }

    function forceInputFocus() {
        textInput.forceActiveFocus()
    }

    BorderImage {
        id: bg

        anchors.fill: parent
        property int overflow: 0
        anchors.margins: -overflow

        property int borderSize: 5
        border.left: borderSize
        border.right: borderSize
        border.top: borderSize
        border.bottom: borderSize

        source: "qrc:/assets/ui_components/spinbox/bg.png"
    }

    TextInput {
        id: textInput

        function processText() {
            if (text !== "") {
                root.value = root.valueFromText(text, Qt.locale())
            } else {
                if (0 >= root.from && 0 <= root.to)
                    root.value = 0
                else
                    root.value = root.from
            }
        }

        onAccepted: processText()
        onEditingFinished: {
            root.editingFinished()
            processText()
        }

        anchors.left: root.left
        anchors.right: spinColumn.left
        anchors.verticalCenter: root.verticalCenter

        anchors.leftMargin: 6
        anchors.rightMargin: 3

        focus: true
        font.pixelSize: 12
        text: "0"
        color: "#ffffff"
        selectionColor: "#31CB6E"
        clip: true

        horizontalAlignment: Qt.AlignLeft
        verticalAlignment: Qt.AlignVCenter

        readOnly: !root.editable
        inputMethodHints: Qt.ImhPreferNumbers
        selectByMouse: true

        validator: IntValidator {
            bottom: root.from
            top: root.to
        }
    }

    Column {
        id: spinColumn

        anchors.verticalCenter: root.verticalCenter
        anchors.right: root.right
        anchors.rightMargin: 7

        spacing: 6

        Image {
            source: upButton.pressed ? "qrc:/assets/ui_components/spinbox/value_arrow_active.png"
                                     : "qrc:/assets/ui_components/spinbox/value_arrow.png"
            rotation: 180
            MouseArea {
                id: upButton

                anchors.fill: parent
                anchors.margins: -3
                hoverEnabled: true
                enabled: !root.readOnly
                onClicked: {
                    textInput.forceActiveFocus()
                    root.increment()
                }
            }
        }

        Image {
            source: downButton.pressed ? "qrc:/assets/ui_components/spinbox/value_arrow_active.png"
                                       : "qrc:/assets/ui_components/spinbox/value_arrow.png"
            MouseArea {
                id: downButton

                anchors.fill: parent
                anchors.margins: -3
                hoverEnabled: true
                enabled: !root.readOnly
                onClicked: {
                    textInput.forceActiveFocus()
                    root.decrement()
                }
            }
        }
    }

    MouseArea {
        id: hoverDetector

        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
    }

    StateGroup {
        id: visualStates

        states: [
            State {
                when: root.readOnly || (!textInput.activeFocus && !hoverDetector.containsMouse)
                PropertyChanges {
                    target: bg
                    source: root.stealth ? "" : "qrc:/assets/ui_components/spinbox/bg.png"
                    overflow: 0
                    borderSize: 5
                }
                PropertyChanges {
                    target: spinColumn
                    visible: !root.stealth
                }
            },
            State {
                when: !root.readOnly && !textInput.activeFocus && hoverDetector.containsMouse
                PropertyChanges {
                    target: bg
                    source: "qrc:/assets/ui_components/spinbox/bg_hover.png"
                    overflow: 6
                    borderSize: 11
                }
                PropertyChanges {
                    target: spinColumn
                    visible: true
                }
            },
            State {
                when: !root.readOnly && textInput.activeFocus
                PropertyChanges {
                    target: bg
                    source: "qrc:/assets/ui_components/spinbox/bg_active.png"
                    overflow: 2
                    borderSize: 7
                }
                PropertyChanges {
                    target: spinColumn
                    visible: true
                }
            }
        ]
    }

}
