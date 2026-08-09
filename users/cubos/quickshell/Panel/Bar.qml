import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
  id: root
  anchors.top: true
  anchors.left: true
  anchors.right: true
  implicitHeight: 25
  color: Qt.rgba(0.0, 0.0, 0.0, 0.1) //"transparent"

  property string fontFamily: "ComicShannsMono Nerd Font"
  property int fontSize: 13
  property int cpuUsage: 0
  property int memoryUsage: 0
  property var lastCpuIdle: 0
  property var lastCpuTotal: 0
  readonly property var workspaceSymbols: ["", "", "󰌀", "", "󰄛", "", "", "󱡞", "󰊴", "󰙯", ""]

  Process {
    id: cpuProc
    command: ["sh", "-c", "head -1 /proc/stat"]
    stdout: SplitParser {
      onRead: data => {
        if (!data) return
        var p = data.trim().split(/\s+/)
        var idle = parseInt(p[4]) + parseInt(p[5])
        var total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0)
        if (lastCpuTotal > 0) {
            cpuUsage = Math.round(100 * (1 - (idle - lastCpuIdle) / (total - lastCpuTotal)))
        }
        lastCpuTotal = total
        lastCpuIdle = idle
      }
    }
    Component.onCompleted: running = true
  }

  Process {
    id: memProc
    command: ["sh", "-c", "free | grep Mem"]
    stdout: SplitParser {
      onRead: data => {
        if (!data) return
        var parts = data.trim().split(/\s+/)
        var total = parseInt(parts[1]) || 1
        var used = parseInt(parts[2]) || 0
        memoryUsage = Math.round(100 * used / total)
      }
    }
    Component.onCompleted: running = true
  }

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: {
      cpuProc.running = true
      memProc.running = true
    }
  }

  RowLayout {
    anchors.fill: parent
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
    Item{}
    Tray { barWindow: root  }
    Item {}
    EndButton {}
  }
}