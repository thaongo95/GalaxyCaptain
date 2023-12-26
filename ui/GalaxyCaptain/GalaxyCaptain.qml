import QtQuick 2.15

Rectangle {
    id: root_
    color: "#8fbc8f"
    DirectionBt{
        id: directButton
        anchors{
            right: parent.right
            bottom: parent.bottom
            margins: parent.height/20
        }
        width: parent.width/6
        color: Qt.darker(root_.color, 1.5)
    }
    FireBt{
        id: fireButton
        anchors{
            left: parent.left
            bottom: parent.bottom
            margins: parent.height/20
        }
        width: parent.width/10
        color: Qt.darker(root_.color, 1.5)
    }

    Timer{
        id: upTime
        interval: 100
        repeat: true
        running: directButton.upBtPressed
        onTriggered: {
            spaceShip.y-=10
        }
    }
    Timer{
        id: rightTime
        interval: 100
        repeat: true
        running: directButton.rightBtPressed
        onTriggered: {
            spaceShip.x+=10
        }
    }
    Timer{
        id: downTime
        interval: 100
        repeat: true
        running: directButton.downBtPressed
        onTriggered: {
            spaceShip.y+=10
        }
    }
    Timer{
        id: leftTime
        interval: 100
        repeat: true
        running: directButton.leftBtPressed
        onTriggered: {
            spaceShip.x-=10
        }
    }
    Timer{
        id: fireTime
        interval: 100
        repeat: true
        running: fireButton.fireBtPressed
        onTriggered: {
            spaceShip.fireFunc();
        }
    }

    SpaceShip{
        id: spaceShip
        x: parent.width/2
        y: parent.height-height
        height: parent.height/20
        width: height
        Rectangle{
            id: bullet
            x: parent.width/2
            y: 0
            width:parent.width/5
            height:parent.height/2
            color: "red"
            Component.onCompleted: flyTime.start()
        }
        Timer{
            id: flyTime
            interval:50
            repeat:true
            triggeredOnStart: true
            onTriggered:{
                bullet.y -=20
            }
        }

        function fireFunc(){
            var bullet = Qt.createQmlObject(
                        '
            import QtQuick 2.15
            Rectangle{
                id: bullet

                width: 5
                height: 10
                color: "red"
                Component.onCompleted: {
                    flyTime.start();
                    x= spaceShip.x+spaceShip.width/2-bullet.width/2
                    y= spaceShip.y

                }
                Timer{
                    id: flyTime
                    interval:50
                    repeat:true
                    triggeredOnStart: true
                    onTriggered:{
                        bullet.y -=20
                    }
                }
            }

            ',root_, "bulletFire" );
            bullet.destroy(3000);
        }
    }
}
