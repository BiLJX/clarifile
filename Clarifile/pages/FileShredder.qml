// FileShredder.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 6.3






Item {
    anchors.fill: parent
property string selectedFilePath: ""
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 24
        spacing: 20

        // Header
        ColumnLayout {
            spacing: 4

            Label {
                text: "File Shredder"
                font.pixelSize: 24
                font.bold: true
                color: "white"
            }

            Label {
                text: "Permanently deletes files so they cannot be recovered."
                font.pixelSize: 14
                color: "#cccccc"
            }
        }

        // Add items section
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
                    text: "Add items"
                    font.pixelSize: 16
                    font.bold: true
                    color: "#ffffff"
                }

                RowLayout {
                    spacing: 12

                    Label {
                        text: "File Select"
                        color: "#EBE5E5"
                        font.pixelSize: 14
                        verticalAlignment: Label.AlignVCenter
                    }

                    TextField {
                        id: filePathInput
                        placeholderText: "Select File which you want to shred"
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

                    FileDialog {
                            id: fileDialog
                            title: "Select a file to shred"
                            fileMode: FileDialog.OpenFile
                            onAccepted: {
                                selectedFilePath = selectedFile
                                console.log("Selected file:", selectedFilePath)
                                filePathInput.placeholderText = selectedFilePath
                                 // Call shred on selection
                            }
                        }

                    Button {
                        text: "Select File"
                        background: Rectangle {
                            color: "#096D9B"
                            radius: 6
                        }
                        onClicked: {
                            onClicked: fileDialog.open()
                        }
                    }
                }
            }
        }

//         // Select Multiple files box (now with dynamic height)
//         Rectangle {
//             id: multiSelectBox
//             color: "#1e1e1e"
//             radius: 6
//             Layout.fillWidth: true
//             // height removed to allow dynamic sizing
//             Layout.preferredHeight: multipleFilesList.implicitHeight + 140  // 140 for the static content above + spacing

//             ColumnLayout {
//                 anchors.fill: parent
//                 anchors.margins: 16
//                 spacing: 8

//                 Label {
//                     text: "Select Multiple files"
//                     font.pixelSize: 16
//                     font.bold: true
//                     color: "#ffffff"
//                 }

//                 RowLayout {
//                     spacing: 12

//                     Image {
//                         source: "../icons/file-multiple.svg"
//                         width: 24
//                         height: 24
//                         fillMode: Image.PreserveAspectFit
//                     }

//                     Label {
//                         text: "Choose several files to permanently remove together."
//                         font.pixelSize: 13
//                         color: "#CCCCCC"
//                         wrapMode: Text.WordWrap
//                         Layout.fillWidth: true
//                     }
//                 }

//                 Button {
//                     text: "Select Multiple"
//                     background: Rectangle {
//                         color: "#096D9B"
//                         radius: 6
//                     }
//                     onClicked: {
//                         // logic here
//                     }
//                 }

//                 // Selected files list
//      // Selected files list with fixed right alignment and horizontal line
// ColumnLayout {
//     id: multipleFilesList
//     Layout.fillWidth: true
//     spacing: 8
//     anchors.topMargin: 8

//     // Demo file 1
//     RowLayout {
//         Layout.fillWidth: true
//         spacing: 12

//         ColumnLayout {
//             Layout.fillWidth: true
//             spacing: 2

//             Label {
//                 text: "example.jpg"
//                 font.pixelSize: 16
//                 font.bold: true
//                 color: "white"
//                 elide: Text.ElideRight
//                 Layout.fillWidth: true
//             }

//             Label {
//                 text: "C:\\Users\\Lenovo\\Music\\FlashIntegro\\VoiceRecorder"
//                 font.pixelSize: 12
//                 color: "#BBBBBB"
//                 elide: Text.ElideRight
//                 Layout.fillWidth: true
//             }
//         }

//         // Spacer to push size and remove right
//         Item { Layout.fillWidth: true }

//         Label {
//             text: "12.5 MB"
//             font.pixelSize: 14
//             color: "#CCCCCC"
//             verticalAlignment: Label.AlignVCenter
//             horizontalAlignment: Label.AlignRight
//             Layout.preferredWidth: 70
//         }

//         Label {
//             text: "Remove"
//             font.pixelSize: 14
//             color: "#FF5555"
//             verticalAlignment: Label.AlignVCenter
//             horizontalAlignment: Label.AlignRight
//             Layout.preferredWidth: 70

//             MouseArea {
//                 anchors.fill: parent
//                 onClicked: {
//                     // remove logic placeholder
//                 }
//             }
//         }
//     }
//     // Horizontal line
//     Rectangle {
//         color: "#444444"
//         height: 1
//         Layout.fillWidth: true
//         Layout.topMargin: 12
//     }
//     // Demo file 2
//     RowLayout {
//         Layout.fillWidth: true
//         spacing: 12

//         ColumnLayout {
//             Layout.fillWidth: true
//             spacing: 2

//             Label {
//                 text: "photo.png"
//                 font.pixelSize: 16
//                 font.bold: true
//                 color: "white"
//                 elide: Text.ElideRight
//                 Layout.fillWidth: true
//             }

//             Label {
//                 text: "D:\\Downloads\\Images"
//                 font.pixelSize: 12
//                 color: "#BBBBBB"
//                 elide: Text.ElideRight
//                 Layout.fillWidth: true
//             }
//         }

//         Item { Layout.fillWidth: true }

//         Label {
//             text: "4.3 MB"
//             font.pixelSize: 14
//             color: "#CCCCCC"
//             verticalAlignment: Label.AlignVCenter
//             horizontalAlignment: Label.AlignRight
//             Layout.preferredWidth: 70
//         }

//         Label {
//             text: "Remove"
//             font.pixelSize: 14
//             color: "#FF5555"
//             verticalAlignment: Label.AlignVCenter
//             horizontalAlignment: Label.AlignRight
//             Layout.preferredWidth: 70

//             MouseArea {
//                 anchors.fill: parent
//                 onClicked: {
//                     // remove logic placeholder
//                 }
//             }
//         }
//     }
//     // Horizontal line
//     Rectangle {
//         color: "#444444"
//         height: 1
//         Layout.fillWidth: true
//         Layout.topMargin: 12
//     }
//     // Demo file 3
//     RowLayout {
//         Layout.fillWidth: true
//         spacing: 12

//         ColumnLayout {
//             Layout.fillWidth: true
//             spacing: 2

//             Label {
//                 text: "document.pdf"
//                 font.pixelSize: 16
//                 font.bold: true
//                 color: "white"
//                 elide: Text.ElideRight
//                 Layout.fillWidth: true
//             }

//             Label {
//                 text: "E:\\Work\\Projects\\Reports"
//                 font.pixelSize: 12
//                 color: "#BBBBBB"
//                 elide: Text.ElideRight
//                 Layout.fillWidth: true
//             }
//         }

//         Item { Layout.fillWidth: true }

//         Label {
//             text: "850 KB"
//             font.pixelSize: 14
//             color: "#CCCCCC"
//             verticalAlignment: Label.AlignVCenter
//             horizontalAlignment: Label.AlignRight
//             Layout.preferredWidth: 70
//         }

//         Label {
//             text: "Remove"
//             font.pixelSize: 14
//             color: "#FF5555"
//             verticalAlignment: Label.AlignVCenter
//             horizontalAlignment: Label.AlignRight
//             Layout.preferredWidth: 70

//             MouseArea {
//                 anchors.fill: parent
//                 onClicked: {
//                     // remove logic placeholder
//                 }
//             }
//         }
//     }

//     // Horizontal line
//     Rectangle {
//         color: "#444444"
//         height: 1
//         Layout.fillWidth: true
//         Layout.topMargin: 12
//     }
// }

//             }
//         }

        // Warning text
        RowLayout {
            spacing: 10
            Layout.fillWidth: true

            Image {
                source: "../icons/warning.svg"
                width: 20
                height: 20
                fillMode: Image.PreserveAspectFit
            }

            Label {
                text: "Files you delete will be permanently removed and cannot be restored."
                font.pixelSize: 16
                color: "#aaaaaa"
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
            }
        }

      Button {

    Layout.alignment: Qt.AlignRight
    implicitWidth: 200
    implicitHeight: 40
    padding: 16
    font.pixelSize: 16
    hoverEnabled: true

    background: Rectangle {
         color: "#B00020"
        radius: 8
    }

    contentItem: Text {
        text: "Delete permanently"
        anchors.centerIn: parent
        color: "white"
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    onClicked: {
        fileShredder.shred(selectedFilePath, 3)
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
