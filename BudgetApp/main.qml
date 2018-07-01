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
        x: 38
        y: 491
        width: 284
        height: 52
        color: "#ffffff"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 137
        anchors.horizontalCenter: buttonAddPurchase.horizontalCenter
        border.color: "#7d7d7d"

        TextField {
            id: textFieldPurchaseAmount
            x: 0
            y: 0
            width: 284
            height: 52
            text: Number(backend.purchaseAmount)
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
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
            y: 560
            width: 284
            height: 48
            text: qsTr("Add Purchase")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 72
            anchors.horizontalCenterOffset: 0
            font.pointSize: 32
            anchors.horizontalCenter: parent.horizontalCenter
            enabled: true
            onClicked: updateBalance()

        }

        Button {
            id: buttonReset
            text: qsTr("Reset")
            anchors.top: parent.top
            anchors.topMargin: 45
            anchors.left: parent.left
            anchors.leftMargin: 30
            onClicked: backend.balanceAmount = 200.00
        }

        function updateAddFunds() {
            backend.bankAmount = backend.bankAmount + backend.balanceAmount
            backend.balanceAmount = 200
    }
        Button {
            id: buttonAddFunds
            x: 229
            text: qsTr("Add Funds")
            anchors.top: parent.top
            anchors.topMargin: 45
            anchors.right: parent.right
            anchors.rightMargin: 30
            onClicked: updateAddFunds()

        }

        Text {
            id: text1
            x: 118
            y: 392
            width: 100
            height: 40
            text: qsTr("Bank:")
            font.pixelSize: 28
        }

        Text {
            id: textBankAmount
            x: 194
            y: 392
            width: 45
            height: 31
            text: backend.bankAmount
            font.pixelSize: 28
        }
}

