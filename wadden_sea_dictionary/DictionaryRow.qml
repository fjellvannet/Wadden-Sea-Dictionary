import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.1

RowLayout{
    y: globalMargin / 2
    anchors.margins: y
    spacing: y
    property alias textHeight: dictionaryWord.contentHeight

    FlagImage {
        visible: settings.flags_in_all_language_mode
        Layout.preferredHeight: 3 * globalMargin
        Layout.preferredWidth: 5 * globalMargin
        Layout.alignment: Qt.AlignVCenter
        languageId: {
            var a = ResultLanguage
            if(a === 4) a = appLanguage
            return a
        }
    }

    AdaptedText {
        visible: !settings.flags_in_all_language_mode
        Layout.preferredWidth: 4 * globalMargin
        Layout.alignment: Qt.AlignVCenter
        font.pixelSize: 3 * globalMargin
        color: dark_accent
        text: {
            var a = ResultLanguage
            if(a === 4) a = appLanguage
            switch(a) {
                case 0:
                    return "DE"
                case 1:
                    return "EN"
                case 2:
                    return "NL"
                case 3:
                    return "DK"
                default:
                    return ""
            }
        }
    }

    AdaptedText {
        id: dictionaryWord
        Layout.fillWidth: true
        text: {
            var a = ResultLanguage
            if(a === 4) a = appLanguage
            var s
            switch(a){
                case 0: s = Deutsch; break
                case 1: s = English; break
                case 2: s = Nederlands; break
                case 3: s = Dansk; break
                default: s = ""
            }
            return s + (Scientific === "" ? "" : " (<i>" + Scientific + "</i>)")
        }
        Layout.alignment: Qt.AlignVCenter
        wrapMode: Text.Wrap
    }
}
