import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Window 2.14

import Helpers 1.0

ComboBox {
    id: root

    property string sectionProperty: ""
    property Component sectionDelegate
    property bool stealth: false
    implicitHeight: 24
    height: implicitHeight

    background: BorderImage {
        anchors.fill: parent
        anchors.margins: -overflow

        property int overflow: {
            if (root.activeFocus)
                return 2
            if (root.hovered)
                return 4
            return 0
        }

        source: {
            if (root.activeFocus)
                return "qrc:/assets/ui_components/combobox/active_background.png"
            if (root.hovered)
                return "qrc:/assets/ui_components/combobox/hovered_background.png"
            if (root.stealth)
                return ""
            return "qrc:/assets/ui_components/combobox/background.png"
        }
        border.left: 5 + overflow
        border.right: 5 + overflow
        border.top: 5 + overflow
        border.bottom: 5 + overflow
    }

    hoverEnabled: true
    enabled: count > 0

    contentItem: DecoratedLabel {
        anchors.fill: parent
        anchors.leftMargin: 8
        anchors.rightMargin: 26

        text: root.count === 0 ? qsTr("No Selection Options Available.") : root.displayText
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
    }

    indicator: Image {
        anchors.right: parent ? parent.right : undefined
        anchors.top: parent ? parent.top : undefined
        anchors.rightMargin: 11
        anchors.topMargin: 10

        source: "qrc:/assets/ui_components/combobox/icon.png"
    }

    Popup {
        id: comboboxPopup

        y: root.height
        width: root.width
        topMargin: 15
        bottomMargin: 15

        background: BorderImage {
            anchors.fill: parent

            source: "qrc:/assets/ui_components/combobox/background.png"
            border.left: 5
            border.right: 5
            border.top: 5
            border.bottom: 5
        }

        contentItem: ListView {
            id: lv

            anchors.centerIn: parent
            width: root.width - 10
            implicitHeight: contentHeight

            model: root.delegateModel
            delegate: root.delegate

            boundsBehavior: ListView.StopAtBounds
            clip: true
            section.property: root.sectionProperty
            section.delegate: root.sectionDelegate
            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }
    popup: comboboxPopup

    states: [
        State {
            when: !enabled
            PropertyChanges {target: root; opacity: 0.75}
        },
        State {
            when: enabled
            PropertyChanges {target: root; opacity: 1.0}
        }
    ]
}
