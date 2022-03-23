import QtQuick 2.0
import GreenHouse.Theming 1.0

//PREVIEW IMAGE qrc:/DefaultComponentSet/PreviewAssets/Label.png
Flickable {
    id: root

    width: 256
    height: 48

    // Toggles vertical scrolling for the cases when only horizontal scrolling is desired.
    // Text wrapping disables horizontal scrolling implicitly.
    property bool scrollVertically: true

    property bool stopAtBounds: false

    //TRANSLATABLE
    property alias text: label.text
    //FONT textFont
    property alias font: label.font
    //COLOR textColor
    property alias textColor: label.textColor
    //COLOR transparent
    property alias backgroundColor: label.backgroundColor

    //TEXTELIDEM 3
    property alias elide: label.elide
    //TEXTHAL 1
    property alias horizontalAlignment: label.horizontalAlignment
    property alias lineCount: label.lineCount
    //REAL 1.0
    property alias lineHeight: label.lineHeight
    //TEXTLINEHM 0
    property alias lineHeightMode: label.lineHeightMode
    property alias linkColor: label.linkColor
    property alias maximumLineCount: label.maximumLineCount
    property alias minimumPixelSize: label.minimumPixelSize
    property alias minimumPointSize: label.minimumPointSize
    property alias paintedWidth: label.paintedWidth
    property alias paintedHeight: label.paintedHeight
    property alias renderType: label.renderType
    //TEXTWRAPM 0
    property alias wrapMode: label.wrapMode
    //TEXTVAL 32
    property alias verticalAlignment: label.verticalAlignment
    property alias richText: label.richText

    property int leftPadding: 0
    property int rightPadding: 0

    contentWidth: label.wrapMode === Text.NoWrap ? label.implicitWidth + leftPadding : width
    contentHeight: root.scrollVertically ? label.implicitHeight : height
    boundsBehavior: stopAtBounds ? Flickable.StopAtBounds : Flickable.DragAndOvershootBounds
    interactive: true
    clip: true

    default property alias labelContents: label.data
    Label {
        id: label

        anchors.fill: parent
        anchors.leftMargin: root.leftPadding
        anchors.rightMargin: root.rightPadding
    }
}
