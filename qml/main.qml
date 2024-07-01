import QtQuick
import QtQuick.Window
import "views"

Window {
    height: 480
    title: qsTr("Multiple QML Files Example")
    visible: true
    width: 640

    MainView {
        anchors.fill: parent
    }
}