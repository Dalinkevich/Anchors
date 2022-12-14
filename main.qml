import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.1

Window {
    id: _win
    visible: true
    width: 800
    height: 600

    property int sizeUnit: _sizeSlider.value

    Slider {
        id: _sizeSlider
        orientation: Qt.Vertical
        height: 200
        anchors.right: parent.right
        anchors.margins: 30
        from: 50
        to: 200
        value: 100
    }

    //Голова
    Block {
        id: _head
        h: 1
        w: 1
        color: "brown"
        anchors.bottom: _body.top
        anchors.horizontalCenter: _body.horizontalCenter
        anchors.bottomMargin: -border.width

        MouseArea { id: mouseArea; anchors.fill: parent }

        //Анимация по нажатию на голову
        states: State {
            name: "down"
            when: mouseArea.pressed === true

            PropertyChanges {
                target: _head
                y: _body.height
                rotation: 360
                color: "indigo"
                anchors.bottomMargin: border.width - border.width
            }

            PropertyChanges {
                target: _leftEye
                color: "yellow"
            }

            PropertyChanges {
                target: _rightEye
                color: "yellow"
            }

            AnchorChanges {
                target: _head
                anchors.bottom: _body.bottom
            }
        }

        transitions: Transition {
            from: ""
            to: "down"
            reversible: true

            ParallelAnimation {

                NumberAnimation { properties: "y,rotation"; duration: 1000; easing.type: Easing.InOutQuad }
            }

            ColorAnimation {
                duration: 500
            }
        }
    }

    //Левый глаз
    Block {
        id: _leftEye
        round: true
        w: 0.2
        h: 0.2
        color: "green"
        anchors.verticalCenter: _head.top
        anchors.horizontalCenter:  _head.left
        anchors.verticalCenterOffset: _head.height / 4
        anchors.horizontalCenterOffset: _head.width / 4
    }

    //Правый глаз
    Block {
        id: _rightEye
        round: true
        w: 0.2
        h: 0.2
        color: "green"
        anchors.verticalCenter: _head.top
        anchors.horizontalCenter: _head.right
        anchors.verticalCenterOffset: _head.height / 4
        anchors.horizontalCenterOffset: -_head.width / 4
    }

    //Нос
    Block {
        id: _nose
        h: 0.2
        w: h
        color: "red"
        anchors.centerIn: _head
    }

    //Рот
    Block {
        id: _mouth
        w: 0.8
        h: 0.2
        color: "white"

        anchors.verticalCenter: _head.bottom
        anchors.horizontalCenter: _head.horizontalCenter
        anchors.verticalCenterOffset: -_head.height / 4
    }

    //Тело
    Block {
        id: _body
        x: 300
        y: 300
        w: 1.4
        h: 1.8
        color: "grey"

        //Левая рука
        Block {
            id: _leftHand
            w: 0.8
            h: 0.4
            color: "lightblue"
            anchors.top: _body.top
            anchors.right: _body.left
            anchors.rightMargin: -border.width
        }

        //Правая рука
        Block {
            id: _rightHand
            w: 0.8
            h: 0.4
            color: "lightblue"
            anchors.top: _body.top
            anchors.left: _body.right
            anchors.leftMargin: -border.width
        }

        //Левая нога
        Block {
            id: _leftLeg
            w: 0.5
            h: 1
            color: "lightblue"
            anchors.left: _body.left
            anchors.top: _body.bottom
            anchors.topMargin: -border.width

            //Левая ступня
            Block {
                id: _leftFoot
                w: parent.w
                h: w
                z: -1
                color: parent.color
                round: true
                anchors.top: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: - height / 4
            }
        }

        //Правая нога
        Block {
            id: _rightLeg
            w: 0.5
            h: 1
            color: "lightblue"
            anchors.right: _body.right
            anchors.top: _body.bottom
            anchors.topMargin: -border.width

            //Правая ступня
            Block {
                id: _rightFoot
                w: parent.w
                h: w
                z: -1
                color: parent.color
                round: true
                anchors.top: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: - height / 4
            }
        }
    }
}
