import QtQuick 2.14
import QtQuick.Controls 2.14

import Helpers 1.0

ToolTip {
    id: root

    FontMetrics {
        id: tooltipFontMetrics

        font: label.font

        function maxLineWidth(text) {
            let lines = text.split('\n');
            let lineWidth = 0;
            for (let i = 0; i < lines.length; ++i) {
                let w = boundingRect(lines[i]).width;
                if (w > lineWidth)
                    lineWidth = w;
            }
            return lineWidth;
        }
    }
    contentWidth: tooltipFontMetrics.maxLineWidth(text)

    background: Rectangle {
        radius: 5

        color: DrawFunctions.veryDarkPanelColor
        border.width: 1
        border.color: DrawFunctions.lightPanelColor
    }

    contentItem: DecoratedLabel {
        id: label

        text: root.text
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.NoWrap
    }
}
