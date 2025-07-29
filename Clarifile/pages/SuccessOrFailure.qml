import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Popup {
    id: successPopup
    modal: true
    focus: true
    x: (parent ? parent.width : 640) / 2 - width / 2
    y: (parent ? parent.height : 480) / 2 - height / 2
    width: 320
    height: 200

    // Properties
    property point dragOffset
    property bool isLoading: true
    property bool isSuccess: true  // true = success, false = failure

    background: Rectangle {
        color: "#2C2D30"
        radius: 10
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        ColumnLayout {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            spacing: 16
            anchors.margins: 16

            BusyIndicator {
                running: isLoading
                visible: isLoading
                width: 40
                height: 40
                Layout.alignment: Qt.AlignHCenter
            }

            // Tick or Cross mark shown when loading is complete
            Label {
                text: isSuccess ? "\u2714" : "\u274C" // ✓ or ❌
                visible: !isLoading
                color: isSuccess ? "lightgreen" : "red"
                font.pixelSize: 28
                Layout.alignment: Qt.AlignHCenter
            }

            Label {
                text: isLoading
                    ? "Please wait while we are working on it..."
                    : (isSuccess ? "Operation completed successfully!" : "Operation failed. Please try again.")
                color: "white"
                font.pixelSize: 14
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
            }

            Button {
                text: "Close"
                visible: !isLoading
                Layout.alignment: Qt.AlignHCenter

                // ⚠️ For UI testing only: Simulate failure state on close
                onClicked: {
                    if (isSuccess) {
                        isSuccess = false
                        isLoading = true
                        // restart timer for UI feedback
                        testTimer.restart()
                    } else {
                        successPopup.close()
                    }
                }
            }
        }
    }

    Timer {
        id: testTimer
        interval: 500
        running: true
        repeat: false
        onTriggered: successPopup.isLoading = false
    }
}
