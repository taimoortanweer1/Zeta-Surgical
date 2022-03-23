import QtQuick 2.14
import QtQuick.Controls 2.14

import Styles 1.0
import Themes 1.0
import Helpers 1.0

FocusScope {
    id: root

    width: implicitWidth
    height: implicitHeight
    implicitWidth: 654
    implicitHeight: textContainer.implicitHeight

    property TextFieldStyle textFieldStyle: Theme.textFieldStyle

    property alias validator: textInput.validator
    property alias inputMethodHints: textInput.inputMethodHints
    property alias echoMode: textInput.echoMode
    property alias text: textInput.text
    property alias readOnly: textInput.readOnly
    readonly property alias font: textInput.font
    property alias inputFocus: textInput.focus
    readonly property alias inputActiveFocus: textInput.activeFocus
    property alias placeholderText: placeholder.text
    readonly property bool hovered: hoverDetector.containsMouse
                                    || textInput.activeFocus
                                    || clearButton.activeFocus

    readonly property int fontPixelSize: textInput.font.pixelSize

    property bool searchInput: false
    property bool stealth: false

    signal accepted
    signal canceled
    signal editingFinished

    function clear() {
        textInput.clear()
    }

    function mouseDoubleClicked(x, y) {
        root.forceActiveFocus()
        const position = textInput.positionAt(x, y)
        textInput.cursorPosition = position
        textInput.ensureVisible(position)
    }

    function forceActiveFocus() {
        focus = true
        textInput.focus = true
        textInput.forceActiveFocus()
    }

    onCanceled: textInput.focus = false

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

        source: "qrc:/assets/ui_components/inputfield/bg.png"
    }

    MouseArea {
        anchors.top: root.top
        anchors.left: root.left
        anchors.right: clearButton.visible ? clearButton.left : root.right
        anchors.bottom: root.bottom

        onClicked: {
            const coordinate = mapToItem(textInput, mouse.x, mouse.y)
            const position = textInput.positionAt(coordinate.x, coordinate.y)
            root.forceActiveFocus()
            textInput.moveCursorSelection(position)
            textInput.deselect()
            textInput.ensureVisible(position)
        }
    }

    Item {
        id: textContainer

        anchors {
            left: root.left
            right: clearButton.visible ? clearButton.left : root.right
            verticalCenter: root.verticalCenter
            leftMargin: textInput.leftPadding
            rightMargin: textInput.rightPadding
        }

        implicitHeight: root.textFieldStyle.lineHeight + 2 * root.textFieldStyle.verticalPadding

        clip: true

        DecoratedLabel {
            id: placeholder

            anchors.left: textInput.left
            anchors.right: textInput.right
            anchors.verticalCenter: parent ? parent.verticalCenter : undefined

            labelStyle: root.textFieldStyle.placeholderTextLabelStyle

            horizontalAlignment: Label.AlignLeft
            verticalAlignment: Label.AlignVCenter

            elide: Text.ElideRight

            visible: textInput.text.length < 1
            text: root.searchInput ? qsTr("Search") : ""
        }

        TextInput {
            id: textInput

            anchors {
                left: textContainer.left
                right: textContainer.right
                verticalCenter: textContainer.verticalCenter
                leftMargin: -textInput.leftPadding
                rightMargin: -textInput.rightPadding
            }

            height: topPadding + bottomPadding + root.textFieldStyle.lineHeight

            topPadding: root.textFieldStyle.verticalPadding
            leftPadding: root.textFieldStyle.horizontalPadding
            rightPadding: clearButton.visible ? (0.4 * root.textFieldStyle.horizontalPadding) : root.textFieldStyle.horizontalPadding
            bottomPadding: root.textFieldStyle.verticalPadding

            horizontalAlignment: Qt.AlignLeft
            verticalAlignment: Qt.AlignVCenter

            font: root.textFieldStyle.font
            color: root.textFieldStyle.color
            selectionColor: root.textFieldStyle.selectionColor

            clip: true
            focus: true

            selectByMouse: true

            Keys.onEscapePressed: root.canceled()

            onAccepted: root.accepted()

            onEditingFinished: root.editingFinished()
        }
    }

    Image {
        id: clearButton

        anchors {
            verticalCenter: root.verticalCenter
            right: root.right
            rightMargin: 8
        }

        visible: root.searchInput
        source: textInput.text !== "" ? Qt.resolvedUrl("qrc:/assets/ui_components/inputfield/clear.png")
                                      : Qt.resolvedUrl("qrc:/assets/ui_components/inputfield/search.png")

        MouseArea {
            anchors.fill: parent
            onClicked: textInput.clear()
        }
    }

    MouseArea {
        id: hoverDetector

        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
    }

    states: [
        State {
            when: textInput.readOnly
            PropertyChanges {
                target: bg
                source: Qt.resolvedUrl("qrc:/assets/ui_components/inputfield/bg_disabled.png")
                overflow: 0
                borderSize: 5
            }
        },
        State {
            when: !textInput.readOnly && !textInput.activeFocus && !hoverDetector.containsMouse
            PropertyChanges {
                target: bg
                source: root.stealth ? "" : Qt.resolvedUrl("qrc:/assets/ui_components/inputfield/bg.png")
                overflow: 0
                borderSize: 5
            }
        },
        State {
            when: !textInput.readOnly && !textInput.activeFocus && hoverDetector.containsMouse
            PropertyChanges {
                target: bg
                source: Qt.resolvedUrl("qrc:/assets/ui_components/inputfield/bg_hover.png")
                overflow: 6
                borderSize: 11
            }
        },
        State {
            when: !textInput.readOnly && textInput.activeFocus
            PropertyChanges {
                target: bg
                source: Qt.resolvedUrl("qrc:/assets/ui_components/inputfield/bg_active.png")
                overflow: 2
                borderSize: 7
            }
        }
    ]
}
