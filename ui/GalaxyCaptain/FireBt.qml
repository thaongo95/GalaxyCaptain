import QtQuick 2.15

Rectangle {
    id: root_
    height: width
    radius: width/2
    opacity: 0.8
    border.width: width/20
    border.color: fireMouse.pressed ? "blue" : Qt.lighter(root_.color, 1.2)
    property alias fireBtPressed: fireMouse.pressed
    Image{
        width: parent.width/2
        height: width
        anchors.centerIn: parent

        source: "qrc:/ui/assets/speed.png"
        fillMode: Image.PreserveAspectFit
    }
    MouseArea{
        id: fireMouse
        anchors.fill: parent
    }
}
