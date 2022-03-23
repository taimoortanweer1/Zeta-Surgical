import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.12

import Helpers 1.0

Button {
    id: button

    Keys.onEnterPressed: button.clicked()
    Keys.onReturnPressed: button.clicked()
    Keys.onSpacePressed: button.clicked()


    Material.background: DrawFunctions.dialogButtonColor
    Material.foreground: DrawFunctions.dialogButtonTextColor

    // NOTE: No attached "index" property; it must be calculated manually
    readonly property int index: {
        var i = 0
        const buttonCount = DialogButtonBox.buttonBox.count
        for(; i < buttonCount; i++) {
            if (this === DialogButtonBox.buttonBox.itemAt(i)) return i
        }
        return -1
    }

    readonly property bool isOkOrApplyButton: {
        return DialogButtonBox.buttonRole === DialogButtonBox.AcceptRole
                || DialogButtonBox.buttonRole === DialogButtonBox.ApplyRole
                || DialogButtonBox.buttonRole === DialogButtonBox.YesRole
    }

    font.capitalization: Font.MixedCase
    opacity: enabled ? 1.0 : 0.5
}
