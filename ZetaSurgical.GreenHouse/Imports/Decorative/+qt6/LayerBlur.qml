import QtQuick 2.0
import Qt5Compat.GraphicalEffects

//PREVIEW IMAGE qrc:/DecorativeComponentSet/PreviewAssets/dropShadowRect.png
Item {
    id: root

    //REAL 32.0
    property alias radius: blur.radius

    Item {
        id: layerBuffer

        anchors.fill: parent

        function populateLayers() {
            var layers = [];

            if (root.visible) {
                // NOTE: Looking for the item's parent layer
                var parentLayer = null
                var candidate = root.parent
                while (parentLayer === null && candidate !== null) {
                    if (candidate.layerName !== undefined) {
                        parentLayer = candidate;
                    } else {
                        candidate = candidate.parent
                    }
                }

                if (parentLayer !== null && parentLayer.parent !== null) {
                    // NOTE: Finding all layers with a lower z than the item's parent layer
                    var layerContainer = parentLayer.parent
                    for (var i = 0; i < layerContainer.children.length; ++i) {
                        if (layerContainer.children[i] !== parentLayer && layerContainer.children[i].z < parentLayer.z
                                && layerContainer.children[i].layerName !== undefined) {
                            layers.push(layerContainer.children[i])
                        }
                    }
                }
            }

            layerRepeater.model = layers;
        }

        Repeater {
            id: layerRepeater

            Item {
                id: layer

                property Item layerItem: layerRepeater.model[index]
                property point pos: layerItem ? layerItem.mapToItem(layerBuffer, 0, 0) : Qt.point(0, 0)

                anchors.fill: parent
                z: layerItem ? layerItem.z : 0

                ShaderEffectSource {
                    id: layerSrc

                    sourceItem: layer.layerItem
                    sourceRect: Qt.rect(layer.pos.x, layer.pos.y, layer.width, layer.height)
                    hideSource: false
                }

                ShaderEffect {
                    property var src: layerSrc

                    anchors.fill: parent
                    vertexShader: "LayerBlur.vert.qsb"
                    fragmentShader: "LayerBlur.frag.qsb"
                }
            }
        }
    }

    FastBlur {
        id: blur

        anchors.fill: parent

        radius: 32.0
        source: layerBuffer
    }

    onVisibleChanged: layerBuffer.populateLayers();
}
