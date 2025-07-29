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
                text: "Organize files manually"
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
        font.pixelSize: 14  // adjust size as needed
        verticalAlignment: Label.AlignVCenter
    }


             TextField {
    id: autoRootPath
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
        text: "Select folder"

        color: "#096D9B"
        font.underline: true

    }
    onClicked: {
        // folder picker logic here
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
        font.pixelSize: 14  // adjust size as needed
        verticalAlignment: Label.AlignVCenter
    }


             TextField {
    id: autoRootPathII
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
        // folder picker logic here
    }
}



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
        color: "#096D9B" // Blue background
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
