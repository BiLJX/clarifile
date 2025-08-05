import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import "common"  // import SideNav.qml

ApplicationWindow {
    id: window
    width: 1160
    height: 740
    visible: true
    title: qsTr("ClariFile")
    color: "#121212"

    property string currentView: "dashboard"
    property string currentPage: ""  // empty = dashboard visible

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
            // Removed buttons here
        }
    }

    RowLayout {
        anchors {
            top: topBar.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        // Side navigation panel
        SideNav {
            id: sidenav
            Layout.fillHeight: true
            currentView: window.currentView
            onCurrentViewChanged: window.currentView = currentView

            onNavigateTo: {
                if (page === "") {
                    window.currentPage = ""
                    window.currentView = "dashboard"
                } else {
                    window.currentPage = page
                    window.currentView = "" // clear dashboard view
                }
            }
        }

        // Main content area
        Rectangle {
            id: content
            color: "#121212"
            Layout.fillWidth: true
            Layout.fillHeight: true

            // Dashboard content, visible only if no page loaded
            Item {
                id: dashboardContent
                anchors.fill: parent
                visible: window.currentPage === ""

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 24
                    spacing: 20

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

                    // Recommendations box
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

                    // Realtime dashboard data
                    Rectangle {
                        color: "#232323"
                        radius: 6
                        Layout.fillWidth: true
                        height: 140

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 16
                            spacing: 12

                            Text {
                                text: qsTr("Live Dashboard")
                                font.pixelSize: 18
                                font.bold: true
                                color: "white"
                            }

                            RowLayout {
                                spacing: 20

                                ColumnLayout {
                                    spacing: 4
                                    Label {
                                        text: qsTr("Root Path:")
                                        font.pixelSize: 14
                                        color: "#AAAAAA"
                                    }
                                    Label {
                                        text: pathManager.rootPath
                                        font.pixelSize: 14
                                        color: "white"
                                    }
                                }

                                ColumnLayout {
                                    spacing: 4
                                    Label {
                                        text: qsTr("Destination Path:")
                                        font.pixelSize: 14
                                        color: "#AAAAAA"
                                    }
                                    Label {
                                        text: pathManager.destPath
                                        font.pixelSize: 14
                                        color: "white"
                                    }
                                }
                            }
                        }
                    }

                    Item { Layout.fillHeight: true }

                    Text {
                        text: qsTr("© ClariFile 2025 - KU CS-I Project Group")
                        font.pixelSize: 12
                        color: "#666666"
                        horizontalAlignment: Text.AlignRight
                        Layout.fillWidth: true
                    }
                }
            }

            // Loader for other pages
            Loader {
                id: pageLoader
                anchors.fill: parent
                source: window.currentPage
                visible: window.currentPage !== ""
            }
        }
    }
}
