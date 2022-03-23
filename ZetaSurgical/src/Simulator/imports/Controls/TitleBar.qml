import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.14

import Styles 1.0
import Themes 1.0


Pane {
    id: root

    property TitleBarStyle titleBarStyle: Theme.titleBarStyle

    property alias title: titleBarLabel.text

    signal closeButtonClicked

    horizontalPadding: root.titleBarStyle.horizontalPadding
    verticalPadding: root.titleBarStyle.verticalPadding

    Material.background: root.titleBarStyle.backgroundColor
    Material.foreground: root.titleBarStyle.title.color

    background: Item {
        implicitWidth: 100
        implicitHeight: root.implicitHeight

        clip: true

        Rectangle {
            anchors.fill: parent
            anchors.bottomMargin: -parent.height

            radius: root.titleBarStyle.borderRadius
            color: Material.backgroundColor
        }
    }

    RowLayout {
        anchors.fill: parent

        DecoratedLabel {
            id: titleBarLabel
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            Layout.fillWidth: true
            Layout.fillHeight: true

            labelStyle: root.titleBarStyle.title

            horizontalAlignment: Label.AlignLeft
            verticalAlignment: Label.AlignVCenter
            wrapMode: Label.NoWrap
            elide: Label.ElideRight
        }

        CloseButton {
            id: closeButton
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumWidth: implicitWidth
            Layout.minimumWidth: implicitWidth

            visible: root.titleBarStyle.closeButtonVisible
            onClicked: root.closeButtonClicked()
        }
    }
}
