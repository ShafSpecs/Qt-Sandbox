import QtQuick
import QtQuick.Window
import QtQuick.Controls

import CounterModule 1.0

Window {
  width: 300
  height: 200
  visible: true
  title: qsTr("Counter App")

  Counter {
    id: counter
  }

  Column {
    anchors.centerIn: parent
    spacing: 20

    Text {
      anchors.horizontalCenter: parent.horizontalCenter
      text: counter.count
      font.pixelSize: 24
      color: counter.count === 0 ? "black" : counter.isPositive ? "green" : "red"
    }

    Row {
      spacing: 10

      Button {
        text: "-"
        onClicked: counter.decrement()
      }

      Button {
        text: qsTr("Reset")
        onClicked: counter.reset()
      }

      Button {
        text: "+"
        onClicked: counter.increment()
      }
    }
  }
}