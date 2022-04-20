import QtQuick 2.6
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import Controls 1.0
import Dialogs 1.0
import Helpers 1.0

import GreenHouse.Simulator 1.0

import "editors"

Item {
    id: root

    property int currentObjectWrapperIndex: -1

    EditorSource {
        id: editorSource
    }

    Component {
        id: endpointDelegate

        DecoratedTableItem {
            id: endpointScope

            property QtObject endpointWrapper: modelData

            anchors.left: parent.left
            anchors.right: parent.right

            height: (endpointHandle.expanded ? handlerDataEditor.y + handlerDataEditor.height
                                             : handlerDataEditor.y) + 5
            isAlternate: index % 2 == 0

            Column {
                id: endpointSignature

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: 5
                spacing: 5

                Row {
                    Image {
                        id: endpointHandle

                        anchors.verticalCenter: parent.verticalCenter

                        property bool expanded: false
                        source: expanded ?  "qrc:/GreenHouse/arrow down.png" : "qrc:/GreenHouse/arrow right.png"

                        MouseArea {
                            anchors.fill: parent
                            anchors.margins: -5

                            onClicked: endpointHandle.expanded = !endpointHandle.expanded
                        }
                    }

                    spacing: 5

                    Label {
                        anchors.verticalCenter: parent.verticalCenter
                        text: modelData.name
                        elide: Text.ElideMiddle
                        color: "#FFFFFF"

                        width: endpointSignature.width - endpointHandle.width - callButton.width - remoteCallButton.width - 18
                    }

                    DecoratedButton {
                        id: callButton

                        anchors.verticalCenter: parent.verticalCenter

                        onClicked: {
                            endpointScope.endpointWrapper.call()
                        }
                        text: "Call"
                    }

                    DecoratedButton {
                        id: remoteCallButton

                        anchors.verticalCenter: parent.verticalCenter

                        onClicked: {
                            endpointScope.endpointWrapper.callOverRPC()
                        }
                        text: "Remote Call"
                    }
                }
            }

            Item {
                id: argumentsTable

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: endpointSignature.bottom
                anchors.margins: 10

                height: argumentsView.height

                clip: true

                GridView {
                    id: argumentsView

                    anchors.left: parent.left
                    anchors.right: parent.right

                    height: contentHeight

                    cellWidth: width / 3
                    cellHeight: 35

                    model: endpointScope.endpointWrapper.argumentObjects

                    delegate: Item {
                        id: endpointArgumentScope

                        width: argumentsView.cellWidth
                        height: argumentsView.cellHeight

                        property QtObject argumentWrapper: modelData
                        clip: true

                        Rectangle {
                            id: argumentTypeRect

                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.margins: 5
                            radius: 5
                            color: editorSource.getBackgroundColor(endpointArgumentScope.argumentWrapper.type)
                            width: argumentTypeLabel.width + 10
                            height: argumentTypeLabel.height + 5

                            DecoratedLabel {
                                id: argumentTypeLabel

                                anchors.centerIn: parent
                                font.pixelSize: 12

                                text: {
                                    switch (endpointArgumentScope.argumentWrapper.type) {
                                    case SimulatorObject.Var:
                                        return "Var";
                                    case SimulatorObject.List:
                                        return "List";
                                    case SimulatorObject.Map:
                                        return "Map";
                                    case SimulatorObject.ObjectPtr:
                                        return "ObjectPtr";
                                    case SimulatorObject.ByteArray:
                                        return "ByteArray";
                                    case SimulatorObject.String:
                                        return "String";
                                    case SimulatorObject.TranslatableString:
                                        return "TranslatableString";
                                    case SimulatorObject.Int:
                                        return "Int";
                                    case SimulatorObject.Float:
                                        return "Float"
                                    case SimulatorObject.Double:
                                        return "Double"
                                    case SimulatorObject.Bool:
                                        return "Bool"
                                    case SimulatorObject.Model:
                                        return "Model"
                                    }
                                    return ""
                                }

                                elide: Text.ElideRight
                            }
                        }

                        Label {
                            id: argumentNameLabel

                            anchors.left: argumentTypeRect.right
                            anchors.right: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.margins: 5

                            text: (endpointArgumentScope.argumentWrapper ? endpointArgumentScope.argumentWrapper.name
                                                                        : "") + ": "
                            elide: Text.ElideMiddle
                            horizontalAlignment: Qt.AlignRight
                            color: "#FFFFFF"
                        }

                        FocusScope {
                            id: argumentEditorRoot

                            anchors.left: parent.horizontalCenter
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.margins: 5
                            height: editor ? editor.implicitHeight : 0

                            property Item editor: argumentEditorLoader.item

                            Loader {
                                id: argumentEditorLoader
                                anchors.fill: parent

                                sourceComponent: editorSource.getEditor(endpointArgumentScope.argumentWrapper.type)
                                asynchronous: true
                                onLoaded: {
                                    if (item.target !== undefined)
                                        item.target = endpointArgumentScope.argumentWrapper
                                }
                            }
                        }

                        BorderRectangle {
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                        }

                        BorderRectangle {
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                        }
                    }
                }

                BorderRectangle {
                    anchors.left: argumentsView.left
                    anchors.right: argumentsView.right
                    anchors.top: argumentsView.top
                }

                BorderRectangle {
                    anchors.left: argumentsView.left
                    anchors.right: argumentsView.right
                    anchors.bottom: argumentsView.bottom
                }

                BorderRectangle {
                    anchors.left: argumentsView.left
                    anchors.top: argumentsView.top
                    anchors.bottom: argumentsView.bottom
                }

                BorderRectangle {
                    anchors.right: argumentsView.right
                    anchors.top: argumentsView.top
                    anchors.bottom: argumentsView.bottom
                }
            }

            ScriptEditor {
                id: handlerDataEditor

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: argumentsTable.bottom
                anchors.margins: 10
                height: Math.max(128, contentHeight + 20)

                visible: endpointHandle.expanded

                property bool codeParsed: false
                text: endpointScope.endpointWrapper.handlerCode

                function parseCode() {
                    endpointScope.endpointWrapper.installHanlder(null)
                    codeParsed = false
                    var handler = Qt.createQmlObject(
                    "import QtQuick 2.0\n"
                    + "import GreenHouse.Simulator 1.0\n"
                    + "import ScriptModules 1.0\n"
                    + "ScriptableObject {\n"
                        + "property QtObject endpoint: null\n"
                        + "function execute(args) {\n"
                            + "self.clearTimers()\n"
                            + text
                        + "\n}"
                    + "\n}", handlerDataEditor)

                    if (handler) {
                        handler.self = endpointScope.endpointWrapper
                        handler.endpoint = endpointScope.endpointWrapper
                        endpointScope.endpointWrapper.installHanlder(handler)
                        endpointScope.endpointWrapper.handlerCode = text
                        codeParsed = true
                    } else {
                        endpointScope.endpointWrapper.installHanlder(null)
                    }
                }

                onEditingFinished: {
                    if (endpointScope.endpointWrapper.handlerCode !== text)
                        parseCode()
                }
            }

            Component.onCompleted: handlerDataEditor.parseCode()
        }
    }

    Item {
        anchors.fill: parent

        DecoratedFlickable {
            id: objFlickable

            anchors.left: parent.left
            anchors.right: splitter.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            clip: true
            boundsBehavior: Flickable.StopAtBounds
            contentWidth: width
            contentHeight: objTab.height

            Column {
                id: objTab

                Repeater {
                    id: objRepeater

                    model: Simulator.objects
                    delegate: DecoratedTableItem {
                        width: objFlickable.width
                        height: objNameLabel.height + 11

                        property QtObject objectWrapper: modelData
                        selected: root.currentObjectWrapperIndex === index
                        isAlternate: index % 2 == 0
                        onPressed: root.currentObjectWrapperIndex = index

                        Label {
                            id: objNameLabel

                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.margins: 5

                            text: modelData.name
                            elide: Text.ElideMiddle
                        }
                    }
                    onCountChanged: {
                        if (count > 0)
                            root.currentObjectWrapperIndex = 0
                        else
                            root.currentObjectWrapperIndex = -1
                    }
                }
            }
        }

        StackLayout {
            id: editorStack

            anchors.left: splitter.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            currentIndex: root.currentObjectWrapperIndex

            Repeater {
                id: tabsRepeater
                model: Simulator.objects
                delegate: Item {
                    id: objectViewer

                    property QtObject objectWrapper: modelData
                    property real tabsWidth: objectViewerPagePicker.width

                    implicitHeight: editorStack.height
                    implicitWidth: editorStack.width

                    Item {
                        id: filterItem
                        anchors.top: parent.top
                        anchors.bottom: objectViewerPagePicker.bottom
                        anchors.right: parent.right
                        anchors.left: objectViewerPagePicker.right
                        visible: objectViewerLayout.currentIndex == 2 //for Properties only

                        Label {
                            font: filterInput.font
                            text: qsTr("< property filter >")
                            horizontalAlignment: Text.horizontalCenter
                            anchors.centerIn: filterInput
                            visible: !filterInput.activeFocus && filterInput.text == ""
                        }

                        StringEditor {
                            id: filterInput
                            anchors.fill: parent
                            anchors.margins: 3
                            text: Simulator.objectNameFilter
                            onEditingFinished: {
                                Simulator.objectNameFilter = text
                            }
                        }

                        Image {
                            source: "qrc:/GreenHouse/star.png"
                            opacity: Simulator.favoritesOnly ? 1 : 0.3
                            anchors.right: parent.right
                            anchors.rightMargin: 5
                            anchors.verticalCenter: parent.verticalCenter
                            width: 20
                            height: width
                            MouseArea {
                                anchors.fill: parent
                                onClicked: Simulator.favoritesOnly = !Simulator.favoritesOnly
                            }
                        }
                    }

                    TabButtonRow {
                        id: objectViewerPagePicker
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top

                        currentTab: objectViewerLayout.currentIndex
                        tabModel: ListModel {
                            ListElement { tabName: "Methods"; }
                            ListElement { tabName: "Events"; }
                            ListElement { tabName: "Properties"; }
                            ListElement { tabName: "Object setup"; }
                        }
                        onTabRequested: objectViewerLayout.currentIndex = tab
                    }

                    StackLayout {
                        id: objectViewerLayout

                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: objectViewerPagePicker.bottom
                        anchors.bottom: parent.bottom

                        currentIndex: {
                            if (objectViewer.objectWrapper) {
                                if (objectViewer.objectWrapper.objectMethods.length > 0)
                                    return 0;
                                if (objectViewer.objectWrapper.objectEvents.length > 0)
                                    return 1;
                            }
                            return  2;
                        }

                        DecoratedFlickable {
                            id: methodsView

                            implicitHeight: objectViewerLayout.height
                            implicitWidth: objectViewerLayout.width

                            boundsBehavior: Flickable.StopAtBounds

                            clip: true
                            contentWidth: width
                            contentHeight: methodsColumn.height

                            Column {
                                id: methodsColumn

                                anchors.left: parent.left
                                anchors.right: parent.right

                                Repeater {
                                    id: methodRepeater

                                    model: objectViewer.visible && objectViewer.objectWrapper ? objectViewer.objectWrapper.objectMethods : null
                                    delegate: endpointDelegate
                                }
                            }
                        }

                        DecoratedFlickable {
                            id: eventView

                            implicitHeight: objectViewerLayout.height
                            implicitWidth: objectViewerLayout.width

                            boundsBehavior: Flickable.StopAtBounds

                            clip: true
                            contentWidth: width
                            contentHeight: eventColumn.height

                            Column {
                                id: eventColumn

                                anchors.left: parent.left
                                anchors.right: parent.right

                                Repeater {
                                    id: eventRepeater

                                    model: objectViewer.objectWrapper ? objectViewer.objectWrapper.objectEvents : null
                                    delegate: endpointDelegate
                                }
                            }
                        }

                        DecoratedFlickable {
                            id: propertyView

                            implicitHeight: objectViewerLayout.height
                            implicitWidth: objectViewerLayout.width

                            boundsBehavior: Flickable.StopAtBounds

                            clip: true
                            contentWidth: width
                            contentHeight: propertyColumn.height

                            Column {
                                id: propertyColumn

                                anchors.left: parent.left
                                anchors.right: parent.right

                                Repeater {
                                    id: propertyRepeater

                                    model: objectViewer.objectWrapper ? objectViewer.objectWrapper.objectProperties : null
                                    delegate: DecoratedTableItem {
                                        id: propertyScope

                                        property QtObject propertyWrapper: modelData

                                        anchors.left: parent.left
                                        anchors.right: parent.right

                                        height: onChangedDataEditor.y + (onChangedDataEditor.visible ? onChangedDataEditor.height : 0) + 5
                                        isAlternate: index % 2 == 0

                                        Image {
                                            id: propertyHandle

                                            anchors.left: parent.left
                                            anchors.top: parent.top
                                            anchors.margins: 12

                                            property bool expanded: false
                                            source: expanded ? "qrc:/GreenHouse/arrow down.png" : "qrc:/GreenHouse/arrow right.png"

                                            MouseArea {
                                                anchors.fill: parent
                                                anchors.margins: -5

                                                onClicked: propertyHandle.expanded = !propertyHandle.expanded
                                            }
                                        }

                                        Rectangle {
                                            id: typeRect

                                            anchors.verticalCenter: propertyNameLabel.verticalCenter
                                            anchors.left: propertyHandle.right
                                            anchors.margins: 5
                                            radius: 5
                                            color: editorSource.getBackgroundColor(propertyScope.propertyWrapper.type)
                                            width: propertyTypeLabel.width + 10
                                            height: propertyTypeLabel.height + 5

                                            Row {
                                                id: propertyTypeLabel

                                                anchors.centerIn: parent
                                                spacing: 5

                                                DecoratedLabel {
                                                    anchors.verticalCenter: parent.verticalCenter
                                                    font.pixelSize: 12

                                                    text: {
                                                        switch (propertyScope.propertyWrapper.type) {
                                                        case SimulatorObject.Var:
                                                            return "Var";
                                                        case SimulatorObject.List:
                                                            return "List";
                                                        case SimulatorObject.Map:
                                                            return "Map";
                                                        case SimulatorObject.ObjectPtr:
                                                            return "ObjectPtr";
                                                        case SimulatorObject.ByteArray:
                                                            return "ByteArray";
                                                        case SimulatorObject.String:
                                                            return "String";
                                                        case SimulatorObject.TranslatableString:
                                                            return "TranslatableString";
                                                        case SimulatorObject.Int:
                                                            return "Int";
                                                        case SimulatorObject.Float:
                                                            return "Float"
                                                        case SimulatorObject.Double:
                                                            return "Double"
                                                        case SimulatorObject.Bool:
                                                            return "Bool"
                                                        case SimulatorObject.Model:
                                                            return "Model"
                                                        }
                                                        return ""
                                                    }

                                                    elide: Text.ElideRight
                                                }

                                                Image {
                                                    anchors.verticalCenter: parent.verticalCenter
                                                    visible: propertyScope.propertyWrapper && propertyScope.propertyWrapper.readOnly
                                                    source: "qrc:/assets/ui_components/readonly.png"
                                                }
                                            }
                                        }

                                        Label {
                                            id: propertyNameLabel

                                            anchors.left: typeRect.right
                                            anchors.right: parent.horizontalCenter
                                            anchors.verticalCenter: propertyHandle.verticalCenter
                                            anchors.margins: 5

                                            text: propertyScope.propertyWrapper ? propertyScope.propertyWrapper.name
                                                                                : ""
                                            elide: Text.ElideMiddle
                                            color: "#FFFFFF"
                                        }

                                        FocusScope {
                                            id: propertyEditorRoot

                                            anchors.left: parent.horizontalCenter
                                            anchors.right: propertyFavCheck.left
                                            anchors.top: parent.top
                                            anchors.margins: 5
                                            height: editor ? editor.implicitHeight : 0

                                            property Item editor: propertyEditorLoader.item

                                            Loader {
                                                id: propertyEditorLoader
                                                anchors.fill: parent

                                                sourceComponent: editorSource.getEditor(propertyScope.propertyWrapper.type)
                                                asynchronous: true
                                                onLoaded: {
                                                    if (item.target !== undefined)
                                                        item.target = propertyScope.propertyWrapper
                                                }
                                            }
                                        }

                                        Image {
                                            id: propertyFavCheck
                                            source: "qrc:/GreenHouse/star.png"
                                            opacity: propertyScope.propertyWrapper.isFavorite ? 1 : 0.3
                                            anchors.right: parent.right
                                            anchors.rightMargin: 8
                                            anchors.verticalCenter: propertyNameLabel.verticalCenter

                                            width: 20
                                            height: width
                                            MouseArea {
                                                anchors.fill: parent
                                                onClicked: {
                                                    propertyScope.propertyWrapper.isFavorite = !propertyScope.propertyWrapper.isFavorite
                                                    Simulator.saveFavorites()
                                                }
                                            }
                                        }

                                        Label {
                                            id: onChangedLabel

                                            anchors.left: parent.left
                                            anchors.top: propertyNameLabel.bottom
                                            anchors.margins: 15

                                            text: qsTr("On value changed")
                                            color: "#FFFFFF"
                                            visible: propertyHandle.expanded
                                        }

                                        ScriptEditor {
                                            id: onChangedDataEditor

                                            anchors.left: onChangedLabel.right
                                            anchors.right: parent.right
                                            anchors.top: propertyNameLabel.bottom
                                            anchors.margins: 12
                                            height: contentHeight + 20

                                            visible: propertyHandle.expanded

                                            property bool codeParsed: false
                                            text: propertyScope.propertyWrapper.handlerCode

                                            function parseCode() {
                                                propertyScope.propertyWrapper.installHanlder(null)
                                                codeParsed = false
                                                var handler = Qt.createQmlObject(
                                                "import QtQuick 2.0\n"
                                                + "import GreenHouse.Simulator 1.0\n"
                                                + "import ScriptModules 1.0\n"
                                                + "ScriptableObject {\n"
                                                    + "property QtObject property: null\n"
                                                    + "function execute(value) {\n"
                                                        + "self.clearTimers()\n"
                                                        + text
                                                    + "\n}"
                                                + "\n}", onChangedDataEditor)

                                                if (handler) {
                                                    handler.self = objectViewer.objectWrapper
                                                    handler.property = propertyScope.propertyWrapper
                                                    propertyScope.propertyWrapper.installHanlder(handler)
                                                    propertyScope.propertyWrapper.handlerCode = text
                                                    codeParsed = true
                                                } else {
                                                    propertyScope.propertyWrapper.installHanlder(null)
                                                }
                                            }

                                            onEditingFinished: {
                                                if (propertyScope.propertyWrapper.handlerCode !== text)
                                                    parseCode()
                                            }
                                        }
                                        Component.onCompleted: onChangedDataEditor.parseCode()
                                    }
                                }
                            }
                        }

                        Item {
                            id: setupView

                            implicitHeight: objectViewerLayout.height
                            implicitWidth: objectViewerLayout.width

                            ScriptEditor {
                                id: setupScriptEdit

                                anchors.fill: parent
                                anchors.margins: 10

                                property bool codeParsed: false
                                text: objectViewer.objectWrapper.handlerCode

                                function parseCode() {
                                    objectViewer.objectWrapper.installHanlder(null)
                                    codeParsed = false
                                    var handler = Qt.createQmlObject(
                                    "import QtQuick 2.0\n"
                                    + "import GreenHouse.Simulator 1.0\n"
                                    + "import ScriptModules 1.0\n"
                                    + "ScriptableObject {\n"
                                        + "id: handlerRoot\n"
                                        + "function init() {\n"
                                            + "self.clearTimers()\n"
                                            + text
                                        + "\n}"
                                    + "\n}", setupScriptEdit)

                                    if (handler) {
                                        handler.self = objectViewer.objectWrapper
                                        objectViewer.objectWrapper.installHanlder(handler)
                                        objectViewer.objectWrapper.handlerCode = text
                                        handler.init()
                                        codeParsed = true
                                    } else {
                                        objectViewer.objectWrapper.installHanlder(null)
                                    }
                                }

                                onEditingFinished: {
                                    if (objectViewer.objectWrapper.handlerCode !== text)
                                        parseCode()
                                }
                            }
                            Component.onCompleted: setupScriptEdit.parseCode()
                        }
                    }

                    BorderRectangle {
                        id: objectViewerLayoutBorder

                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: objectViewerPagePicker.bottom
                        height: 1

                        color: DrawFunctions.borderColor
                    }
                }
            }
        }

        Splitter {
            id: splitter

            preferredInitialPosition: 250
            minimumPosition: 200
            maximumPosition: 400

            anchors.top: parent.top
            anchors.bottom: parent.bottom

            orientation: Qt.Horizontal
        }
    }
}
