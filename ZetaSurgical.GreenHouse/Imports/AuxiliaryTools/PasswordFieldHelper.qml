import QtQuick 2.0

Item {
    id: root
    property bool passwordIsVisible: false
    onPasswordIsVisibleChanged: d.updatePasswordVisibility()
    property Item passwordField: null
    onPasswordFieldChanged: d.updatePasswordVisibility()

    QtObject {
        id: d
        function updatePasswordVisibility() {
            if(passwordField == null)
                return;
            const value = root.passwordIsVisible ? TextInput.Normal : TextInput.Password
            passwordField.input_echoMode = value
        }
    }
}
