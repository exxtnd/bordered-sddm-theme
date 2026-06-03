// QT5 VER
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

Rectangle {
    id: root
    width: 1920
    height: 1080
    color: "black"
    property int pad: 12
    property int rad: 25
    property int nWidth: 260
    property int nHeight: 70
    property int sRad: 25
    property int bWidth: 55
    property int bHeight: 200
    property string fontFamily: audiowide.name
    FontLoader { id: audiowide; source: "assets/Audiowide-Regular.ttf" }
    property int selectedUserIndex: userModel.lastIndex
    property int selectedSessionIndex: sessionModel.lastIndex
    function handlePowerAction(action) {
        if (action === "session") { sessionMenu.visible = !sessionMenu.visible; userMenu.visible = false; }
        else if (action === "sleep") { sddm.suspend(); }
        else if (action === "reboot") { sddm.reboot(); }
        else if (action === "power") { sddm.powerOff(); }
    }
    Item {
        id: bgContainer; anchors.fill: parent; z: 0
        Image { id: bgImage; anchors.fill: parent; source: "assets/bg.jpg"; fillMode: Image.PreserveAspectCrop; visible: false }
        FastBlur { anchors.fill: bgImage; source: bgImage; radius: 90; transparentBorder: false }
    }
    MouseArea {
        anchors.fill: parent
        enabled: sessionMenu.visible || userMenu.visible
        z: 60 
        onClicked: { sessionMenu.visible = false; userMenu.visible = false; }
    }
    Canvas {
        id: mainMask
        anchors.fill: parent; z: 5
        onPaint: {
            var ctx = getContext("2d"); ctx.reset(); ctx.fillStyle = "black";
            var w = width; var h = height; var p = root.pad; var r = root.rad;
            var sw = root.sRad; var nx = w / 2; var nw = root.nWidth / 2; var nh = root.nHeight;
            ctx.beginPath(); ctx.rect(0, 0, w, h);
            ctx.moveTo(p + r, p);
            ctx.lineTo(w - p - root.bWidth - sw, p);
            ctx.arcTo(w - p - root.bWidth, p, w - p - root.bWidth, p + sw, sw);
            ctx.lineTo(w - p - root.bWidth, p + root.bHeight - 25);
            ctx.arcTo(w - p - root.bWidth, p + root.bHeight, w - p - root.bWidth + 25, p + root.bHeight, 25);
            ctx.lineTo(w - p - sw, p + root.bHeight);
            ctx.arcTo(w - p, p + root.bHeight, w - p, p + root.bHeight + sw, sw);
            ctx.lineTo(w - p, h - p - r); ctx.arcTo(w - p, h - p, w - p - r, h - p, r);
            ctx.lineTo(nx + nw + sw, h - p); ctx.arcTo(nx + nw, h - p, nx + nw, h - p - sw, sw);
            ctx.lineTo(nx + nw, h - p - nh + 20); ctx.arcTo(nx + nw, h - p - nh, nx + nw - 20, h - p - nh, 20);
            ctx.lineTo(nx - nw + 20, h - p - nh); ctx.arcTo(nx - nw, h - p - nh, nx - nw, h - p - nh + 20, 20);
            ctx.lineTo(nx - nw, h - p - sw); ctx.arcTo(nx - nw, h - p, nx - nw - sw, h - p, sw);
            ctx.lineTo(p + r, h - p); ctx.arcTo(p, h - p, p, h - p - r, r);
            ctx.lineTo(p, p + r); ctx.arcTo(p, p, p + r, p, r);
            ctx.closePath(); ctx.fillRule = Qt.OddEvenFill; ctx.fill();
        }
    }
    Column {
        anchors.top: parent.top; anchors.topMargin: parent.height * -0.04
        anchors.horizontalCenter: parent.horizontalCenter; z: 10; spacing: -45 
        Text { id: timeText; color: "black"; font.family: root.fontFamily; font.pixelSize: 330; text: Qt.formatDateTime(new Date(), "HH:mm") }
        Text { id: dateText; anchors.horizontalCenter: parent.horizontalCenter; color: "black"; font.family: root.fontFamily; font.pixelSize: 24; text: Qt.formatDateTime(new Date(), "dddd, d MMMM") }
    }
    Column {
        id: powerBlock
        anchors.top: parent.top; anchors.right: parent.right; anchors.topMargin: root.pad + 18
        anchors.rightMargin: root.pad + (root.bWidth - 28) / 2; spacing: 18; z: 100
        Repeater {
            model: ["session", "sleep", "reboot", "power"]
            delegate: Button {
                id: btn; width: 28; height: 28; onClicked: root.handlePowerAction(modelData)
                background: Item {
                    Image { anchors.fill: parent; source: "assets/" + modelData + ".png"; sourceSize: Qt.size(56, 56); opacity: btn.hovered ? 1.0 : 0.6; fillMode: Image.PreserveAspectFit; visible: status === Image.Ready }
                    Text { anchors.centerIn: parent; text: modelData[0].toUpperCase(); color: "white"; font.family: root.fontFamily; font.pixelSize: 14; visible: parent.children[0].status !== Image.Ready }
                }
            }
        }
    }
    Rectangle {
        id: sessionMenu
        visible: false
        anchors.top: parent.top; anchors.topMargin: root.pad - 9
        anchors.right: parent.right; anchors.rightMargin: root.pad + root.bWidth - 9
        width: 180; height: Math.max(45, Math.min(sessionList.count * 40 + 14, 174))
        color: "black"; radius: 12; border.color: "#ff000000"; z: 110
        ListView {
            id: sessionList; anchors.fill: parent; anchors.margins: 7; model: sessionModel; clip: true; currentIndex: sessionModel.lastIndex
            delegate: ItemDelegate {
                id: sItem; width: parent.width; height: 39
                contentItem: Text { text: model.name; color: "white"; font.family: root.fontFamily; font.pixelSize: 13; verticalAlignment: Text.AlignVCenter; leftPadding: 10; elide: Text.ElideRight }
                background: Rectangle { radius: 8; color: sItem.pressed ? "#55ffffff" : (sessionList.currentIndex === index || sItem.hovered ? "#22ffffff" : "transparent") }
                onClicked: { sessionList.currentIndex = index; sessionMenu.visible = false }
            }
        }
    }
    Rectangle {
        id: userMenu
        visible: false
        anchors.bottom: parent.bottom
        anchors.bottomMargin: root.pad + root.nHeight + 5
        anchors.horizontalCenter: parent.horizontalCenter
        width: root.nWidth
        height: Math.min(Math.ceil(userList.count / 2) * 50 + 14, 214)
        color: "black"; radius: 12; border.color: "#ff000000"; z: 110

        GridView {
            id: userList
            anchors.fill: parent; anchors.margins: 7
            model: userModel
            cellWidth: count === 1 ? width : width / 2; cellHeight: 45
            clip: true
            delegate: ItemDelegate {
                id: userItem
                width: userList.cellWidth; height: 50
                spacing: 5
                contentItem: Row {
                    spacing: 15
                    leftPadding: 5
                    Rectangle {
                        width: 27; height: 29; radius: 10; color: "#11ffffff"; clip: true; anchors.verticalCenter: parent.verticalCenter
                        Image { anchors.fill: parent; source: model.icon || "assets/avatar.png"; fillMode: Image.PreserveAspectCrop }
                    }
                    Text {
                        text: model.name; color: "white"; font.family: root.fontFamily; font.pixelSize: 12
                        anchors.verticalCenter: parent.verticalCenter; elide: Text.ElideRight; width: parent.width - 40
                    }
                }
                background: Rectangle { radius: 8; color: userItem.pressed ? "#55ffffff" : (root.selectedUserIndex === index || userItem.hovered ? "#22ffffff" : "transparent") }
                onClicked: {
                    root.selectedUserIndex = index
                    userMenu.visible = false
                }
            }
        }
    }
    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom; anchors.bottomMargin: root.pad + (root.nHeight - 48) / 2
        z: 15; spacing: 15
        Item {
            width: 45; height: 45
            MouseArea {
                anchors.fill: parent
                onClicked: { userMenu.visible = !userMenu.visible; sessionMenu.visible = false; }
                cursorShape: Qt.PointingHandCursor
            }
            Image { 
                id: avatar; anchors.fill: parent
                source: userModel.data(userModel.index(root.selectedUserIndex, 0), Qt.UserRole + 2) || "assets/avatar.png"
                fillMode: Image.PreserveAspectCrop; visible: false 
            }
            Rectangle {
                id: maskRect
                anchors.fill: parent
                radius: 10
                visible: false
            }
            OpacityMask {
                anchors.fill: parent
                source: avatar
                maskSource: maskRect
            }

            Rectangle { anchors.fill: parent; radius: 10; color: "transparent"; border.color: "white"; border.width: 1 }
        }

        TextField {
            id: passwordField; focus: true; echoMode: TextInput.Password; placeholderText: "ENTER PASSWD"; font.family: root.fontFamily; font.pixelSize: 16; color: "white"
            onActiveFocusChanged: {
                if (!activeFocus) passwordField.forceActiveFocus()
            }
            Layout.preferredWidth: 175; Layout.preferredHeight: 45; verticalAlignment: TextInput.AlignVCenter; leftPadding: 10
            background: Rectangle { color: Qt.rgba(0, 0, 0, 1); radius: 8; border.color: parent.activeFocus ? "#22ffffff" : "#11ffffff" }
            onAccepted: {
                var username = userModel.data(userModel.index(root.selectedUserIndex, 0), Qt.UserRole + 1)
                sddm.login(username, text, sessionList.currentIndex)
            }
        }
    }

    Timer { interval: 1000; running: true; repeat: true; onTriggered: { timeText.text = Qt.formatDateTime(new Date(), "HH:mm"); dateText.text = Qt.formatDateTime(new Date(), "dddd, d MMMM") } }
    Component.onCompleted: passwordField.forceActiveFocus()
}
