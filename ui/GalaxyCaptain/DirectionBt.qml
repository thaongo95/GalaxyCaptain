import QtQuick 2.15

Rectangle {
    id: directBT
    height: width
    radius: width/2
    opacity: 0.8
    border.width: width/20
    border.color: Qt.lighter(directBT.color, 1.2)
    property alias upBtPressed: upMouse.pressed
    property alias rightBtPressed: rightMouse.pressed
    property alias downBtPressed: downMouse.pressed
    property alias leftBtPressed: leftMouse.pressed
    Component{
        id: button
        Image{
            source: "qrc:/ui/assets/left-arrow.png"
            fillMode: Image.PreserveAspectFit

        }
    }
    Loader{
        id: upBt
        rotation: 90
        anchors{
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: parent.height/10

        }
        width: parent.width/4
        height: width
        sourceComponent: button
        MouseArea{
            id: upMouse
            anchors.fill: parent
        }
    }
    Loader{
        id: rightBt
        rotation: 180
        anchors{
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: parent.height/10

        }
        width: parent.width/4
        height: width
        sourceComponent: button
        MouseArea{
            id: rightMouse
            anchors.fill: parent
        }
    }
    Loader{
        id: downBt
        rotation: 270
        anchors{
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: parent.height/12

        }
        width: parent.width/4
        height: width
        sourceComponent: button
        MouseArea{
            id: downMouse
            anchors.fill: parent
        }
    }
    Loader{
        id: leftBt
        anchors{
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: parent.height/10

        }
        width: parent.width/4
        height: width
        sourceComponent: button
        MouseArea{
            id: leftMouse
            anchors.fill: parent
        }
    }
}
