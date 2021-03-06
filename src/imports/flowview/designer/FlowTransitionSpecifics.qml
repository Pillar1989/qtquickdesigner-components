/****************************************************************************
**
** Copyright (C) 2020 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Quick Designer Components.
**
** $QT_BEGIN_LICENSE:GPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.1
import HelperWidgets 2.0
import QtQuick.Layouts 1.0

Column {
    anchors.left: parent.left
    anchors.right: parent.right

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Transition Color")

        ColorEditor {
            backendValue: backendValues.color__AUX
            supportGradient: false
        }
    }
    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Transition")

        SectionLayout {
            Label {
                text: qsTr("Condition")
                tooltip: qsTr("Determines whether the transition is active or not.")
            }
            CheckBox {
                Layout.fillWidth: true
                text: qsTr("Transtion Active")
                backendValue: backendValues.condition
            }

            Label {
                text: qsTr("Question")
                tooltip: qsTr("The transition will pop up dialog with the question")
            }
            LineEdit {
                backendValue: backendValues.question
                Layout.fillWidth: true
            }
            Label {
                text: qsTr("Event Ids")
                tooltip: qsTr("")
            }
            LineEdit {
                Layout.fillWidth: true
                text: backendValues.goBack
                backendValue: backendValues.eventIds
            }


            Label {
                text: qsTr("From")
            }
            SecondColumnLayout {
                EditableListView {
                    id: fromListView
                    backendValue: backendValues.from
                    model: fromListView.backendValue.expressionAsList
                    Layout.fillWidth: true
                    typeFilter: "FlowView.FlowItem"

                    onAdd: function(value) { fromListView.backendValue.idListAdd(value) }
                    onRemove: function(idx) { fromListView.backendValue.idListRemove(idx) }
                    onReplace: function (idx, value) { fromListView.backendValue.idListReplace(idx, value) }
                }
            }

            Label {
                text: qsTr("To")
            }
            SecondColumnLayout {
                EditableListView {
                    id: toListView
                    backendValue: backendValues.to
                    model: toListView.backendValue.expressionAsList
                    Layout.fillWidth: true
                    typeFilter: "FlowView.FlowItem"

                    onAdd: function(value) { toListView.backendValue.idListAdd(value) }
                    onRemove: function(idx) { toListView.backendValue.idListRemove(idx) }
                    onReplace: function (idx, value) { toListView.backendValue.idListReplace(idx, value) }
                }
            }
        }
    }


    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Transition Parameters")

        SectionLayout {
            rows: 4
            columns: 2

            Label {
                text: qsTr("Line Width")
                tooltip: qsTr("Sets the margin, in pixels, around the text in the TextEdit..")
            }
            SpinBox {
                backendValue: backendValues.width__AUX
                maximumValue: 22
                minimumValue: 1
            }

            Label {
                text: qsTr("In Offset")
                tooltip: qsTr("Sets the margin, in pixels, around the text in the TextEdit..")
            }
            SpinBox {
                backendValue: backendValues.inOffset__AUX
                maximumValue: 128
                minimumValue: -128
            }

            Label {
                text: qsTr("Out Offset")
                tooltip: qsTr("Sets the margin, in pixels, around the text in the TextEdit..")
            }
            SpinBox {
                backendValue: backendValues.outOffset__AUX
                maximumValue: 128
                minimumValue: -128
            }

            Label {
                text: qsTr("Break Offset")
                tooltip: qsTr("Sets the margin, in pixels, around the text in the TextEdit..")
            }
            SpinBox {
                backendValue: backendValues.breakPoint__AUX
                maximumValue: 100
                minimumValue: 0
            }

            Label {
                text: qsTr("Dash Line")
                tooltip: qsTr("Sets the margin, in pixels, around the text in the TextEdit..")
            }
            CheckBox {
                Layout.fillWidth: true
                text: backendValues.dash__AUX.value
                backendValue: backendValues.dash__AUX
            }

            Label {
                text: qsTr("Type")
                tooltip: qsTr("The transition type.")
            }
            ComboBox {
                id: typeComboBox
                valueType: ComboBox.ValueType.Integer
                backendValue: backendValues.type__AUX
                implicitWidth: 180
                model: [ "Default", "Bezier" ]
                manualMapping: true

                property bool block: false

                onValueFromBackendChanged: {
                    if (!__isCompleted)
                        return;

                    block = true

                    currentIndex = backendValues.type__AUX.value

                    block = false
                }

                onCurrentIndexChanged: {
                    if (!__isCompleted)
                        return;

                    if (block)
                        return;

                    backendValues.type__AUX.value = currentIndex
                }
            }

            Label {
                text: qsTr("Radius")
                tooltip: qsTr("The corner radius of the transition.")
            }
            SpinBox {
                enabled: typeComboBox.currentIndex === 0
                backendValue: backendValues.radius__AUX
                minimumValue: 0
                maximumValue: 150
            }
            Label {
                text: qsTr("Bezier Factor")
                tooltip: qsTr("Modifies the position of the control points used for bezier curve.")
            }
            SpinBox {
                enabled: typeComboBox.currentIndex === 1
                backendValue: backendValues.bezier__AUX
                minimumValue: 0
                maximumValue: 150
            }

            Label {
                text: qsTr("Label Position")
                tooltip: qsTr("Modifies the position of the label.")
            }
            SpinBox {
                backendValue: backendValues.labelPosition__AUX
                minimumValue: 0
                maximumValue: 100
                decimals: 2
            }
            Label {
                text: qsTr("Label Flip Side")
                tooltip: qsTr("Flips the label to the other side.")
            }
            CheckBox {
                Layout.fillWidth: true
                text: backendValues.labelFlipSide__AUX.value
                backendValue: backendValues.labelFlipSide__AUX
            }
        }
    }
}
