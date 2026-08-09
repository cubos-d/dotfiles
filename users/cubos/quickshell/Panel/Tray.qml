import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray

Row {
  id: trayRoot
  spacing: 8

  Repeater {
    // Reference the global SystemTray singleton items list
    model: SystemTray.items

    delegate: Image {
      id: trayIcon
      width: 15
      height: 15
      
      // SystemTrayItem provides the icon source path
      source: modelData.icon 
      fillMode: Image.PreserveAspectFit

      // Handle user interactions
      MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton

        onClicked: (mouse) => {
          if (mouse.button === Qt.LeftButton) {
              // Left click to activate the application window
              modelData.activate()
          } else if (mouse.button === Qt.RightButton) {
              // Right click to display the application's context menu
              modelData.display(trayRoot, mouse.x, mouse.y)
          }
        }
      }
      
      MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
      }
    }
  }
}
