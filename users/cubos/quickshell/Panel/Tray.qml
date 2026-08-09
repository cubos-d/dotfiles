import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray

RowLayout {
  id: trayrootlayout
  property var barWindow: null 
  Rectangle {
    height: parent.height
    implicitWidth: trayRow.width
    Row {
      id: trayRow
      anchors.centerIn: parent // Keep the row centered in the capsule
      spacing: 5
      
      Repeater {
        model: SystemTray.items

        delegate: MouseArea {
          id: trayItemMouseArea
          implicitWidth: 15
          implicitHeight: 15
          acceptedButtons: Qt.LeftButton | Qt.RightButton

          Image {
              anchors.fill: parent
              source: modelData.iconName ? "image://icon/" + modelData.iconName : modelData.icon
              fillMode: Image.PreserveAspectFit
          }

          onClicked: (mouse) => {
            if (mouse.button === Qt.LeftButton) {
              modelData.activate(); 
            } else if (mouse.button === Qt.RightButton) {
              if (barWindow) {
                // SOLUCIÓN: Pasamos la ventana real (barWindow) como requiere el protocolo nativo
                // Convertimos la posición local a coordenadas relativas de la barra
                var barCoords = trayItemMouseArea.mapToItem(null, mouse.x, mouse.y);
                modelData.display(barWindow, barCoords.x, barCoords.y);
              } else {
                console.error("Error: barWindow not assigned to Tray component");
              }
            }
          }
        }
      }
    }
  }
}
