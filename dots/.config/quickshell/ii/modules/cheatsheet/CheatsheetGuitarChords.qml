import QtQuick
import QtQuick.Layouts
import "guitar_chords.js" as Chords
import qs.modules.common.widgets

StyledFlickable {
    id: flickable
    contentHeight: contentColumn.implicitHeight
    implicitHeight: Math.min(contentColumn.implicitHeight, 800) //Altura máxima
    implicitWidth: contentColumn.implicitWidth

    ColumnLayout {
        id: contentColumn
        width: flickable.width
        spacing: 40 // Espaço entre a grid e o braço

        // Componente "fantasma" do nosso diagrama
        Component {
            id: chordTemplate
            ChordDiagram {}
        }

        //Grid de Acordes
        Grid {
            id: grid
            Layout.alignment: Qt.AlignHCenter //Centraliza a grid na coluna
            padding: 10
            spacing: 25
            columns: 7 //Colunas
        }
        
        //Separador Visual
        Rectangle {
            Layout.fillWidth: true
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            height: 1
            color: Appearance.colors.colLayer2
        }

        FretboardView {
            id: fretboard
            Layout.alignment: Qt.AlignHCenter //Centraliza o braço na coluna
        }

        //Dinamic
        Component.onCompleted: {
            for (var i = 0; i < Chords.chords.length; i++) {
                var newDiagram = chordTemplate.createObject(grid, {
                    "chordData": Chords.chords[i]
                });
            }
        }
    }
}
