import QtQuick

Rectangle {
  height: parent.height
  width: powerButtonRow.width + 5
  radius: 20 
  color: Qt.rgba(0.41, 0.00, 0.91, 0.3)
  Row {
    id: powerButtonRow
    anchors.centerIn: parent
    spacing: 3
    Text {
      text: "   "
      color: '#ed3300'
      font { pixelSize: fontSize + 1; bold: true; family: fontFamily }
    }
  }
}