import QtQuick 2.14
import QtQuick.Controls 2.14

import Styles 1.0
import Themes 1.0
import Helpers 1.0

Dialog {
    id: root

    parent: Overlay.overlay

    property DialogStyle dialogStyle: DialogStyle {
        titleBar: TitleBarStyle {
            backgroundColor: Theme.dialogStyle.titleBar.backgroundColor
            horizontalPadding: Theme.dialogStyle.titleBar.horizontalPadding
            verticalPadding: Theme.dialogStyle.titleBar.verticalPadding
            closeButtonVisible: root.closePolicy !== Popup.NoAutoClose
            borderRadius: Theme.dialogStyle.titleBar.borderRadius
            title: Theme.dialogStyle.titleBar.title
        }
        form: Theme.dialogStyle.form
    }

    property Item firstContentFocusElement: contentItem.children.length > 0 ? contentItem.children[0] : contentItem
    property Item lastContentFocusElement: contentItem.children.length > 0 ? contentItem.children[contentItem.children.length - 1] : contentItem

    property Item firstFooterFocusElement: dialogButtonBoxObject.count > 0 ? dialogButtonBoxObject.itemAt(dialogButtonBoxObject.count - 1) : footer
    property Item lastFooterFocusElement: dialogButtonBoxObject.count > 0 ? dialogButtonBoxObject.itemAt(0) : footer

    property alias dialogButtonBox: dialogButtonBoxObject
    property bool displayWarningMessage: false
    property bool hasContentItemsToFocus: true

    // NOTE: Override this property to disable the corresponding buttons as necessary
    property bool okAndApplyButtonsEnabled: {
        // Enable these buttons by default if they exist
        return (root.standardButtons & (Dialog.Ok | Dialog.Accept | Dialog.Apply | Dialog.Yes | Dialog.YesToAll)) !== 0
    }
    property string applyButtonText

    bottomPadding: root.dialogStyle.form.contentBottomPadding
    leftPadding: 25
    rightPadding: 25

    modal: true

    onOpened: focusFirstAvailableItem()

    function focusFirstAvailableItem() {
        const item = root.hasContentItemsToFocus ? root.firstContentFocusElement : root.firstFooterFocusElement
        if(!item)
            return;
        item.forceActiveFocus(Qt.TabFocus)
    }

    Overlay.modal: Rectangle {
        color: DrawFunctions.modalOverlayColor
    }

    header: TitleBar {
        titleBarStyle: root.dialogStyle.titleBar
        title: root.title
        onCloseButtonClicked: root.reject()
    }

    background: Loader {
        sourceComponent: backgroundComponent
    }

    footer: DialogButtonBox {
        id: dialogButtonBoxObject

        background: Loader {
            sourceComponent: backgroundComponent
        }

        topPadding: root.dialogStyle.form.footerTopPadding
        bottomPadding: root.dialogStyle.form.footerBottomPadding
        horizontalPadding: root.dialogStyle.form.footerHorizontalPadding
        spacing: root.dialogStyle.form.footerSpacing
        position: DialogButtonBox.Footer

        delegate: DecoratedDialogButton {
            id: button

            // NOTE: These Buttons are assigned indices in reverse order (right to left)
            KeyNavigation.backtab: ((index + 1) < DialogButtonBox.buttonBox.count)
                                   ? DialogButtonBox.buttonBox.itemAt(index + 1)
                                   : ( root.hasContentItemsToFocus ? root.lastContentFocusElement : DialogButtonBox.buttonBox.itemAt(index + 1) )
            KeyNavigation.tab: (index === 0)
                               ? ( root.hasContentItemsToFocus ?  root.firstContentFocusElement : DialogButtonBox.buttonBox.itemAt(index - 1) )
                               : DialogButtonBox.buttonBox.itemAt(index - 1)

            enabled: button.isOkOrApplyButton ? root.okAndApplyButtonsEnabled : true

            StateGroup {
                states: [
                    State {
                        when: (button.DialogButtonBox.buttonRole === DialogButtonBox.ApplyRole) && root.applyButtonText
                        PropertyChanges {
                            target: button
                            text: root.applyButtonText
                        }
                    }
                ]
            }
        }
    }

    function openUnder(item) {
        positioningItem = item
        open()
        reposition()
    }

    function reposition() {
        if (positioningItem && parent) {
            var pos = parent.mapFromItem(positioningItem, positioningItem.width, positioningItem.height);
            x = Qt.binding( function() { return Math.max(0, Math.min(root.parent.width - implicitWidth, pos.x - implicitWidth)); } );
            y = Qt.binding( function() { return Math.max(0, Math.min(pos.y, root.parent.height - implicitHeight)); } );
        }
    }

    readonly property int overlayWidth: parent ? parent.width : 0
    readonly property int overlayHeight: parent ? parent.height : 0
    property Item positioningItem: null
    Timer {
        id: repositionTimer

        interval: 50
        repeat: false
        onTriggered: root.reposition()
    }

    onOverlayWidthChanged: {
        if (repositionTimer)
            repositionTimer.start()
    }
    onOverlayHeightChanged: {
        if (repositionTimer)
            repositionTimer.start()
    }
    Component {
        id: backgroundComponent
        Rectangle {
            clip: true
            Rectangle {
                height: parent.height / 2
                color: parent.color
            }
            anchors.fill: parent
            color: DrawFunctions.paneColor
            radius: root.dialogStyle.titleBar.borderRadius
        }
    }
}
