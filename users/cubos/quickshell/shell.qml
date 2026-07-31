import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts

PanelWindow {
  anchors.top: true
  anchors.left: true
  anchors.right: true
  implicitHeight: 25
  color: "transparent"
  RowLayout {
    anchors.fill: parent
    Rectangle {
      height: parent.height
      width: workspaceRow.width + 30 
      radius: 20 
      color: Qt.rgba(0.0, 0.0, 0.0, 0.1)
      Row {
        id: workspaceRow
        anchors.centerIn: parent // Keep the row centered in the capsule
        spacing: 12
        
        Repeater {
          model: 9
          Text {
            anchors.verticalCenter: parent.verticalCenter
            text: (index + 1).toString()
            color: "#444b6a"
            font.pixelSize: 12
          }
        }
      }
    }
  }
  
}