import QtQuick
import QtQuick.Layouts

Item {
  // 1. Tell the parent RowLayout exactly how wide this widget actually is
  implicitWidth: backgroundCapSound.width
  Layout.fillHeight: true

  Rectangle {
    id: backgroundCapSound
    height: parent.height
    // 2. Base the width directly on the Row content + padding
    width: soundRow.width + 1
    radius: 20 
    color: Qt.rgba(0.07, 0, 0.16, 0.1)
    anchors.right: parent.right // 3. Forces the capsule to anchor and grow from the right side

    Row {
      id: soundRow
      anchors.centerIn: parent 
      spacing: 10
      Text {
        text: soundStat
        color: '#00ebf8'
        font { pixelSize: fontSize; bold: true; family: fontFamily }
      }
    }
  }
}