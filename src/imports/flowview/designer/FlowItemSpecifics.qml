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
        caption: qsTr("Flow Item")

        SectionLayout {
            rows: 2
            columns: 2

            Label {
                text: qsTr("State Change Target")
                tooltip: qsTr("Defines the target Flow Item of which the state is changed.")
            }
            SecondColumnLayout {
                ItemFilterComboBox {
                    typeFilter: "FlowView.FlowItem"
                    validator: RegExpValidator { regExp: /(^$|^[a-z_]\w*)/ }
                    backendValue: backendValues.stateChangeTarget
                    Layout.fillWidth: true
                }

                ExpandingSpacer {
                }
            }

            Label {
                text: qsTr("Target State")
            }

            SecondColumnLayout {

                ComboBox {
                    Layout.fillWidth: true
                    backendValue: backendValues.targetState
                    model: allStatesForId(backendValues.stateChangeTarget.expression)
                    valueType: ComboBox.String
                }

                ExpandingSpacer {
                }
            }

            Label {
                text: qsTr("Loader Source")
            }

            SecondColumnLayout {
                UrlChooser {
                    Layout.fillWidth: true
                    backendValue: backendValues.loaderSource
                    filter: "*.ui.qml"
                }

                ExpandingSpacer {
                }
            }
        }

    }

    Section {
        visible: anchorBackend.hasParent
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Flow View")

        SectionLayout {
            rows: 4
            columns: 2

            Label {
                text: qsTr("Join Connections")
                tooltip: qsTr("Join connections")
            }
            CheckBox {
                backendValue: backendValues.joinConnection__AUX
                Layout.fillWidth: true
                text: backendValues.enabled
            }
        }

    }
}
