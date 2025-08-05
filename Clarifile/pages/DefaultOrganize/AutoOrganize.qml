import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    anchors.fill: parent
    signal navigateTo(string page)

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 24
        spacing: 20

        // Header
        ColumnLayout {
            spacing: 4

            Label {
                text: "Ready to auto-organize files?"
                font.pixelSize: 24
                font.bold: true
                color: "white"
            }

            Label {
                text: "Files will be sorted into folders by their extensions."
                font.pixelSize: 14
                color: "#cccccc"
            }

            RowLayout {
                spacing: 20
                Layout.fillWidth: true
                Button {
                    padding: 0
                    contentItem: Text {
                        text: "Save"
                        color: "#096D9B"
                        font.underline: true
                    }
                    onClicked: {
                        pathManager.updateAutoRootPath(autoRootPath.text)
                        pathManager.updateAutoDestPath(autoDestPath.text)
                    }
                }
                Button {
                        padding: 0
                        contentItem: Text {
                            text: "Load Saved"
                            color: "#096D9B"
                            font.underline: true
                        }
                        onClicked: {
                            autoRootPath.text = pathManager.autoRootPath
                            autoDestPath.text = pathManager.autoDestPath
                        }
                    }
            }

        }

        // Auto Root Folder Section
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
                    text: "Select Auto root folder"
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
    id: autoRootPath
    placeholderText: "Enter path....."
    Layout.fillWidth: true
  Layout.fillHeight: true
    height: 48                  // taller box
    font.pixelSize: 13        // bigger font
    verticalAlignment: Text.AlignVCenter

    background: Rectangle {
        anchors.fill: parent
        color: "#2C2D30"
        radius: 6
    }

    palette.placeholderText: "#EBE5E5"
    color: "#EBE5E5"
}


              Button {
    padding: 0

    contentItem: Text{
        text: "Select folder"
        color: "#096D9B"
        font.underline: true

    }
    onClicked: {
            var path = folderPicker.pickFolder()
            if (path !== "")
            autoRootPath.text = path
        }
}
                }

                Label {
                    text: "This will take destination once then, automatically sort each time the new file is created on that folder"
                    wrapMode: Text.WordWrap
                    font.pixelSize: 12
                    color: "#aaaaaa"
                }
            }
        }

        // Organized Folder Output Section
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
    id: autoDestPath
    placeholderText: "Enter path....."
    Layout.fillWidth: true
  Layout.fillHeight: true
    height: 48              
    font.pixelSize: 13 
    verticalAlignment: Text.AlignVCenter

    background: Rectangle {
        anchors.fill: parent
        color: "#2C2D30"
        radius: 6
    }

    palette.placeholderText: "#EBE5E5"
    color: "#EBE5E5"
}


                  Button {
    padding: 0

    contentItem: Text {
        text: "Select Path"

        color: "#096D9B"
        font.underline: true

    }
    onClicked: {
            var path = folderPicker.pickFolder()
            if (path !== "")
            autoDestPath.text = path
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
                    text: "Start Organizing"
                    font.pixelSize: 16
                    font.bold: true
                    color: "#ffffff"
                }

                // Label {
                //     text: "You need to choose the folder manually each time you organize files. Automatic selection is not enabled."
                //     wrapMode: Text.WordWrap
                //     font.pixelSize: 13
                //     color: "#aaaaaa"
                // }

                Button {
                    text: "Start Auto-Organizing"
                    background: Rectangle {
                        color: "#096D9B"
                        radius: 6
                    }
                    onClicked: {
                        if (autoRootPath.text.length > 0 && autoDestPath.text.length > 0) {
                                    fileOrganizer.startAutoOrganizing(autoRootPath.text, autoDestPath.text, 5000) // every 5 seconds
                                }
                    }
                }
                Button {
                    text: "Stop Auto-Organizing"
                    background: Rectangle {
                        color: "#f00"
                        radius: 6
                    }
                    onClicked: fileOrganizer.stopAutoOrganizing()
                }
            }
        }

        // Manual Setup Box
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
                    text: "Set up manually—only once for each"
                    font.pixelSize: 16
                    font.bold: true
                    color: "#ffffff"
                }

                Label {
                    text: "You need to choose the folder manually each time you organize files. Automatic selection is not enabled."
                    wrapMode: Text.WordWrap
                    font.pixelSize: 13
                    color: "#aaaaaa"
                }

                Button {
                    text: "Open"
                    background: Rectangle {
                        color: "#096D9B"
                        radius: 6
                    }
                    onClicked: {
                        Qt.callLater(() => {
                            window.currentPage = "pages/DefaultOrganize/ManualOrganize.qml"
                        })
                    }
                }
            }
        }

        // Footer
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
