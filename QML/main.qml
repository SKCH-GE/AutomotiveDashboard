import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    id: root
    visible: true
    width: 800
    height: 700 // Reduced height
    title: qsTr("Automotive Dashboard")
    color: "#1e1e1e"  // Dark background for automotive feel

    Dashboard {
        id: dashboard
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: controlsPanel.top
            margins: 10
        }
    }

    // Controls panel
    Rectangle {
        id: controlsPanel
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            margins: 10
        }
        height: 100 // Reduced height
        color: "#2a2a2a"
        radius: 8

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 8 // Reduced margins
            spacing: 4 // Reduced spacing

            Text {
                text: "Dashboard Controls"
                color: "white"
                font.pixelSize: 14 // Smaller font
                font.bold: true
                Layout.alignment: Qt.AlignHCenter
            }

            GridLayout {
                columns: 4
                Layout.fillWidth: true
                Layout.fillHeight: true
                rowSpacing: 8 // Reduced spacing
                columnSpacing: 15 // Reduced spacing

                // Speed control
                Text {
                    text: "Speed:"
                    color: "white"
                    Layout.alignment: Qt.AlignRight
                    font.pixelSize: 12 // Smaller font
                }

                ValueSlider {
                    id: speedSlider
                    from: 0
                    to: 220
                    value: dashboardModel.speed
                    onValueChanged: dashboardModel.speed = value
                    Layout.fillWidth: true
                }

                // Gear control
                Text {
                    text: "Gear:"
                    color: "white"
                    Layout.alignment: Qt.AlignRight
                    font.pixelSize: 12 // Smaller font
                }

                ComboBox {
                    id: gearCombo
                    model: [1, 2, 3, 4, 5, 6]
                    currentIndex: dashboardModel.gear - 1
                    onCurrentIndexChanged: dashboardModel.gear = currentIndex + 1
                    Layout.fillWidth: true
                }

                // Fuel control
                Text {
                    text: "Fuel:"
                    color: "white"
                    Layout.alignment: Qt.AlignRight
                    font.pixelSize: 12 // Smaller font
                }

                ValueSlider {
                    id: fuelSlider
                    from: 0
                    to: 100
                    value: dashboardModel.fuel
                    onValueChanged: dashboardModel.fuel = value
                    Layout.fillWidth: true
                }

                // Temperature control
                Text {
                    text: "Temp:"
                    color: "white"
                    Layout.alignment: Qt.AlignRight
                    font.pixelSize: 12 // Smaller font
                }

                ValueSlider {
                    id: tempSlider
                    from: 50
                    to: 130
                    value: dashboardModel.temperature
                    onValueChanged: dashboardModel.temperature = value
                    Layout.fillWidth: true
                }
            }
        }
    }
}
