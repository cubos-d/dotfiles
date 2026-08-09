import Quickshell
import Quickshell.Io
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
  property var sigStrength: 0
  readonly property var workspaceSymbols: ["", "", "󰌀", "", "󰄛", "", "", "󱡞", "󰊴", "󰙯", ""]

  /* 
  ################################################################################################
  ******************************* !!! PUT THE BAR MODULES HERE !!! ******************************* 
  ################################################################################################
  Inside RowLayout
  */
  RowLayout {
    anchors.fill: parent
    
    Workspaces {}

    Item { Layout.fillWidth: true }

    Clock {}

    Item { Layout.fillWidth: true }

    StatusWidgets {}

    Item{}

    Tray { barWindow: root  }

    Item {}

    EndButton {}
  }

  /*
  ################################################################################################
  ********************************** !!! END OF BAR MODULES !!! ********************************** 
  ################################################################################################
  */

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

  Process {
    id: netwProc
    command: ["sh", "-c", "nmcli -f IN-USE,SIGNAL device wifi | grep '^*' | awk '{print $2}'"]
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
}