import QtQuick 2.14
import QtQuick.Controls 2.14

import Helpers 1.0

Popup {
    id: root

    parent: Overlay.overlay

    modal: true

    Overlay.modal: Rectangle {
        color: DrawFunctions.modalOverlayColor
    }

    background: Rectangle{
        color: DrawFunctions.paneColor
        radius: 5
    }
}
