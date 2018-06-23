import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.0

Window {
    id: window
    visible: true
    width: 480
    height: 680
    title: qsTr("Main Window")

    Text {
        id: textCurrentBalanceLabel
        x: 276
        y: 122
        text: qsTr("Current Balance:")
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 48
    }

    Text {
        id: textCurrentBalanceAmount
        x: 295
        y: 196
        text: qsTr("$200.00")
        font.family: ".SF NS Text"
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 36
    }

    Rectangle {
        id: rectangle
        x: 252
        y: 614
        width: 284
        height: 52
        color: "#ffffff"
        anchors.verticalCenterOffset: 173
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        border.color: "#7d7d7d"

        TextField {
            id: textFieldPurchaseAmount
            x: 0
            y: 0
            width: 284
            height: 52
            text: qsTr("")
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 32
            placeholderText: "Purchase Amount"
        }
    }

    Button {
        id: buttonAddPurchase
        x: 98
        y: 545
        width: 284
        height: 48
        text: qsTr("Add Purchase")
        font.pointSize: 32
        anchors.horizontalCenter: parent.horizontalCenter
        enabled: true
    }
}
