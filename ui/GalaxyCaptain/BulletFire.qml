import QtQuick 2.15

Rectangle{
    id: bullet
    x: parent.width/2
    y: 0
    width:parent.width/5
    height:parent.height/2
    color: "red"
    Component.onCompleted: flyTime.start()
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
