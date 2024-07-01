import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    width: 300
    height: 200
    visible: true
    title: qsTr("Counter App")

    Column {
        anchors.centerIn: parent
        spacing: 20

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: counter.count
            font.pixelSize: 24
        }

        Row {
            spacing: 10
            Button {
                text: "-"
                onClicked: counter.decrement()
            }
            Button {
                text: "+"
                onClicked: counter.increment()
            }
        }
    }
}