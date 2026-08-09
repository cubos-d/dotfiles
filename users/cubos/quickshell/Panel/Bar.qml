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
  property string networkStats: ""
  property string soundStat: ""
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

    Sound {}

    Item {}

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
    command: ["bash", "-c", "nmcli -t -f TYPE,STATE device | cut -d: -f1,2 | head -n 1"]
    
    stdout: SplitParser {
      onRead: data => {
        var cleanData = data.trim()
        
        // 1. If empty or not connected, show the warning right away
        if (!cleanData || !cleanData.includes(":connected")) {
          networkStats = "󰚽";
          return;
        }
        
        // 2. Extract the device type (fixed by adding [0])
        var parts = cleanData.split(":")
        var status = parts[0] 
        
        // 3. Match the device type
        if (status === "ethernet") {
          networkStats = "";
        } else if (status === "wifi" || status === "802-11-wireless") {
          networkStats = "";
        } else {
          networkStats = "󰚽";
        }
      }
    }
    Component.onCompleted: running = true
  }

  Process {
    id: soundProc
    command: ["bash", "-c", "wpctl get-volume @DEFAULT_AUDIO_SINK@"]
    stdout: SplitParser {
      onRead: data => {
        var cleanData = data.trim()
        var parts = cleanData.split(":")
        var vol = parseFloat(parts[1])
        var pct = Math.round(vol * 100)

        // 2. Define icons in clean 25% stepping buckets (0%, 25%, 50%, 75%, 100%)
        var icons = [" ", " ", " ", " ", " "]
        
        // 3. Mathematical mapping: maps 0-100 directly to array indices 0-4 without loop iteration
        var index = Math.min(Math.ceil(pct / 25), 4)
        var soundIcon = icons[index]

        soundStat = soundIcon + pct + "%"
      }
      Component.onCompleted: running = true
    }
  }

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: {
      cpuProc.running = true
      memProc.running = true
      netwProc.running = true
    }
  }

  Timer {
    interval: 50
    running: true
    repeat: true
    onTriggered: {
      soundProc.running = true
    }
  }
}