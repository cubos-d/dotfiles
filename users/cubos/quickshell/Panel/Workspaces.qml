import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Rectangle {
  height: parent.height
  implicitWidth: workspaceRow.width + 30 
  radius: 20 
  color: Qt.rgba(0.07, 0, 0.16, 0.3)
  Row {
    id: workspaceRow
    anchors.centerIn: parent // Keep the row centered in the capsule
    spacing: 12
    
    Repeater {
      model: 10
      
      Text {
        anchors.verticalCenter: parent.verticalCenter
        readonly property int wsId: index + 1
        property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
        property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
        text: workspaceSymbols[wsId] || String(wsId)
        color: isActive ? '#d4ff14' : (ws ? "#7af7aa" : "#444b6a")
        font { pixelSize: fontSize; bold: true; family: fontFamily }
      }
    }
  }
}