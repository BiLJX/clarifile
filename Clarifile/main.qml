import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15

ApplicationWindow {
    id: window
    width: 960
    height: 640
    visible: true
    title: qsTr("ClariFile")
    color: "#121212"
    property string currentView: "dashboard"

    // Top bar
    Rectangle {
        id: topBar
        height: 48
        width: parent.width
        color: "#1E1E1E"
        anchors.top: parent.top

        RowLayout {
            anchors.fill: parent
            anchors.margins: 12

            Text {
                text: "ClariFile"
                font.pixelSize: 20
                font.bold: true
                color: "white"
            }

            Item { Layout.fillWidth: true }

            Button {
                width: 36; height: 36
                background: Rectangle {
                    color: "#2E2E2E"
                    radius: 18
                }
                contentItem: Image {
                    source: "icons/help.svg"
                    width: 20; height: 20
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                }
            }
            Button {
                width: 20; height: 20
                background: Rectangle {
                    color: "#2E2E2E"
                    radius: 18
                }
                contentItem: Image {
                    source: "icons/user-circle.svg"
                    width: 20; height: 20
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                }
            }
        }
    }

    RowLayout {
        anchors {
            top: topBar.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        // Sidebar
        Rectangle {
            id: sidebar
            width: 240
            color: "#1E1E1E"
            Layout.fillHeight: true

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 24

                // Dashboard Button
                Rectangle {
                    id: dashboardBtn
                    color: (window.currentView === "dashboard" || maDashboard.containsMouse) ? "#2A2A2A" : "transparent"
                    radius: 4
                    width: parent.width
                    height: 40

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 8
                        spacing: 12
                        Image {
                            source: "icons/grid.svg"
                            width: 20; height: 20
                            fillMode: Image.PreserveAspectFit
                        }
                        Label {
                            text: qsTr("Dashboard")
                            font.pixelSize: 16
                            color: "white"
                        }
                    }

                    MouseArea {
                        id: maDashboard
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: window.currentView = "dashboard"
                    }
                }

                // Organize Files

                ColumnLayout {
                    spacing: 4
                    RowLayout {
                        spacing: 8
                        Image {
                            source: "icons/file-text.svg"
                            width: 20; height: 20
                            fillMode: Image.PreserveAspectFit
                        }
                        Label {
                            text: qsTr("Organize Files")
                            font.pixelSize: 16
                            color: "#CCCCCC"
                        }
                    }

                    Item { Layout.preferredHeight: 10 }

                    ColumnLayout {
                        anchors.left: parent.left
                        anchors.leftMargin: 54
                        spacing: 4
                        Label { text: qsTr("Default Organizing"); font.pixelSize: 14; color: "#AAAAAA" }
                        Label { text: qsTr("Custom Organizing"); font.pixelSize: 14; color: "#AAAAAA" }
                    }
                }

                // File Shredder
                
                Rectangle {
                    color: (window.currentView === "fileShredder" || maShredder.containsMouse) ? "#2A2A2A" : "transparent"
                    width: parent.width
                    height: 40
                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 8
                        spacing: 4
                        Image {
                            source: "icons/file-remove.svg"
                            width: 20; height: 20
                            fillMode: Image.PreserveAspectFit
                        }
                        Label {
                            text: qsTr("File Shredder")
                            font.pixelSize: 16
                            color: "#CCCCCC"
                        }
                    }

                    MouseArea {
                        id: maShredder
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: window.currentView = "fileShredder"
                    }
                }

                Item { Layout.fillHeight: true }
            }
        }

        // Main Content
        Rectangle {
            id: content
            color: "#121212"
            Layout.fillWidth: true
            Layout.fillHeight: true

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 24
                spacing: 20

                // Header
                ColumnLayout {
                    spacing: 4
                    Text {
                        text: qsTr("Your system is clean")
                        font.pixelSize: 28
                        font.bold: true
                        color: "white"
                    }
                    Text {
                        text: qsTr("We are looking at your folders & files")
                        font.pixelSize: 14
                        color: "#AAAAAA"
                    }
                }

                // Recommendations
                Rectangle {
                    color: "#232323"
                    radius: 6
                    Layout.fillWidth: true
                    height: 120

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 16
                        spacing: 8

                        Text { text: qsTr("Recommendations"); font.pixelSize: 16; font.bold: true; color: "white" }

                        RowLayout {
                            spacing: 12
                            Image {
                                source: "icons/lightbulb.svg"
                                width: 16; height: 16
                                fillMode: Image.PreserveAspectFit
                            }
                            Label {
                                text: qsTr("Consider organizing your Desktop folder")
                                font.pixelSize: 14
                                color: "#CCCCCC"
                            }
                        }

                        RowLayout {
                            spacing: 12
                            Image {
                                source: "icons/file-text.svg"
                                width: 16; height: 16
                                fillMode: Image.PreserveAspectFit
                            }
                            Label {
                                text: qsTr("Unused ZIP files detected in Downloads")
                                font.pixelSize: 14
                                color: "#CCCCCC"
                            }
                        }
                    }
                }

                // Cards Grid
                GridLayout {
                    columns: 2
                    rowSpacing: 20
                    columnSpacing: 20
                    Layout.fillWidth: true
                    Layout.preferredHeight: 300

                    // Documentation
                    Rectangle {
                        color: "#232323"
                        radius: 6
                        Layout.fillWidth: true
                        Layout.preferredHeight: 120

                        ColumnLayout {
                            anchors.centerIn: parent
                            spacing: 8
                            Image {
                                source: "icons/file-blue.svg"
                                width: 54; height: 54
                                fillMode: Image.PreserveAspectFit
                                Layout.alignment: Qt.AlignHCenter
                            }
                            Label {
                                text: qsTr("Documentation")
                                font.pixelSize: 16
                                color: "white"
                                Layout.alignment: Qt.AlignLeft
                                width: parent.width * 0.8
                            }
                        }
                    }

                    // Tutorials
                    Rectangle {
                        color: "#232323"
                        radius: 6
                        Layout.fillWidth: true
                        Layout.preferredHeight: 120

                        ColumnLayout {
                            anchors.centerIn: parent
                            spacing: 8
                            Image {
                                source: "icons/play-circle.svg"
                                width: 54; height: 54
                                fillMode: Image.PreserveAspectFit
                                Layout.alignment: Qt.AlignHCenter
                            }
                            Label {
                                text: qsTr("Our Tutorials")
                                font.pixelSize: 16
                                color: "white"
                                Layout.alignment: Qt.AlignLeft
                                width: parent.width * 0.8
                            }
                        }
                    }

                    // How it Works
                    Rectangle {
                        color: "#232323"
                        radius: 6
                        Layout.fillWidth: true
                        Layout.preferredHeight: 120

                        ColumnLayout {
                            anchors.centerIn: parent
                            spacing: 8
                            Image {
                                source: "icons/bulb-blue.svg"
                                width: 54; height: 54
                                fillMode: Image.PreserveAspectFit
                                Layout.alignment: Qt.AlignHCenter
                            }
                            Label {
                                text: qsTr("How it Works")
                                font.pixelSize: 16
                                color: "white"
                                Layout.alignment: Qt.AlignLeft
                                width: parent.width * 0.8
                            }
                        }
                    }

                    // Preferences
                    Rectangle {
                        color: "#232323"
                        radius: 6
                        Layout.fillWidth: true
                        Layout.preferredHeight: 120

                        ColumnLayout {
                            anchors.centerIn: parent
                            spacing: 8
                            Image {
                                source: "icons/settings.svg"
                                width: 54; height: 54
                                fillMode: Image.PreserveAspectFit
                                Layout.alignment: Qt.AlignHCenter
                                
                            }
                            Label {
                                text: qsTr("Preferences")
                                font.pixelSize: 16
                                color: "white"
                                Layout.alignment: Qt.AlignLeft
                                width: parent.width * 0.8
                            }
                        }
                    }
                }

                Item { Layout.fillHeight: true }

                Text {
                    text: qsTr("Last Organized: July 28, 2025")
                    font.pixelSize: 12
                    color: "#666666"
                    horizontalAlignment: Text.AlignRight
                    Layout.fillWidth: true
                }
            }
        }
    }
}
