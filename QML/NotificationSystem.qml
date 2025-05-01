import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {
    id: root

    // Function to show notification popup
    function showNotification(message, color) {
        notificationPopup.message = message;
        notificationPopup.notificationColor = color;
        notificationPopup.open();
    }

    // Popup component for notifications
    Popup {
        id: notificationPopup

        property string message: ""
        property color notificationColor: "#ff0000"

        x: (parent.width - width) / 2
        y: 50
        width: parent.width * 0.7
        height: notificationLayout.implicitHeight + 20

        modal: false
        focus: true
        closePolicy: Popup.CloseOnPressOutside | Popup.CloseOnEscape

        // Auto-close after 5 seconds
        Timer {
            interval: 5000
            running: notificationPopup.visible
            onTriggered: notificationPopup.close()
        }

        background: Rectangle {
            color: "#303030"
            border.color: notificationPopup.notificationColor
            border.width: 2
            radius: 8
        }

        contentItem: ColumnLayout {
            id: notificationLayout
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10

            Text {
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
                text: notificationPopup.message
                color: "white"
                font.pixelSize: 16
                font.bold: true
                wrapMode: Text.WordWrap
            }

            Button {
                Layout.alignment: Qt.AlignHCenter
                text: "Dismiss"
                onClicked: notificationPopup.close()

                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 30
                    color: parent.down ? Qt.darker(notificationPopup.notificationColor, 1.2) : notificationPopup.notificationColor
                    radius: 4
                }

                contentItem: Text {
                    text: parent.text
                    font.pixelSize: 14
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        enter: Transition {
            NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; duration: 300 }
            NumberAnimation { property: "scale"; from: 0.8; to: 1.0; duration: 300 }
        }

        exit: Transition {
            NumberAnimation { property: "opacity"; from: 1.0; to: 0.0; duration: 300 }
        }
    }
}
