import QtQuick
import QtQuick.Layouts

Item {
  // 1. Tell the parent RowLayout exactly how wide this widget actually is
  implicitWidth: backgroundCapsule.width
  Layout.fillHeight: true

  Rectangle {
    id: backgroundCapsule
    height: parent.height
    // 2. Base the width directly on the Row content + padding
    width: widgetsRow.width + 10 
    radius: 20 
    color: Qt.rgba(0.07, 0, 0.16, 0.1)
    anchors.right: parent.right // 3. Forces the capsule to anchor and grow from the right side

    Row {
      id: widgetsRow
      anchors.centerIn: parent 
      spacing: 12
      Text {
        text: networkStats
        color: networkStats == "󰚽" ? '#fa1212': '#43f277'
        font { pixelSize: fontSize; bold: true; family: fontFamily }
      }
      Text {
        text: " " + cpuUsage + "%"
        color: '#f1d370'
        font { pixelSize: fontSize; bold: true; family: fontFamily }
      }
      Text {
        text: " " + memoryUsage + "%"
        color: '#4d91ff'
        font { pixelSize: fontSize; bold: true; family: fontFamily }
      }
    }
  }
}