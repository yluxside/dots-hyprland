import qs.modules.common
import qs.modules.common.widgets
import qs.services
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire

Item {
    id: root
    required property PwNode node
    PwObjectTracker {
        objects: [node]
    }

    // Spotify
    property bool isSpotifyNode: {
        const appName = root.node.properties["application.name"] ?? "";
        const nodeName = root.node.name ?? "";
        return appName.toLowerCase().indexOf("spotify") !== -1 ||
               nodeName.toLowerCase().indexOf("spotify") !== -1;
    }

    implicitHeight: rowLayout.implicitHeight

    RowLayout {
        id: rowLayout
        anchors.fill: parent
        spacing: 6

        Image {
            property real size: 36
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            visible: source != ""
            sourceSize.width: size
            sourceSize.height: size
            source: {
                let icon;
                icon = AppSearch.guessIcon(root.node.properties["application.icon-name"]);
                if (AppSearch.iconExists(icon))
                    return Quickshell.iconPath(icon, "image-missing");
                icon = AppSearch.guessIcon(root.node.properties["node.name"]);
                return Quickshell.iconPath(icon, "image-missing");
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            spacing: -4

            StyledText {
                Layout.fillWidth: true
                font.pixelSize: Appearance.font.pixelSize.small
                color: Appearance.colors.colSubtext
                elide: Text.ElideRight
                text: {
                    // application.name -> description -> name
                    const app = root.node.properties["application.name"] ?? (root.node.description != "" ? root.node.description : root.node.name);
                    const media = root.node.properties["media.name"];
                    return media != undefined ? `${app} • ${media}` : app;
                }
            }

            StyledSlider {
                id: slider
                value: root.node.audio.volume
                configuration: StyledSlider.Configuration.S

                // Spotify Pipewire <-> MPRIS
                onMoved: {
                    root.node.audio.volume = value;
                    if (root.isSpotifyNode && MprisController.canChangeVolume) {
                        if (Math.abs(MprisController.volume - value) > 0.01) {
                            MprisController.volume = value;
                        }
                    }
                }

                Connections {
                    target: MprisController
                    enabled: root.isSpotifyNode
                    
                    function onVolumeChanged() {
                        if (Math.abs(slider.value - MprisController.volume) > 0.01) {
                            root.node.audio.volume = MprisController.volume;
                        }
                    }
                }

                Component.onCompleted: {
                    if (root.isSpotifyNode && MprisController.canChangeVolume) {
                        if (Math.abs(root.node.audio.volume - MprisController.volume) > 0.01) {
                            root.node.audio.volume = MprisController.volume;
                        }
                    }
                }
            }
        }
    }
}
