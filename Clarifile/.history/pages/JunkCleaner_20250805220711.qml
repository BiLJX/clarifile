Item {
    id: root
    property bool scanCompleted: true // set accordingly
    property bool cleaning: false
    property bool confirmedToDelete: false
    property bool cleaningDone: false
    property real totalSize: 1024 * 1024 * 5  // example 5MB

    signal startCleaning()
    signal cleaningFinished()

    ColumnLayout {
        spacing: 12

        // Scan info label
        Label {
            text: "Total Junk Size: " + (totalSize / 1048576).toFixed(2) + " MB"
            color: "white"
        }

        // Confirmation dialog (visible only when asking)
        Rectangle {
            visible: confirmedToDelete && !cleaning
            color: "#333"
            radius: 6
            Layout.fillWidth: true
            Layout.preferredHeight: 100
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 12

                Label {
                    text: "Are you sure you want to delete junk files?"
                    color: "white"
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                }

                RowLayout {
                    spacing: 20
                    Button {
                        text: "Cancel"
                        onClicked: {
                            confirmedToDelete = false
                        }
                    }
                    Button {
                        text: "Yes, Delete"
                        background: Rectangle { color: "#D32F2F"; radius: 8 }
                        contentItem: Text { text: control.text; color: "white"; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
                        onClicked: {
                            cleaning = true
                            confirmedToDelete = false
                            startCleaning()
                        }
                    }
                }
            }
        }

        // Delete Junk button (visible when no cleaning or confirmation)
        Button {
            visible: !cleaning && !confirmedToDelete && scanCompleted && totalSize > 0
            text: "Delete Junk"
            font.pixelSize: 16
            background: Rectangle { color: "#D32F2F"; radius: 8 }
            contentItem: Text { text: control.text; color: "white"; horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter }
            onClicked: {
                confirmedToDelete = true
            }
        }

        // Working on it label (shown during cleaning)
        Label {
            visible: cleaning
            text: "Working on it..."
            font.pixelSize: 16
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        // Done label and OK button (shown when cleaning finished)
        RowLayout {
            visible: cleaningDone
            spacing: 12
            Label {
                text: "Done"
                font.pixelSize: 16
                color: "white"
                verticalAlignment: Text.AlignVCenter
            }
            Button {
                text: "OK"
                font.pixelSize: 16
                onClicked: {
                    cleaningDone = false
                    scanCompleted = false
                    totalSize = 0
                    // emit signal or refresh junk list here
                }
            }
        }
    }

    // Simulate cleaning process
    Connections {
        target: root
        onStartCleaning: {
            console.log("Cleaning started")
            // Simulate async cleaning by timeout
            Qt.callLater(() => {
                cleaning = false
                cleaningDone = true
                cleaningFinished()
            }, 3000)  // 3 seconds delay simulating cleaning
        }
    }
}
