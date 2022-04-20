import QtQuick 2.14
import QtQuick.Layouts 1.14

import Helpers 1.0

FocusScope {
    id: root

    property alias autoScroll: flickable.followInput
    property alias backgroundVisible: bg.visible
    property alias contentHeight: flickable.contentHeight
    property alias readOnly: textArea.readOnly
    property alias text: textArea.text
    property alias textDocument: textArea.textDocument
    property alias textFont: textArea.font
    property alias textFormat: textArea.textFormat

    property alias showLineNumbers: lineNumberBorder.visible

    signal editingFinished

    width: implicitWidth
    height: implicitHeight
    implicitWidth: 654
    implicitHeight: 654

    function clear() {
        textArea.clear()
    }

    onActiveFocusChanged: {
        if(activeFocus)
            textArea.forceActiveFocus()
    }

    BorderImage {
        id: bg

        anchors.fill: flickable
        property int overflow: 5
        anchors.margins: -overflow

        property int borderSize: 5
        border.left: borderSize
        border.right: borderSize
        border.top: borderSize
        border.bottom: borderSize

        source: "qrc:/assets/ui_components/inputfield/bg.png"
    }

    // Border hotspot
    // NOTE: Covers space in margins of flickable
    MouseArea {
        anchors.fill: parent

        onClicked: textArea.handleClick(this, mouse)
    }

    DecoratedFlickable {
        id: flickable

        anchors.fill: parent
        anchors.leftMargin: 10 - flickable.scrollBarThickness
        anchors.rightMargin: 10 - flickable.scrollBarThickness
        anchors.topMargin: 1
        anchors.bottomMargin: 1

        contentWidth: width
        contentHeight: textArea.height + 10
        boundsBehavior: Flickable.StopAtBounds
        clip: true

        // Open Flickable area hotspot
        // NOTE: Covers space between textArea and bottom of contentItem as well as space in margins of textArea
        MouseArea {
            anchors.fill: parent

            onClicked: textArea.handleClick(this, mouse)
        }

        Rectangle {
            id: lineNumberBorder

            anchors.left: lineNumberColumn.left
            anchors.margins: -flickable.scrollBarThickness
            anchors.right: lineNumberColumn.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            visible: false
            color: DrawFunctions.borderColor
        }

        ColumnLayout {
            id: lineNumberColumn

            anchors.left: parent.left
            anchors.top: textArea.top
            anchors.leftMargin: flickable.scrollBarThickness
            spacing: 0

            visible: root.showLineNumbers

            property int lineHeight: Math.floor(textArea.contentHeight / textArea.lineCount)

            Repeater {
                model: textArea.lineCount

                delegate: Item {
                    id: lineNumberDelegate

                    property bool current: textArea.cursorRectangle.y == y

                    Layout.fillWidth: true
                    Layout.fillHeight: false
                    Layout.alignment: Qt.AlignRight

                    height: lineNumberColumn.lineHeight
                    implicitWidth: libeLabel.implicitWidth

                    DecoratedLabel {
                        id: libeLabel

                        anchors.right: parent.right
                        text: lineNumberDelegate.current ? qsTr("<b>%1</b>").arg(index + 1)
                                                         : index + 1
                        color: lineNumberDelegate.current ? DrawFunctions.foregroundColor
                                                          : DrawFunctions.highlightColor
                        font: root.textFont
                    }
                }
            }
        }

        TextEdit {
            id: textArea

            anchors.left: root.showLineNumbers ? lineNumberBorder.right : parent.left
            anchors.right: parent.right
            anchors.leftMargin: flickable.scrollBarThickness
            anchors.rightMargin: flickable.scrollBarThickness
            anchors.top: parent.top
            anchors.topMargin: 5

            focus: true
            selectByMouse: true
            wrapMode: TextEdit.Wrap

            font {
                pixelSize: 12
            }
            color: DrawFunctions.foregroundColor
            selectionColor: DrawFunctions.highlightColor
            clip: true

            function handleClick(mouseArea, mouseInfo) {
                const coordinate = mouseArea.mapToItem(textArea, mouseInfo.x, mouseInfo.y)
                const cursorPosition = textArea.positionAt(coordinate.x, coordinate.y)
                textArea.cursorPosition = cursorPosition
                textArea.forceActiveFocus()
            }

            Keys.onPressed: {
                if (event.key === Qt.Key_Escape) {
                    textArea.focus = false
                } else if (event.key === Qt.Key_Tab) {
                    textArea.insert(textArea.cursorPosition, "    ")
                    event.accepted = true
                }
            }

            onCursorRectangleChanged: {
                if (cursorRectangle.y < flickable.contentY) {
                    flickable.contentY = cursorRectangle.y + textArea.y
                } else if (cursorRectangle.y + cursorRectangle.height
                           >= flickable.contentY + flickable.height) {
                    flickable.contentY = Math.min(cursorRectangle.y + textArea.y + cursorRectangle.height - flickable.height,
                                                  flickable.contentHeight - flickable.height)
                }
            }

            onEditingFinished: root.editingFinished()
        }

        property bool followInput: false
        onContentHeightChanged: {
            if (followInput) {
                textArea.cursorPosition = textArea.positionAt(textArea.width, textArea.height + textArea.y)
            }
        }
    }

    MouseArea {
        id: hoverDetector

        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
    }

    states: [
        // Disabled
        State {
            when: !root.enabled
            PropertyChanges {
                target: bg
                source: "qrc:/assets/ui_components/inputfield/bg_disabled.png"
                overflow: 0
                borderSize: 5
            }
        },
        // Read-Only State
        State {
            when: root.enabled && textArea.readOnly
            PropertyChanges {
                target: bg
                source: "qrc:/assets/ui_components/inputfield/bg.png"
                overflow: 5
                borderSize: 5
            }
        },
        // Default State
        State {
            when: root.enabled && !textArea.readOnly && !textArea.activeFocus && !hoverDetector.containsMouse
            PropertyChanges {
                target: bg
                source: "qrc:/assets/ui_components/inputfield/bg.png"
                overflow: 5
                borderSize: 5
            }
        },
        // Hovered State
        State {
            when: root.enabled && !textArea.readOnly && !textArea.activeFocus && hoverDetector.containsMouse
            PropertyChanges {
                target: bg
                source: "qrc:/assets/ui_components/inputfield/bg_hover.png"
                overflow: 11
                borderSize: 11
            }
        },
        // Active Focus State
        State {
            when: root.enabled && !textArea.readOnly && textArea.activeFocus
            PropertyChanges {
                target: bg
                source: "qrc:/assets/ui_components/inputfield/bg_active.png"
                overflow: 7
                borderSize: 7
            }
        }
    ]
}
