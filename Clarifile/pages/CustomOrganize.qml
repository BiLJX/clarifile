// CustomOrganize.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    anchors.fill: parent

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 24
        spacing: 20

        // Header
        ColumnLayout {
            spacing: 4

            Label {
                text: "Custom organize your files"
                font.pixelSize: 24
                font.bold: true
                color: "white"
            }

            Label {
                text: "Get started with sorting your files"
                font.pixelSize: 14
                color: "#cccccc"
            }
        }

        // Top controls: Source folder and Category selection
        RowLayout {
            spacing: 20
            Layout.fillWidth: true

            // Source Folder Block
            Rectangle {
                color: "#232323"
                radius: 6
                Layout.fillWidth: true
                Layout.preferredWidth: parent.width / 2 - 10
                height: 100

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 10

                    Label {
                        text: "Source Folder"
                        font.pixelSize: 16
                        font.bold: true
                        color: "#ffffff"
                    }

                    RowLayout {
                        spacing: 12

                        TextField {
                            id: sourcePath
                            placeholderText: "Enter path....."
                            Layout.fillWidth: true
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
                                text: "Select folder"
                                color: "#096D9B"
                                font.underline: true
                            }
                            onClicked: {
                                    var path = folderPicker.pickFolder()
                                    if (path !== "")
                                    sourcePath.text = path
                                }
                        }
                    }
                }
            }

            // File Categories to Organize Block
            Rectangle {
                color: "#232323"
                radius: 6
                Layout.fillWidth: true
                Layout.preferredWidth: parent.width / 2 - 10
                height: 100

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 10

                    Label {
                        text: "File Categories to Organize"
                        font.pixelSize: 16
                        font.bold: true
                        color: "#ffffff"
                    }

                    RowLayout {
                        spacing: 12
                        ComboBox {
                            id: categorySelector
                            model: ["Images", "Videos", "Documents"]
                            Layout.preferredWidth: 150
                        }

                        TextField {
                            id: customCategory
                            placeholderText: "Type here...."
                            Layout.fillWidth: true
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
                    }
                }
            }
        }

        // Destination folders section
        Rectangle {
            color: "#1e1e1e"
            radius: 6
            Layout.fillWidth: true
            height: 180

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 12

                Label {
                    text: "Choose Destination Folders for Each Category"
                    font.pixelSize: 16
                    font.bold: true
                    color: "#ffffff"
                }

          

                // Manual rows
                RowLayout {
                    spacing: 12
                    Layout.fillWidth: true
                    Label {
                        text: "Images"
                        font.pixelSize: 14
                        color: "#EBE5E5"
                        Layout.preferredWidth: 80
                    }

                    TextField {
                        id: imagesPath
                        Layout.fillWidth: true
                        placeholderText: "Choose path....."
                        height: 48
                        font.pixelSize: 13
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
                            text: "Choose Path"
                            color: "#096D9B"
                            font.underline: true
                        }
                        onClicked: {
                                var path = folderPicker.pickFolder()
                                if (path !== "")
                                imagesPath.text = path
                            }

                    }
                }

                RowLayout {
                    spacing: 12
                    Layout.fillWidth: true
                    Label {
                        text: "Videos"
                        font.pixelSize: 14
                        color: "#EBE5E5"
                        Layout.preferredWidth: 80
                    }

                    TextField {
                        id: videosPath
                        Layout.fillWidth: true
                        placeholderText: "Choose path....."
                        height: 48
                        font.pixelSize: 13
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
                            text: "Choose Path"
                            color: "#096D9B"
                            font.underline: true
                        }
                        onClicked: {
                                var path = folderPicker.pickFolder()
                                if (path !== "")
                                videosPath.text = path
                            }
                    }
                }

                RowLayout {
                    spacing: 12
                    Layout.fillWidth: true
                    Label {
                        text: "Documents"
                        font.pixelSize: 14
                        color: "#EBE5E5"
                        Layout.preferredWidth: 80
                    }

                    TextField {
                        id: documentsPath
                        Layout.fillWidth: true
                        placeholderText: "Choose path....."
                        height: 48
                        font.pixelSize: 13
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
                            text: "Choose Path"
                            color: "#096D9B"
                            font.underline: true
                        }
                        onClicked: {
                                var path = folderPicker.pickFolder()
                                if (path !== "")
                                documentsPath.text = path
                            }
                    }
                }
            }
        }

//test of that success or faliure popup


            Label {
                    text: "Testing of Success and faliure (remove this label after logic implementation)"
                    font.pixelSize: 16
         
                    color: "#ffffff"
                }


        // Organize Button
        Button {
            text: "Start Organizing"
            Layout.alignment: Qt.AlignLeft
            background: Rectangle {
                color: "#007BCE"
                radius: 6
            }
            font.pixelSize: 14
            padding: 12
           
            onClicked: {
        var component = Qt.createComponent("SuccessOrFailure.qml")
        if (component.status === Component.Ready) {
            var popup = component.createObject(window)
            popup.open()
        } else {
            console.log("Failed to load dialog:", component.errorString())
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
