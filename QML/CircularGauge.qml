import QtQuick 2.12
import QtQuick.Shapes 1.12

Item {
    id: root

    // Properties
    property real gaugeValue: 0
    property real minValue: 0
    property real maxValue: 100
    property string gaugeTitle: "Gauge"
    property string unit: ""
    property color valueColor: "#00b0ff"
    property color backgroundColor: "#333333"
    property color textColor: "#ffffff"
    property real dangerZoneStart: maxValue  // No danger zone by default
    property real dangerZoneEnd: maxValue    // No danger zone by default
    property color dangerColor: "#ff0000"
    property bool showDecimal: true
    property bool showInnerCircle: false
    property bool inDangerZone: false

    // Signals
    signal dangerZoneEntered(string gaugeName)

    // Private properties
    property real _startAngle: -140
    property real _endAngle: 140
    property real _angleRange: _endAngle - _startAngle

    width: 200
    height: 200

    // Actual gauge container - making the gauge display area smaller
    Item {
        id: gaugeContainer
        anchors.centerIn: parent
        width: parent.width * 0.85  // Making the gauge smaller
        height: parent.height * 0.85  // Making the gauge smaller

        // Check if value enters danger zone
        onWidthChanged: {
            if (dangerZoneStart < maxValue) {
                if (gaugeValue >= dangerZoneStart && !inDangerZone && dangerZoneEnd > dangerZoneStart) {
                    inDangerZone = true;
                    dangerZoneEntered(gaugeTitle);
                } else if (gaugeValue <= dangerZoneStart && !inDangerZone && dangerZoneEnd < dangerZoneStart) {
                    inDangerZone = true;
                    dangerZoneEntered(gaugeTitle);
                }
            }
        }

        // Background circle
        Shape {
            id: backgroundArc
            anchors.fill: parent

            ShapePath {
                strokeWidth: 10  // Slightly thinner
                strokeColor: root.backgroundColor
                fillColor: "transparent"
                capStyle: ShapePath.RoundCap

                PathAngleArc {
                    centerX: gaugeContainer.width / 2
                    centerY: gaugeContainer.height / 2
                    radiusX: Math.min(gaugeContainer.width, gaugeContainer.height) / 2 - 20
                    radiusY: Math.min(gaugeContainer.width, gaugeContainer.height) / 2 - 20
                    startAngle: root._startAngle
                    sweepAngle: root._angleRange
                }
            }
        }

        // Danger zone if applicable
        Shape {
            id: dangerZoneArc
            anchors.fill: parent
            visible: root.dangerZoneStart < root.maxValue

            ShapePath {
                strokeWidth: 10  // Slightly thinner
                strokeColor: root.dangerColor
                fillColor: "transparent"
                capStyle: ShapePath.RoundCap

                PathAngleArc {
                    centerX: gaugeContainer.width / 2
                    centerY: gaugeContainer.height / 2
                    radiusX: Math.min(gaugeContainer.width, gaugeContainer.height) / 2 - 20
                    radiusY: Math.min(gaugeContainer.width, gaugeContainer.height) / 2 - 20
                    startAngle: root._startAngle + (root._angleRange * ((root.dangerZoneStart - root.minValue) / (root.maxValue - root.minValue)))
                    sweepAngle: root._angleRange * ((root.dangerZoneEnd - root.dangerZoneStart) / (root.maxValue - root.minValue))
                }
            }
        }

        // Value arc
        Shape {
            id: valueArc
            anchors.fill: parent

            ShapePath {
                strokeWidth: 10  // Slightly thinner
                strokeColor: root.valueColor
                fillColor: "transparent"
                capStyle: ShapePath.RoundCap

                PathAngleArc {
                    centerX: gaugeContainer.width / 2
                    centerY: gaugeContainer.height / 2
                    radiusX: Math.min(gaugeContainer.width, gaugeContainer.height) / 2 - 20
                    radiusY: Math.min(gaugeContainer.width, gaugeContainer.height) / 2 - 20
                    startAngle: root._startAngle
                    sweepAngle: root._angleRange * Math.min(1, Math.max(0, (root.gaugeValue - root.minValue) / (root.maxValue - root.minValue)))
                }
            }
        }

        // Inner circle (used for gear indicator)
        Rectangle {
            visible: root.showInnerCircle
            anchors.centerIn: parent
            width: Math.min(gaugeContainer.width, gaugeContainer.height) / 3
            height: width
            radius: width / 2
            color: root.backgroundColor
            border.width: 2
            border.color: root.valueColor
        }

        // Value text
        Text {
            anchors.centerIn: parent
            text: root.showDecimal ? root.gaugeValue.toFixed(1) : Math.round(root.gaugeValue)
            color: root.valueColor
            font.pixelSize: root.showInnerCircle ? Math.min(gaugeContainer.width, gaugeContainer.height) / 6 : Math.min(gaugeContainer.width, gaugeContainer.height) / 8
            font.bold: true
        }

        // Unit text
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.verticalCenter
            anchors.topMargin: 15
            text: root.unit
            color: root.textColor
            font.pixelSize: Math.min(gaugeContainer.width, gaugeContainer.height) / 16
            visible: root.unit !== "" && !root.showInnerCircle
        }

        // Scale marks
        Repeater {
            model: 11 // Number of scale marks

            Rectangle {
                property real angle: root._startAngle + (index * (root._angleRange / 10))
                property real rads: (angle * Math.PI) / 180

                x: (gaugeContainer.width / 2) + ((Math.min(gaugeContainer.width, gaugeContainer.height) / 2 - 10) * Math.cos(rads)) - width/2
                y: (gaugeContainer.height / 2) + ((Math.min(gaugeContainer.width, gaugeContainer.height) / 2 - 10) * Math.sin(rads)) - height/2
                width: 2
                height: 6
                color: root.textColor

                transform: Rotation {
                    origin.x: width/2
                    origin.y: height/2
                    angle: index * (root._angleRange / 10) + 90
                }
            }
        }

        // Scale values
        Repeater {
            model: 6 // Number of scale values

            Text {
                property real angle: root._startAngle + (index * (root._angleRange / 5))
                property real rads: (angle * Math.PI) / 180

                x: (gaugeContainer.width / 2) + ((Math.min(gaugeContainer.width, gaugeContainer.height) / 2 - 35) * Math.cos(rads)) - width/2
                y: (gaugeContainer.height / 2) + ((Math.min(gaugeContainer.width, gaugeContainer.height) / 2 - 35) * Math.sin(rads)) - height/2
                text: Math.round(root.minValue + (index * ((root.maxValue - root.minValue) / 5)))
                color: root.textColor
                font.pixelSize: Math.min(gaugeContainer.width, gaugeContainer.height) / 20
            }
        }
    }

    // Title text - moved further down and outside the gauge area
    Rectangle {
        id: titleRect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: gaugeContainer.bottom
        anchors.topMargin: 5
        width: titleText.width + 16
        height: titleText.height + 6
        radius: 4
        color: Qt.rgba(root.valueColor.r, root.valueColor.g, root.valueColor.b, 0.3)

        Text {
            id: titleText
            anchors.centerIn: parent
            text: root.gaugeTitle
            color: root.textColor
            font.pixelSize: Math.min(root.width, root.height) / 16
            font.bold: true
        }
    }

    // Check for danger zone entry when gauge value changes
    onGaugeValueChanged: {
        if (dangerZoneStart < maxValue) {
            if (dangerZoneEnd > dangerZoneStart) {
                // Standard danger zone (high values are dangerous)
                if (gaugeValue >= dangerZoneStart && !inDangerZone) {
                    inDangerZone = true;
                    dangerZoneEntered(gaugeTitle);
                } else if (gaugeValue < dangerZoneStart) {
                    inDangerZone = false;
                }
            } else {
                // Inverted danger zone (low values are dangerous, like fuel)
                if (gaugeValue <= dangerZoneStart && !inDangerZone) {
                    inDangerZone = true;
                    dangerZoneEntered(gaugeTitle);
                } else if (gaugeValue > dangerZoneStart) {
                    inDangerZone = false;
                }
            }
        }
    }
}
