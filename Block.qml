import QtQuick 2.0

Rectangle {
    property real w: 1
    property real h: 1
    property bool round: false
    border.color: "black"
    border.width: 0.04 * sizeUnit
    radius: round ? width / 2 : 0
    width: sizeUnit*w
    height: sizeUnit*h
}
