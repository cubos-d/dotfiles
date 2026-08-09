import QtQuick

Rectangle {
  height: parent.height
  width: dateRow.width
  radius: 20 
  color: Qt.rgba(0.07, 0, 0.16, 0.1)
  Row {
    id: dateRow
    anchors.centerIn: parent // Keep the row centered in the capsule
    spacing: 12
    Text {
      id: clock
      text: Qt.formatDateTime(new Date(), "    ddd, MMM dd yyyy - HH:mm    ")
      color: "#d4ff14"
      font { pixelSize: fontSize; bold: true; family: fontFamily }
      Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: clock.text = Qt.formatDateTime(new Date(), "    ddd, MMM dd yyyy - HH:mm    ")
      }
    }
  }
}