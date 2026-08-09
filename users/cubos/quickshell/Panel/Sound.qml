import QtQuick
import QtQuick.Layouts
import Quickshell.Io

Item {
  // 1. Tell the parent RowLayout exactly how wide this widget actually is
  implicitWidth: backgroundCapSound.width
  Layout.fillHeight: true

  readonly property string volUpCmd: "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"
  readonly property string volDownCmd: "wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"

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
     MouseArea {
      anchors.fill: parent
      scrollGestureEnabled: true // Ensures trackpad scrolling works too

      onWheel: (wheel) => {
        if (wheel.angleDelta.y > 0) {
          raiseVolume.running = true
        } else if (wheel.angleDelta.y < 0) {
          lowerVolume.running = true
        }
      }
    }

    Process {
      id: raiseVolume
      command: ["bash", "-c", volUpCmd]
    }

    Process {
      id: lowerVolume
      command: ["bash", "-c", volDownCmd]
    }
  }
}