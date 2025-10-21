import QtQuick
import qs.modules.common
import "fretboard_data.js" as Data

Item {
    id: root

    property color lineColor: Appearance.colors.colOnLayer1
    property color noteColor: Appearance.colors.colOnSecondary
    property color noteDotColor: Appearance.colors.colSecondary
    property color fretMarkerColor: Appearance.colors.colLayer2
    property int fretsToShow: 12
    property real stringSpacing: 30
    property real fretSpacing: 65

    implicitWidth: fretSpacing * fretsToShow + 80
    implicitHeight: stringSpacing * 5 + 40

    Item {
        id: grid
        anchors.centerIn: parent
        x: 20
        width: root.fretSpacing * root.fretsToShow
        height: root.stringSpacing * 5

        Repeater {
            model: Data.notes
            delegate: Text {
                x: -35
                y: index * root.stringSpacing - height / 2
                text: modelData[0] //Pega a primeira nota (E, B, G, D, A, E)
                color: root.lineColor
                font.bold: true
            }
        }

        //Linhas Horizontais (cordas)
        Repeater {
            model: 6
            delegate: Rectangle {
                x: 0; y: index * root.stringSpacing
                width: grid.width // height: Math.max(1, (6 - index) / 2.5)
                height: 1 //rm
                color: root.lineColor
                opacity: 0.8
            }
        }

        //Linhas Verticais (trastes)
        Repeater {
            model: root.fretsToShow + 1
            delegate: Rectangle {
                x: index * root.fretSpacing
                y: 0; width: (index === 0) ? 5 : 1
                height: grid.height
                color: root.lineColor
            }
        }

        /* //Marcadores de Casa (pontos no braço)
        Repeater {
            model: Data.fretMarkers
            delegate: Rectangle {
                visible: modelData <= root.fretsToShow //mostra marcadores dentro do limite (?)
                x: modelData * root.fretSpacing - (root.fretSpacing / 2) - (width / 2)
                y: (root.stringSpacing * 2.5) - (height / 2)
                width: root.stringSpacing * 0.5; height: width
                radius: width / 2
                color: root.fretMarkerColor
                Rectangle {
                    visible: modelData === 12
                    x: parent.x; y: parent.y - root.stringSpacing * 1.5
                    width: parent.width; height: parent.height; radius: parent.radius
                    color: root.fretMarkerColor
                }
            }
        }*/

        //Notas
        Repeater {
            model: 6 * root.fretsToShow
            delegate: Item {
                property int stringIndex: Math.floor(index / root.fretsToShow)
                property int fretIndex: index % root.fretsToShow

                // SO É VISIVEL SE TEM UMA NOTA (ignora os espaços vazios "")
                visible: Data.notes[stringIndex][fretIndex + 1] !== ""

                x: (fretIndex + 1) * root.fretSpacing - (root.fretSpacing / 2)
                y: stringIndex * root.stringSpacing

                Rectangle {
                    anchors.centerIn: parent
                    width: root.stringSpacing * 0.8; height: width
                    radius: width / 2
                    color: root.noteDotColor
                }
                Text {
                    anchors.centerIn: parent
                    text: Data.notes[stringIndex][fretIndex + 1]
                    color: Appearance.colors.colOnSecondary
                    font.bold: true
                }
            }
        }
    }
}
