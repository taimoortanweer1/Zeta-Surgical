import QtQuick 2.14
import QtQuick.Controls 2.14

import Styles 1.0
import Themes 1.0

Label {
    property LabelStyle labelStyle: Theme.labelStyle

    topPadding: labelStyle.verticalPadding
    leftPadding: labelStyle.horizontalPadding
    rightPadding: labelStyle.horizontalPadding
    bottomPadding: labelStyle.verticalPadding

    lineHeightMode: Text.FixedHeight
    lineHeight: labelStyle.lineHeight
    font: labelStyle.font
    style: labelStyle.style
    color: labelStyle.color

    horizontalAlignment: labelStyle.horizontalAlignment
    verticalAlignment: labelStyle.verticalAlignment

    opacity: enabled ? 1.0 : 0.5
}
