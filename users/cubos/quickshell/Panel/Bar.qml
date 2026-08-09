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
    // 1. Spawns exactly ONE long-running background process.
    // It pipes pw-mon events through a while loop, checking for volume/route modifications.
    command: [
      "bash", "-c", 
      "wpctl get-volume @DEFAULT_AUDIO_SINK@; pw-mon | while read -r line; do if [[ \"$line\" == *'changed'* || \"$line\" == *'props'* ]]; then wpctl get-volume @DEFAULT_AUDIO_SINK@; fi; done"
    ]
    
    // 2. Automatically launches when Quickshell starts. Remove the 'Timer' code block completely!
    running: true 
    
    stdout: SplitParser {
      onRead: data => {
        var cleanData = data.trim()
        if (!cleanData) return;
        
        // Format expected: "Volume: 0.45" or "Volume: 0.45 [MUTED]"
        var parts = cleanData.split(":")
        if (parts.length < 2) return;
        
        var vol = parseFloat(parts[1])
        if (isNaN(vol)) return;
        
        var pct = Math.round(vol * 100)

        var soundIcon = ""
        if (cleanData.includes("[MUTED]")) {
            soundIcon = " "
        } else {
            var icons = [" ", " ", " ", " "]
            // Smooth index mapping without iterations
            var index = Math.min(Math.floor(pct / 33), 3)
            soundIcon = icons[index]
        }

        soundStat = soundIcon + pct + "%"
      }
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

}