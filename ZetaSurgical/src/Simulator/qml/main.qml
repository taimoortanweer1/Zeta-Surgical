import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import Controls 1.0
import Dialogs 1.0
import Helpers 1.0

import GreenHouse.Simulator 1.0

import "editors"

ApplicationWindow {
    id: root

    visible: true
    title: "GreenHouse Simulator" + (Simulator.name !== "" ? " [" + Simulator.name + "]" : "")

    minimumWidth: 800
    minimumHeight: 600
    width: 1280
    height: 720

    property int currentObjectWrapperIndex: -1

    DecoratedDialog {
        id: replayingDialog

        anchors.centerIn: parent
        closePolicy: Popup.NoAutoClose
        title: qsTr("Replay in progress")

        BusyIndicator {
            anchors.centerIn: parent
            running: replayingDialog.visible
        }

        Connections {
            target: Simulator
            function onSessionReplayActiveChanged() {
                if (Simulator.sessionReplayActive)
                    replayingDialog.open()
                else
                    replayingDialog.close()
            }
        }
    }

    DecoratedDialog {
        id: screenShotDialog

        x: 5
        y: 5
        width: parent.width - 10
        height: parent.height - 10

        title: qsTr("Screenshot captured")

        Image {
            id: screenShotImage

            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }

        ProgressBar {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            visible: Simulator.totalScreenShots > 0
            to: Simulator.totalScreenShots
            value: Simulator.totalScreenShots - Simulator.pendingScreenShots
        }

        Connections {
            target: Simulator
            function onScreenCaptured(path) {
                if (Simulator.sessionReplayActive)
                    return
                screenShotImage.source = "file:/" + path
                screenShotDialog.open()
            }
        }
    }

    DecoratedDialog {
        id: uiStringRegistryDialog

        x: 5
        y: 5
        width: parent.width - 10
        height: parent.height - 10

        title: qsTr("Ui Report")
        leftPadding: 5
        rightPadding: 5

        ColumnLayout {
            anchors.fill: parent
            spacing: 5

            LayerTable {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.minimumHeight: implicitHeight
            }

            UiTextTable {
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }

        Connections {
            target: Simulator
            function onUiTextRegistryReceived(registry) {
                if (Simulator.sessionReplayActive)
                    return
                uiStringRegistryDialog.open()
            }
        }

    }

    DecoratedDialog {
        id: serviceMismatchDialog

        title: qsTr("Application server mismatch")

        anchors.centerIn: parent

        DecoratedLabel {
            id: serviceMismatch
            padding: 10
        }

        Connections {
            target: Simulator
            function onServiceMismatchDetected(serviceName, expectedServiceName) {
                if (Simulator.name !== "") {
                    serviceMismatch.text = qsTr(
                                "Remote application connection terminated due a server mismatch.\n\nExpected: %1\nReported: %2")
                    .arg(expectedServiceName).arg(serviceName)
                    serviceMismatchDialog.open()
                }
            }
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "#484848"
    }

    footer: Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right

        visible: !Simulator.initializing
        height: Math.max(protEditor.height, protLabel.height) + 16
        color: "#484848"

        Label {
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 5
            anchors.bottomMargin: 2

            font.pixelSize: 10
            text: Simulator.version
        }

        Label {
            id: urlLabel

            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 5

            text: "Application IP:"
            color: "white"
        }

        StringEditor {
            id: urlEditor

            anchors.left: urlLabel.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 5
            width: 128

            text: Simulator.serverUrl
            onTextChanged: Simulator.serverUrl = text
        }

        Label {
            id: protLabel

            anchors.left: urlEditor.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 5

            text: "Application port:"
            color: "white"
        }

        IntEditor {
            id: protEditor

            anchors.left: protLabel.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 5
            width: 128

            value: Simulator.serverPort
            from: Simulator.serverPortMin
            to: Simulator.serverPortMax

            onValueChanged: Simulator.serverPort = value
        }

        Rectangle {
            id: connectionIndicator

            anchors.right: parent.right
            anchors.top: parent.top
            anchors.margins: 9

            width: 10
            height: width
            radius: width/2

            color: Simulator.activeConnections > 0 ? "#a8f001" : "darkGray"
        }

        Label {
            id: connectionStatusLabel

            anchors.right: connectionIndicator.left
            anchors.verticalCenter: connectionIndicator.verticalCenter
            anchors.margins: 5

            text: {
                if(Simulator.activeConnections > 0)
                    return "Connected to application"
                if (!Simulator.generic || Simulator.name !== "")
                    return "Attempting to connect to application..."
                return "Idle"
            }
            color: "white"
        }

        BorderRectangle {
            id: footerBorder

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            height: 1

            color: DrawFunctions.borderColor
        }
    }

    menuBar: MenuBar {
        visible: Simulator.generic && !Simulator.initializing

        DecoratedMenu {
            title: qsTr("Project")

            MenuItem {
                text: qsTr("Open Project")

                onClicked: loadProjectDialog.open()

                FileDialog {
                    id: loadProjectDialog

                    title: qsTr("Please choos a GreenHouse project to load.")
                    nameFilters: [ "GreenHouse project file (*.ghsm)" ]
                    selectExisting: true

                    onAccepted: {
                        Simulator.loadProject(file)
                    }
                }
            }

            MenuItem {
                text: qsTr("Close Project")

                enabled: Simulator.name !== ""
                onClicked: Simulator.loadProject("")
            }
        }
    }

    header: Rectangle {
        id: simulatorHeader

        property int headerButtonSize: 48

        anchors.left: parent.left
        anchors.right: parent.right

        height: logo.height + 10
        color: "#484848"

        visible: !Simulator.initializing

        Image {
            id: logo

            anchors.right: parent.right
            anchors.margins: 10
            anchors.verticalCenter: parent.verticalCenter

            source: "qrc:/GreenHouse/GHLogo.png"
        }

        Row {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 15
            spacing: 15

            DecoratedButton {
                id: uiStringReport

                height: simulatorHeader.headerButtonSize
                width: simulatorHeader.headerButtonSize

                Image {
                    anchors.centerIn: parent
                    width: 0.7*parent.width
                    height: 0.7*parent.height
                    source: "qrc:/assets/ui_components/uitext.png"
                    fillMode: Image.PreserveAspectFit
                }

                enabled: Simulator.activeConnections > 0 && Simulator.name !== ""
                onClicked: Simulator.requestUIStringRegistry()
            }

            DecoratedButton {
                id: screenshotButton

                height: simulatorHeader.headerButtonSize
                width: simulatorHeader.headerButtonSize

                Image {
                    anchors.centerIn: parent
                    width: 0.7*parent.width
                    height: 0.7*parent.height
                    source: "qrc:/assets/ui_components/screenshot.png"
                    fillMode: Image.PreserveAspectFit
                }

                enabled: Simulator.activeConnections > 0 && Simulator.name !== ""
                onClicked: Simulator.captureScreen()
            }

            DecoratedButton {
                id: screenshotsButton

                height: simulatorHeader.headerButtonSize
                width: simulatorHeader.headerButtonSize

                Image {
                    anchors.centerIn: parent
                    width: 0.7*parent.width
                    height: 0.7*parent.height
                    source: "qrc:/assets/ui_components/screenshots.png"
                    fillMode: Image.PreserveAspectFit
                }

                visible: Simulator.generic
                enabled: Simulator.activeConnections > 0 && Simulator.name !== "" && !Simulator.sessionRecordingActive
                onClicked: Simulator.captureScreens()
            }
        }

        BorderRectangle {
            id: menuBorderTop

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            height: 1

            color: DrawFunctions.borderColor
        }

        BorderRectangle {
            id: menuBorderBottom

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: 1

            color: DrawFunctions.borderColor
        }
    }

    TabButtonRow {
        id: pagePicker
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        tabModel: Simulator.tabList
        currentTab: mainLayout.currentIndex

        tabButtonDelegate: TabRowButton {
            text: modelData
            current: pagePicker.currentTab === index
            onTriggered: Simulator.activeTab = index
        }
    }

    StackLayout {
        id: mainLayout

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: pagePicker.bottom
        anchors.bottom: parent.bottom

        currentIndex: Simulator.activeTab

        BackendPage {
            currentObjectWrapperIndex: root.currentObjectWrapperIndex
            implicitHeight: mainLayout.height
            implicitWidth: mainLayout.width
        }

        ActionScriptsPage {
            id: actionScriptsView

            implicitHeight: mainLayout.height
            implicitWidth: mainLayout.width
        }

        DecoratedListView {
            id: themeView

            implicitHeight: mainLayout.height
            implicitWidth: mainLayout.width

            clip: true
            boundsBehavior: Flickable.StopAtBounds

            model: Simulator.availableThemes
            delegate: DecoratedTableItem {
                anchors.left: parent.left
                anchors.right: parent.right

                height: Math.max(themeNameLabel.height, activateThemeButton.height) + 10
                isAlternate: index % 2 == 0

                Label {
                    id: themeNameLabel

                    anchors.left: parent.left
                    anchors.right: activateThemeButton.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.margins: 5

                    text: modelData
                    elide: Text.ElideMiddle
                    color: "#FFFFFF"
                }

                DecoratedButton {
                    id: activateThemeButton

                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.margins: 5

                    text: "\u2714"
                    onClicked: Simulator.activateTheme(modelData)
                }
            }
            onCountChanged: positionViewAtEnd()
        }

        RecordAndReplayPage {

            implicitHeight: mainLayout.height
            implicitWidth: mainLayout.width
        }

        DataSamplingPage {
            id: dataSampling

            implicitHeight: mainLayout.height
            implicitWidth: mainLayout.width
        }

        Repeater {
            model: Simulator.extraPageList
            delegate: Loader {
                width: mainLayout.width
                height: mainLayout.height

                source: modelData
            }
        }
    }

    BorderRectangle {
        id: mainLayoutBottom

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: pagePicker.bottom
        height: 1

        color: DrawFunctions.borderColor
    }

    Rectangle {
        anchors.fill: parent

        color: DrawFunctions.opaqueDarkPanelColor
        visible: Simulator.generic && (Simulator.initializing || Simulator.name === "")

        Item {
            anchors.fill: parent

            visible: Simulator.initializing

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: initializingBar.top
                anchors.margins: 8

                text: qsTr("Initializing")
            }

            ProgressBar {
                id: initializingBar

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 15

                indeterminate: true
            }
        }

        Item {
            anchors.fill: parent

            visible: !Simulator.initializing

            RowLayout {
                id: knownProjectsHeader

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: 5
                spacing: 5

                DecoratedLabel {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    text: qsTr("Projects:")
                }

                DecoratedButton {
                    Layout.fillHeight: true
                    Layout.fillWidth: false

                    text: qsTr("+ Project")
                    onClicked: loadProjectDialog.open()
                }
            }

            DecoratedListView {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: knownProjectsHeader.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 5

                model: Simulator.knownProjects
                delegate: DecoratedTableItem {
                    id: knwonProjectDelegate

                    anchors.left: parent.left
                    anchors.right: parent.right
                    isAlternate: index % 2 == 0
                    height: knwonProjectColumn.height + 15
                    internallyHovered: removeProject.containsMouse

                    Image {
                        id: knwonProjectIcon

                        anchors.top: knwonProjectColumn.top
                        anchors.left: parent.left
                        anchors.leftMargin: 5

                        source: knwonProjectDelegate.hovered ? "qrc:/assets/ui_components/projects_active.png"
                                                             : "qrc:/assets/ui_components/projects_inactive.png"
                    }

                    Column {
                        id: knwonProjectColumn

                        anchors.left: knwonProjectIcon.right
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.margins: 8
                        spacing: 8

                        RowLayout {
                            anchors.left: parent.left
                            anchors.right: parent.right
                            spacing: 8

                            DecoratedLabel {
                                Layout.fillWidth: true
                                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

                                text: modelData.name
                                font.bold: true
                                elide: Text.ElideMiddle
                            }

                            IconButton {
                                id: removeProject

                                Layout.fillWidth: false
                                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

                                visible: knwonProjectDelegate.hovered

                                source: "qrc:/assets/ui_components/projectlist/remove.png"
                                hoveredSource: "qrc:/assets/ui_components/projectlist/remove_hovered.png"
                                pressedSource: "qrc:/assets/ui_components/projectlist/remove_pressed.png"

                                onClicked: Simulator.removeProject(index)
                            }
                        }

                        DecoratedLabel {
                            anchors.left: parent.left
                            anchors.right: parent.right

                            text: modelData.file
                            elide: Text.ElideMiddle
                        }
                    }

                    onClicked: Simulator.loadProject("file:" + modelData.file)
                }
            }

            BorderRectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: knownProjectsHeader.bottom
                anchors.topMargin: 5
            }
        }
    }
}
