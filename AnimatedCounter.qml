import QtQuick

Item {
    width: counterText.width
    height: counterText.height

    Text {
        id: counterText
        text: counter.count
        font.pixelSize: 24
        color: counter === "black" ? "black" : counter.isPositive ? "green" : "red"

        Behavior on text {
            NumberAnimation {
                duration: 200
            }
        }

        SequentialAnimation on scale {
            id: pulseAnimation
            running: false
            NumberAnimation { to: 1.25; duration: 100 }
            NumberAnimation { to: 1.0; duration: 100 }
        }
    }

    Connections {
        target: counter
        function onCountChanged() {
            pulseAnimation.start()
        }
    }
}
