import QtQuick
import qs.modules.common

Item {
    id: root
    required property var chordData

    property color lineColor: Appearance.colors.colOnLayer1
    property color fingerNumberColor: Appearance.colors.colLayer1
    property color fingerDotColor: Appearance.colors.colOnLayer0
    property color barreColor: Appearance.colors.colOnLayer0
    property real stringSpacing: 20
    property real fretSpacing: 25
    property real barreHeight: root.stringSpacing * 0.50
    property real barreRadius: barreHeight / 2.5


    property int fretsToShow: {
        var maxPos = 0;
        //Encontra a maior posição (casa) usada pelos dedos
        for (var i = 0; i < chordData.fingers.length; i++) {
            if (chordData.fingers[i].p > maxPos) {
                maxPos = chordData.fingers[i].p;
            }
        }
        //Garante que o diagrama tem no minimo 4 casas e se expande se necessario
        return Math.max(4, maxPos - chordData.startFret + 1);
    }


    implicitWidth: stringSpacing * 5 + 70
    implicitHeight: fretSpacing * fretsToShow + 100

    Text {
        id: chordName
        text: chordData.name
        font.pixelSize: 24; font.bold: true
        color: Appearance.colors.colOnLayer0
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Item {
        id: grid
        anchors.top: chordName.bottom
        anchors.topMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
        width: root.stringSpacing * 5
        height: root.fretSpacing * root.fretsToShow

        Text {
            visible: chordData.startFret > 1
            x: -20
            y: root.fretSpacing - (root.fretSpacing / 2) - height / 2
            text: chordData.startFret + "ª"
            color: Appearance.colors.colOnLayer1
            font.pixelSize: 12
            font.bold: true
        }
        
        Rectangle {
            visible: chordData.startFret === 1
            x: 0; y: 0; width: grid.width; height: 3
            color: root.lineColor
        }

        Repeater { model: 6; delegate: Rectangle { x: index * root.stringSpacing; y: 0; width: 1; height: grid.height; color: root.lineColor } }
        Repeater { model: root.fretsToShow; delegate: Rectangle { x: 0; y: (index + 1) * root.fretSpacing; width: grid.width; height: 1; color: root.lineColor } }

        Rectangle {
            id: barreRect
            visible: chordData.barre !== undefined

            property int relativeFret: chordData.barre ? chordData.barre.fret - chordData.startFret + 1 : 0
            y: relativeFret * root.fretSpacing - (root.fretSpacing / 2) - (height / 2)

            x: (6 - chordData.barre.from) * root.stringSpacing - (root.barreHeight / 2)
            width: (chordData.barre.from - chordData.barre.to) * root.stringSpacing + root.barreHeight
            height: root.barreHeight
            radius: root.barreRadius

            color: root.barreColor
            border.color: root.lineColor
            border.width: 1
        }

        Repeater {
            model: chordData.fingers
            delegate: Rectangle {
                property int relativeFret: modelData.p - chordData.startFret + 1
                x: (6 - modelData.s) * root.stringSpacing - (width / 2)
                y: relativeFret * root.fretSpacing - (root.fretSpacing / 2) - (height / 2)
                width: root.stringSpacing * 0.95; height: width; radius: width / 2;
                color: root.fingerDotColor
                border.color: root.lineColor
                border.width: 1
                Text { 
                    anchors.centerIn: parent
                    text: modelData.f
                    color: root.fingerNumberColor
                    font.bold: true
                    font.pixelSize: 12
                }
            }
        }
    }

    Row {
        id: indicatorRow
        spacing: root.stringSpacing - 14
        anchors.top: grid.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: grid.horizontalCenter

        Repeater {
            model: chordData.frets
            delegate: Item {
                width: 14; height: 14
                Text { anchors.centerIn: parent; text: "x"; color: root.lineColor; font.pixelSize: 14; visible: modelData === -1 }
                Rectangle {
                    anchors.centerIn: parent; width: parent.width * 0.6; height: width; radius: width / 2
                    color: (6 - index) === chordData.rootString ? root.lineColor : "transparent"
                    border.color: root.lineColor
                    border.width: 1
                    visible: modelData >= 0
                }
            }
        }
    }
}
