import QtQuick 2.0
//import ZetaSurgical.Types 1.0

Item {
    id: root

    property bool view6layout: false

    Loader {
        anchors.fill: parent
        sourceComponent: {
            return root.view6layout ?  d.layout6views : d.layout4views;
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.view6layout = !view6layout
    }

    QtObject {
        id: d
        property Component layout6views: Component {
            Repeater {
                model: [ d.view1, d.view2, d.view3, d.view4, d.view5, d.view6 ]
                Loader {
                    id: loader
                    x: (index % 3) * width
                    y: Math.floor(index / 3) * (root.height / 2)
                    sourceComponent: modelData
                    onLoaded: {
                        item.width = root.width / 3
                        item.height = root.height / 2
                    }
                }
            }
        }

        property Component layout4views: Component {
            Item {
                Column {
                    id: column
                    Repeater {
                        model: [ d.view1, d.view2, d.view3 ]
                        Loader {
                            id: loader
                            sourceComponent: modelData
                            onLoaded: {
                                item.width = 534
                                item.height = root.height / 3
                            }
                        }
                    }
                }
                Loader {
                    id: aaa
                    anchors {
                        left: column.right
                        top: parent.top
                        bottom: parent.bottom
                        right: parent.right
                    }
                    sourceComponent: d.view4
                    onLoaded: {
                        item.width = aaa.width
                        item.height = aaa.height
                    }
                }
            }
        }

        property Component view1: Component {
            Rectangle {
                color: "red"
                // This can be VTK window
                //Component.onCompleted: PlanningPresenter.setVTKItem(root, 1)
            }
        }
        property Component view2: Component {
            Rectangle {
                color: "yellow"
                // This can be VTK window
                //Component.onCompleted: PlanningPresenter.setVTKItem(root, 2)
            }
        }
        property Component view3: Component {
            Rectangle {
                color: "orange"
                // This can be VTK window
                //Component.onCompleted: PlanningPresenter.setVTKItem(root, 3)
            }
        }
        property Component view4: Component {
            Rectangle {
                color: "green"
                // This can be VTK window
                //Component.onCompleted: PlanningPresenter.setVTKItem(root, 4)
            }
        }
        property Component view5: Component {
            Rectangle {
                color: "blue"
                // This can be VTK window
                //Component.onCompleted: PlanningPresenter.setVTKItem(root, 5)
            }
        }
        property Component view6: Component {
            Rectangle {
                color: "cyan"
                // This can be VTK window
                //Component.onCompleted: PlanningPresenter.setVTKItem(root, 6)
            }
        }
    }
}
