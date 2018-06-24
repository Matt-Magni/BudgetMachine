import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.LocalStorage 2.0
import io.qt.BudgetApp.backend 1.0

Window {
    id: window
    visible: true
    width: 360
    height: 680
    title: qsTr("Main Window")


    BackEnd {
        id: backend
    }

    Text {
        id: textCurrentBalanceLabel
        x: 276
        y: 122
        text: qsTr("Current Balance:")
        color: (backend.balanceAmount > 0) ? "#00ff00" : "#ff0000"
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 42
    }

    Text {
        id: textCurrentBalanceAmount
        x: 295
        y: 196
        text: backend.balanceAmount
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
        anchors.verticalCenterOffset: 84
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
            text: Number(backend.purchaseAmount)
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 32
            placeholderText: qsTr("Purchase Amount")
            onTextChanged: backend.purchaseAmount = Number(text)
        }
    }


        function updateBalance() {
            backend.balanceAmount = backend.balanceAmount - backend.purchaseAmount;
            backend.purchaseAmount = 0.0;
    }

        Button {
            id: buttonAddPurchase
            x: 98
            y: 456
            width: 284
            height: 48
            text: qsTr("Add Purchase")
            anchors.horizontalCenterOffset: 0
            font.pointSize: 32
            anchors.horizontalCenter: parent.horizontalCenter
            enabled: true
            onClicked: updateBalance()

        }

        Button {
            id: buttonReset
            x: 361
            y: 51
            text: qsTr("Reset")
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: backend.balanceAmount = 200.00
        }
}

