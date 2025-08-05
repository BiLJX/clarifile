import QtQuick 2.15 
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    anchors.fill: parent
    // Background color for the entire page
    Rectangle {
        anchors.fill: parent
        color: "#121212"
    }

    signal navigateTo(string page)

    property bool scanCompleted: false
    property bool cleaning: false
    property bool confirmedToDelete: false
    property bool cleaningDone: false
    property string statusText: ""

    ColumnLayout {
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            right: parent.right
            margins: 40
        }
        spacing: 32
        width: Math.min(parent.width - 80, 700)
        anchors.horizontalCenter: parent.horizontalCenter

        // Header Section
        ColumnLayout {
            spacing: 6
            Label {
                text: "Junk Cleaner"
                font.pixelSize: 30
                font.bold: true
                color: "white"
                horizontalAlignment: Text.AlignLeft
            }
            Label {
                text: "Scan and delete temporary files to free up disk space."
                font.pixelSize: 16
                color: "#bbbbbb"
                horizontalAlignment: Text.AlignLeft
                wrapMode: Text.Wrap
            }
        }

        // Main content box (bigger)
        Rectangle {
            color: "#1E1E1E"
            radius: 10
            Layout.fillWidth: true
            Layout.preferredHeight: 480
            smooth: true

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 24
                spacing: 20

                RowLayout {
                    spacing: 16
                    Button {
                        text: "Scan for Junk"
                        enabled: !cleaning && !confirmedToDelete && !cleaningDone
                        font.pixelSize: 14
                        padding: 14
                        background: Rectangle {
                            color: "#0A81B5"
                            radius: 8
                            smooth: true
                        }
                        onClicked: {
                            junkCleaner.scanJunk()
                            scanCompleted = true
                            cleaningDone = false
                            statusText = ""
                        }
                    }
                }

                Label {
                    text: "Total Junk Size: " + (junkCleaner.totalSize / 1048576).toFixed(2) + " MB"
                    font.pixelSize: 15
                    color: "#999999"
                    horizontalAlignment: Text.AlignLeft
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "#292929"
                    radius: 8
                    border.color: "#444444"
                    border.width: 1
                    clip: true

                    ListView {
                        model: junkCleaner.filesToDelete
                        anchors.fill: parent
                        anchors.margins: 12
                        spacing: 6
                        clip: true

                        delegate: Text {
                            text: modelData
                            font.pixelSize: 14
                            color: "#eeeeee"
                            wrapMode: Text.Wrap
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }

                Label {
                    text: statusText
                    font.pixelSize: 14
                    color: cleaning ? "#FFB74D" : "#81C784"
                    horizontalAlignment: Text.AlignLeft
                }

                Connections {
                    target: junkCleaner
                    onCleaningStarted: {
                        statusText = "Working on it..."
                        cleaning = true
                    }
                    onCleaningFinished: {
                        statusText = "Cleanup complete."
                        cleaning = false
                        cleaningDone = true
                        scanCompleted = false
                    }
                }

                // Confirmation dialog
                Rectangle {
                    visible: confirmedToDelete
                    color: "#333"
                    radius: 8
                    Layout.fillWidth: true
                    Layout.preferredHeight: 120
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.margins: 0

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 20
                        spacing: 12
                        Label {
                            text: "Are you sure you want to delete junk files?"
                            font.pixelSize: 16
                            color: "white"
                            horizontalAlignment: Text.AlignHCenter
                        }
                        RowLayout {
                            spacing: 20
                            Button {
                                text: "Cancel"
                                onClicked: confirmedToDelete = false
                            }
                            Button {
                                text: "Yes, Delete"
                                font.pixelSize: 14
                                background: Rectangle {
                                    color: "#D32F2F"
                                    radius: 8
                                    smooth: true
                                }
                                contentItem: Text {
                                    text: control.text
                                    color: "white"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                                onClicked: {
                                    confirmedToDelete = false
                                    cleaning = true
                                    statusText = "Working on it..."
                                    junkCleaner.cleanJunk()
                                }
                            }
                        }
                    }
                }

                // Delete Junk button (shown only if no cleaning, no confirmation, no done)
                Button {
                    visible: !cleaning && !confirmedToDelete && !cleaningDone && scanCompleted && junkCleaner.totalSize > 0
                    text: "Delete Junk"
                    font.pixelSize: 14
                    padding: 14
                    background: Rectangle {
                        color: "#D32F2F"
                        radius: 8
                        smooth: true
                    }
                    contentItem: Text {
                        text: control.text
                        color: "white"
                    
                    }
                    onClicked: {
                        confirmedToDelete = true
                    }
                }

                // Done + OK button shown after cleaning finished
                RowLayout {
                    visible: cleaningDone
                    spacing: 16
                    anchors.horizontalCenter: parent.horizontalCenter

                    Label {
                        text: "Done"
                        font.pixelSize: 18
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                    }

                    Button {
                        text: "OK"
                        font.pixelSize: 16
                        padding: 14
                        background: Rectangle {
                            color: "#0A81B5"
                            radius: 8
                            smooth: true
                        }
                        contentItem: Text {
                            text: control.text
                            color: "white"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        onClicked: {
                            cleaningDone = false
                            scanCompleted = false
                            statusText = ""
                            junkCleaner.scanJunk()
                        }
                    }
                }
            }
        }

        // Bottom buttons and footer
        RowLayout {
            Layout.fillWidth: true
            spacing: 12

            Item { Layout.fillWidth: true } // spacer

            Button {
                text: "Back"
                font.pixelSize: 16
                padding: 14
                background: Rectangle {
                    color: "#0A81B5"
                    radius: 8
                    smooth: true
                }
                onClicked: navigateTo("pages/DefaultOrganize/AutoOrganize.qml")
            }
        }

        Label {
            text: "© ClariFile 2025 - KU CS-I Project Group"
            font.pixelSize: 13
            color: "#555555"
            horizontalAlignment: Text.AlignRight
            Layout.fillWidth: true
        }
    }
}
