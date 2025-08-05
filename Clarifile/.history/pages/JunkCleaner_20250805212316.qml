import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    anchors.fill: parent

    signal navigateTo(string page)

    property bool scanCompleted: false
    property bool cleaning: false
    property string statusText: ""

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 24
        spacing: 20

        ColumnLayout {
            spacing: 4
            Label {
                text: "Junk Cleaner"
                font.pixelSize: 24
                font.bold: true
                color: "white"
            }
            Label {
                text: "Scan and delete temporary files to free up disk space."
                font.pixelSize: 14
                color: "#cccccc"
            }
        }

        Rectangle {
            color: "#232323"
            radius: 6
            Layout.fillWidth: true
            Layout.fillHeight: true

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 12

                RowLayout {
                    spacing: 12
                    Button {
                        text: "Scan for Junk"
                        enabled: !cleaning
                        background: Rectangle {
                            color: "#096D9B"
                            radius: 6
                        }
                        onClicked: {
                            junkCleaner.scanJunk()
                            scanCompleted = true
                            statusText = ""
                        }
                    }

                    Button {
                        text: "Delete Junk"
                        enabled: scanCompleted && junkCleaner.totalSize > 0 && !cleaning
                        background: Rectangle {
                            color: "#C62828"
                            radius: 6
                        }
                        onClicked: {
                            cleaning = true
                            statusText = "Working on it..."
                            junkCleaner.cleanJunk()
                        }
                    }
                }

                Label {
                    text: "Total Junk Size: " + (junkCleaner.totalSize / 1048576).toFixed(2) + " MB"
                    font.pixelSize: 14
                    color: "#aaaaaa"
                }

                ListView {
                    model: junkCleaner.filesToDelete
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    spacing: 4
                    clip: true

                    delegate: Text {
                        text: modelData
                        font.pixelSize: 13
                        color: "#dddddd"
                        wrapMode: Text.Wrap
                    }
                }

                Label {
                    text: statusText
                    font.pixelSize: 13
                    color: cleaning ? "#FFA726" : "#66BB6A"
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
                        scanCompleted = false
                    }
                }
            }
        }

        Button {
            text: "Back"
            background: Rectangle {
                color: "#096D9B"
                radius: 6
            }
            onClicked: navigateTo("pages/DefaultOrganize/AutoOrganize.qml")
        }

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
