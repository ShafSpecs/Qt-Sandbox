import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

import CounterModule 1.0

Window {
    width: 300
    height: 200
    visible: true
    title: qsTr("Animated Counter App")

    Counter {
        id: counter
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        AnimatedCounter {
            Layout.alignment: Qt.AlignHCenter
        }

        Text {
            Layout.alignment: Qt.AlignHCenter
            text: counter.isEven ? "Even" : "Odd"
            font.pixelSize: 16
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 10

            CustomButton {
                text: "-"
                onClicked: counter.decrement()
            }
            CustomButton {
                text: "Reset"
                onClicked: counter.reset()
            }
            CustomButton {
                text: "+"
                onClicked: counter.increment()
            }
        }
    }
}