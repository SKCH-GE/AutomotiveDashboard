import QtQuick 2.12
import QtQuick.Controls 2.12

Slider {
    id: control
    height: 20
    
    background: Rectangle {
        x: control.leftPadding
        y: control.topPadding + control.availableHeight / 2 - height / 2
        width: control.availableWidth
        height: 4
        radius: 2
        color: "#bdbebf"
        
        Rectangle {
            width: control.visualPosition * parent.width
            height: parent.height
            color: "#00b0ff"
            radius: 2
        }
    }
    
    handle: Rectangle {
        x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
        y: control.topPadding + control.availableHeight / 2 - height / 2
        width: 16
        height: 16
        radius: 8
        color: control.pressed ? "#e0e0e0" : "#f6f6f6"
        border.color: "#bdbebf"
        
        // Value tooltip
        Rectangle {
            visible: control.pressed
            x: -width / 2 + parent.width / 2
            y: -30
            width: valueLabel.width + 10
            height: valueLabel.height + 6
            color: "#404040"
            radius: 3
            
            Text {
                id: valueLabel
                anchors.centerIn: parent
                text: Math.round(control.value)
                color: "white"
                font.pixelSize: 12
            }
        }
    }
}