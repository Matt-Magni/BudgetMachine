import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id: window
    visible: true
    width: 750
    height: 1334
    title: qsTr("Main Window")

    Text {
        id: text1
        x: 276
        y: 122
        text: qsTr("Current Balance:")
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 48
    }

    Text {
        id: text2
        x: 295
        y: 196
        text: qsTr("$200.00")
        font.family: "Tahoma"
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 36
    }
}
