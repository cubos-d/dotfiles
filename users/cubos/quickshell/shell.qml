import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import Quickshell.Io

PanelWindow {
  id: root
  anchors.top: true
  anchors.left: true
  anchors.right: true
  implicitHeight: 25
  color: "transparent"
  readonly property var workspaceSymbols: ["", "", "󰌀", "", "󰄛", "", "", "󱡞", "󰊴", "󰙯", ""]
  RowLayout {
    anchors.fill: parent
    Rectangle {
      height: parent.height
      width: workspaceRow.width + 30 
      radius: 20 
      color: Qt.rgba(0.07, 0, 0.16, 0.1)
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
            color: isActive ? '#d4ff14' : (ws ? '#7af7aa' : "#444b6a")
            font { pixelSize: 13; bold: true; family: "ComicShannsMono Nerd Font" }
          }
        }
      }
    }
    Item { Layout.fillWidth: true }

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
          text: Qt.formatDateTime(new Date(), "ddd, yyyy MMM dd - HH:mm")
          color: "#d4ff14"
          font { pixelSize: 13; bold: true; family: "ComicShannsMono Nerd Font" }
        }
      }
    }
    Item { Layout.fillWidth: true }

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
          text: "Hola Quickshell 2 plaplaplaplapal"
          color: "#d4ff14"
          font { pixelSize: 13; bold: true; family: "ComicShannsMono Nerd Font" }
        }
      }
    }
  }
  
}