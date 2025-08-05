import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: sidebar
    width: 240
    color: "#1E1E1E"

    property string currentView: ""

    signal navigateTo(string page)

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 24

        // Heading Section
        Column {
            width: parent.width
            spacing: 6
            Rectangle { width: parent.width; height: 1; color: "#444" }
            Text {
                text: qsTr("Main Panel")
                font.pixelSize: 14
                font.bold: true
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Rectangle { width: parent.width; height: 1; color: "#444" }
        }

        // Dashboard Button
        Rectangle {
            color: (currentView === "dashboard" || maDashboard.containsMouse) ? "#2A2A2A" : "transparent"
            radius: 4
            width: parent.width
            height: 40
            RowLayout {
                anchors.fill: parent
                anchors.margins: 8
                spacing: 12
                Image { source: "../icons/grid.svg"; width: 20; height: 20; fillMode: Image.PreserveAspectFit }
                Label { text: "Dashboard"; font.pixelSize: 16; color: "white" }
            }
            MouseArea {
                id: maDashboard
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    currentView = "dashboard"
                    navigateTo("")  // empty string means show dashboard
                }
            }
        }

        // Organize Files Heading
        Column {
            width: parent.width
            spacing: 6
            Rectangle { width: parent.width; height: 1; color: "#444" }
            Text {
                text: qsTr("Organize Files")
                font.pixelSize: 14
                font.bold: true
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Rectangle { width: parent.width; height: 1; color: "#444" }
        }

        // Default Organize Button
        Rectangle {
            color: (currentView === "defaultorganize" || maDefault.containsMouse) ? "#2A2A2A" : "transparent"
            radius: 4
            width: parent.width
            height: 40
            RowLayout {
                anchors.fill: parent
                anchors.margins: 8
                spacing: 12
                Image { source: "../icons/auto-organize.svg"; width: 20; height: 20; fillMode: Image.PreserveAspectFit }
                Label { text: "Default Organizing"; font.pixelSize: 16; color: "white" }
            }
            MouseArea {
                id: maDefault
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    currentView = "defaultorganize"
                    navigateTo("pages/DefaultOrganize/AutoOrganize.qml")
                }
            }
        }

        // Custom Organize
        Rectangle {
            color: (currentView === "customorganize" || maCustom.containsMouse) ? "#2A2A2A" : "transparent"
            radius: 4
            width: parent.width
            height: 40
            RowLayout {
                anchors.fill: parent
                anchors.margins: 8
                spacing: 12
                Image { source: "../icons/file-text.svg"; width: 20; height: 20; fillMode: Image.PreserveAspectFit }
                Label { text: "Custom Organizing"; font.pixelSize: 16; color: "white" }
            }
            MouseArea {
                id: maCustom
                anchors.fill: parent
                hoverEnabled: true
          onClicked: {
              console.log("hey")
               currentView = "customorganize"
                    navigateTo("pages/CustomOrganize.qml")
                }
            }
        }

        // Shredder Heading
        Column {
            width: parent.width
            spacing: 6
            Rectangle { width: parent.width; height: 1; color: "#444" }
            Text {
                text: qsTr("Clean up files permanently")
                font.pixelSize: 14
                font.bold: true
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Rectangle { width: parent.width; height: 1; color: "#444" }
        }

        // File Shredder
        Rectangle {
            color: (currentView === "fileShredder" || maShred.containsMouse) ? "#2A2A2A" : "transparent"
            width: parent.width
            height: 40
            RowLayout {
                anchors.fill: parent
                anchors.margins: 8
                spacing: 12
                Image { source: "../icons/file-remove.svg"; width: 20; height: 20; fillMode: Image.PreserveAspectFit }
                Label { text: "File Shredder"; font.pixelSize: 16; color: "#CCCCCC" }
            }
            MouseArea {
                id: maShred
                anchors.fill: parent
                hoverEnabled: true
                   onClicked: {
               currentView = "fileShredder"
                    navigateTo("pages/FileShredder.qml")
                }
            }
        
        }
        // Junk Cleaner Heading
        Column {
            width: parent.width
            spacing: 6
            Rectangle { width: parent.width; height: 1; color: "#444" }
            Text {
                text: qsTr("Clean up the junk files")
                font.pixelSize: 14
                font.bold: true
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Rectangle { width: parent.width; height: 1; color: "#444" }
        }

        // Junk cleaner
        Rectangle {
            color: (currentView === "junkCleaner" || junkClean.containsMouse) ? "#2A2A2A" : "transparent"
            width: parent.width
            height: 40
            RowLayout {
                anchors.fill: parent
                anchors.margins: 8
                spacing: 12
                Image { source: "../icons/file-remove.svg"; width: 20; height: 20; fillMode: Image.PreserveAspectFit }
                Label { text: "Junk Cleaner"; font.pixelSize: 16; color: "#CCCCCC" }
            }
            MouseArea {
                id: junkClean
                anchors.fill: parent
                hoverEnabled: true
                   onClicked: {
               currentView = "junkCleaner"
                    navigateTo("pages/JunkCleaner.qml")
                }
            }
        
        }

        Item { Layout.fillHeight: true }
    }

    
}
