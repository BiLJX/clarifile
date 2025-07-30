import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Popup {
    id: failurePopup
    modal: true
    focus: true
    width: 320
    height: 200
    x: (parent ? parent.width : 640) / 2 - width / 2
    y: (parent ? parent.height : 480) / 2 - height / 2

    background: Rectangle {
        color: "#2C2D30"
        radius: 10
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 16
        Layout.alignment: Qt.AlignHCenter

        Label {
            text: "\u274C"  // ❌
            color: "red"
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: "Operation failed. Please try again."
            color: "white"
            font.pixelSize: 14
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        Button {
            text: "Close"
            Layout.alignment: Qt.AlignHCenter
            onClicked: failurePopup.close()
        }
    }
}
