import QtQuick
import QtQuick.Controls

Button {
    id: customButton
    width: 50
    height: 50

    contentItem: Text {
        text: customButton.text
        font.pixelSize: 18
        color: "white"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    background: Rectangle {
//        color: customButton.down ? "#45a049" : "#4CAF50"
        color: customButton.down ? "black" : "yellow"
        radius: 25

        Behavior on color {
            ColorAnimation { duration: 100 }
        }
    }
}