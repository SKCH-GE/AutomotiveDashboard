import QtQuick 2.12
import QtQuick.Layouts 1.12

Rectangle {
    id: dashboardBase
    width: 600
    height: 400
    color: "#252525"
    radius: 15

    // Subtle background gradient
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#303030" }
        GradientStop { position: 1.0; color: "#1a1a1a" }
    }

    // Subtle border
    border.color: "#3a3a3a"
    border.width: 1

    // Notification system
    NotificationSystem {
        id: notificationSystem
        anchors.fill: parent
    }

    // Dashboard content
    RowLayout {
        anchors {
            fill: parent
            margins: 20
        }
        spacing: 20

        // Left column - Speed and Gear
        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 25  // More spacing between gauges

            CircularGauge {
                id: speedGauge
                Layout.fillWidth: true
                Layout.fillHeight: true
                gaugeValue: dashboardModel.speed
                maxValue: 220
                gaugeTitle: "Speed"
                unit: "km/h"
                valueColor: "#00b0ff"
                dangerZoneStart: 180

                onDangerZoneEntered: {
                    notificationSystem.showNotification("Warning: Maximum Speed reached!", dangerColor)
                }
            }

            CircularGauge {
                id: gearGauge
                Layout.fillWidth: true
                Layout.fillHeight: true
                gaugeValue: dashboardModel.gear
                minValue: 1
                maxValue: 6
                gaugeTitle: "Gear"
                valueColor: "#00e676"
                showInnerCircle: true
                showDecimal: false
            }
        }

        // Right column - Fuel and Temperature
        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 25  // More spacing between gauges

            CircularGauge {
                id: fuelGauge
                Layout.fillWidth: true
                Layout.fillHeight: true
                gaugeValue: dashboardModel.fuel
                maxValue: 100
                gaugeTitle: "Fuel"
                unit: "%"
                valueColor: "#ffab00"
                dangerZoneStart: 20
                dangerZoneEnd: 0
                dangerColor: "#f44336"

                onDangerZoneEntered: {
                    notificationSystem.showNotification("Warning: Low Fuel level!", dangerColor)
                }
            }

            CircularGauge {
                id: tempGauge
                Layout.fillWidth: true
                Layout.fillHeight: true
                gaugeValue: dashboardModel.temperature
                minValue: 50
                maxValue: 130
                gaugeTitle: "Temperature"
                unit: "°C"
                valueColor: "#ff5722"
                dangerZoneStart: 110
                dangerColor: "#f44336"

                onDangerZoneEntered: {
                    notificationSystem.showNotification("Warning: Engine Overheating!", dangerColor)
                }
            }
        }
    }
}
