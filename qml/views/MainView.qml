import QtQuick
import "../components"
import CustomComponents 1.0

Item {
    Box {
        id: mainBox
        anchors.centerIn: parent
    }

    CustomCounter {
        id: counter
    }

    Text {
        anchors.top: mainBox.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Count: " + counter.count
    }

    Text {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: backend.getMessage()
    }
}