import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    anchors.fill: parent
    signal navigateTo(string page)
    Component.onCompleted: {
        pathManager.loadPaths();
    }

    property string selectedSourceFolder: ""
    property string selectedDestinationFolder: ""

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 24
        spacing: 20

        // --- HEADER ---
        ColumnLayout {
            spacing: 4
            Label {
                text: "Organize files manuallyyyyy"
                font.pixelSize: 24
                font.bold: true
                color: "white"
            }
            Label {
                text: "Files will be sorted into folders by their extensions."
                font.pixelSize: 14
                color: "#cccccc"
            }
        }

        // --- ROOT FOLDER SECTION ---
        Rectangle {
            color: "#232323"
            radius: 6
            Layout.fillWidth: true
            height: 120

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 12

                Label {
                    text: "Select root folder manually"
                    font.pixelSize: 16
                    font.bold: true
                    color: "#ffffff"
                }

                RowLayout {
                    spacing: 12
                    Label {
                        text: "Folder path"
                        color: "#EBE5E5"
                        font.pixelSize: 14
                        verticalAlignment: Label.AlignVCenter
                    }

                    TextField {
                        id: srcRootPath
                        placeholderText: "Enter path..."
                        Layout.fillWidth: true
                        font.pixelSize: 13
                        text: pathManager.rootPath
                        verticalAlignment: Text.AlignVCenter
                        background: Rectangle {
                            color: "#2C2D30"
                            radius: 6
                        }
                        color: "#EBE5E5"
                    }

                    Button {
                        text: "Select folder"
                        background: Rectangle { color: "transparent" }
                        contentItem: Text {
                            text: "Select folder"
                            color: "#096D9B"
                            font.underline: true
                        }
              onClicked: {
        var path = folderPicker.pickFolder()
        if (path !== "") {
            srcRootPath.text = path
            pathManager.updateRootPath(path)
        }
    }
                    }
                }

                Label {
                    text: "You need to choose the destination folder manually every time; sorting will not happen automatically."
                    wrapMode: Text.WordWrap
                    font.pixelSize: 12
                    color: "#aaaaaa"
                }
            }
        }

        // --- DESTINATION FOLDER SECTION ---
        Rectangle {
            color: "#232323"
            radius: 6
            Layout.fillWidth: true
            height: 100

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 12

                Label {
                    text: "Choose where to put the organized folder"
                    font.pixelSize: 16
                    font.bold: true
                    color: "#ffffff"
                }

                RowLayout {
                    spacing: 12
                    Label {
                        text: "Your path"
                        color: "#EBE5E5"
                        font.pixelSize: 14
                        verticalAlignment: Label.AlignVCenter
                    }

                    TextField {
                        id: destPath
                        placeholderText: "Enter path..."
                        Layout.fillWidth: true
                        font.pixelSize: 13
                        text: pathManager.destPath
                        verticalAlignment: Text.AlignVCenter
                        background: Rectangle {
                            color: "#2C2D30"
                            radius: 6
                        }
                        color: "#EBE5E5"
                    }

                    Button {
                         text: "Select folder"
                         background: Rectangle { color: "transparent" }
                         contentItem: Text {
                             text: "Select folder"
                             color: "#096D9B"
                             font.underline: true
                         }
                         onClicked: {
                                 var path = folderPicker.pickFolder()
                                 if (path !== "")
                                 pathManager.updateDestPath(path)
                             }
                     }
                }
            }
        }

        Rectangle {
            color: "#1e1e1e"
            radius: 6
            Layout.fillWidth: true
            height: 120

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 10

                Label {
                    text: "Start organizing"
                    font.pixelSize: 16
                    font.bold: true
                    color: "#ffffff"
                }

                Label {
                    text: "Click Organize to start organizing"
                    wrapMode: Text.WordWrap
                    font.pixelSize: 13
                    color: "#aaaaaa"
                }

                Button {
                    text: "Organize"
                    background: Rectangle {
                        color: "#096D9B"
                        radius: 6
                    }
                    onClicked: {
                        if (srcRootPath.text.length > 0 && destPath.text.length > 0) {
                                    fileOrganizer.organize(srcRootPath.text, destPath.text)
                                } else {
                                    console.log("Please select both source and destination folders.")
                                }
                    }
                }
            }
        }

        // --- BACK BUTTON ---
        Rectangle {
            color: "#1e1e1e"
            radius: 6
            Layout.fillWidth: true
            height: 120

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 10

                Label {
                    text: "Automatically Organize Your Files Without Any Manual Setup"
                    font.pixelSize: 16
                    font.bold: true
                    color: "#ffffff"
                }

                Label {
                    text: "Files are sorted automatically after initial setup, with no need to select folders manually each time."
                    wrapMode: Text.WordWrap
                    font.pixelSize: 13
                    color: "#aaaaaa"
                }

                Button {
                    text: "Back"
                    background: Rectangle {
                        color: "#096D9B"
                        radius: 6
                    }
                    onClicked: {
                        Qt.callLater(() => {
                            window.currentPage = "pages/DefaultOrganize/AutoOrganize.qml"
                        })
                    }
                }


            }
        }

        // --- FOOTER ---
        Item { Layout.fillHeight: true }
        Label {
            text: "© ClariFile 2025 - KU CS-I Project Group"
            font.pixelSize: 12
            color: "#666666"
            horizontalAlignment: Text.AlignRight
            Layout.fillWidth: true
        }
    }



}
