import QtQuick 2.6
import QtQuick.Controls 2.14

import Controls 1.0
import Helpers 1.0

import GreenHouse.Simulator 1.0

DecoratedTextArea {
    id: root

    property alias jsonHighlighter: highlighter.jsonHighlighter

    textFont.family: "Inconsolata"
    textFont.pixelSize: 14
    showLineNumbers: true

    ScriptSyntaxHighlighter {
        id: highlighter

        scriptDocument: root.textDocument
    }
}
