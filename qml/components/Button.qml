import QtQuick

Rectangle {
    width: 100
    height: 40
    color: "lightgreen"
    border.color: "darkgreen"
    border.width: 2
    radius: 5

    Text {
        anchors.centerIn: parent
        text: "Click me!"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            counter.increment()
            backend.updateMessage("Button clicked " + counter.count + " times!")
        }
    }
}