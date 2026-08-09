import QtQuick

Rectangle {
  height: parent.height
  width: widgetsRow.width + 5
  radius: 20 
  color: Qt.rgba(0.07, 0, 0.16, 0.1)
  Row {
    id: widgetsRow
    anchors.centerIn: parent // Keep the row centered in the capsule
    spacing: 12
    Text {
      text: " " + cpuUsage + "%"
      color: "#d4ff14"
      font { pixelSize: fontSize; bold: true; family: fontFamily }
    }
    Text {
      text: " " + memoryUsage + "% "
      color: "#d4ff14"
      font { pixelSize: fontSize; bold: true; family: fontFamily }
    }
  }
}