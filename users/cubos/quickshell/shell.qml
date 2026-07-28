import Quickshell
import Quickshell.Wayland
import QtQuick

PanelWindow {
  //anchors.top: true
  anchors.left: true
  //anchors.bottom: true
  implicitWidth: 30
  color: "#1a1b26"

  Text {
    anchors.centerIn: parent
    text: "My first Bar"
    color: "#a9b1d6"
  }
}