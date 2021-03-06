/****************************************************************************
**
** Copyright (C) 2019 The Qt Company Ltd.
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

import QtQuick 2.0
import HelperWidgets 2.0
import QtQuick.Layouts 1.0


Column {
    anchors.left: parent.left
    anchors.right: parent.right

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Flipped Status")

        SectionLayout {
            rows: 2
            Label {
                text: qsTr("Rotational Axis")
            }
            SecondColumnLayout {
                ComboBox {
                    model: ["X Axis", "Y Axis"]
                    backendValue: backendValues.rotationalAxis
                    Layout.fillWidth: true
                    useInteger: true
                }
            }

            Label {
                text: qsTr("Flip Angle")
            }
            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.flipAngle
                    Layout.preferredWidth: 80
                    minimumValue: -360
                    maximumValue: 360
                    stepSize: 10
                }
                ExpandingSpacer {

                }
            }
        }
    }

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Opacity")

        SectionLayout {
            rows: 2
            Label {
                text: qsTr("Opacity Front")
            }
            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.opacityFront
                    Layout.preferredWidth: 80
                    decimals: 2
                    minimumValue: 0
                    maximumValue: 1
                    stepSize: 0.1
                }
                ExpandingSpacer {
                }
            }
            Label {
                text: qsTr("Opacity Back")
            }
            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.opacityBack
                    Layout.preferredWidth: 80
                    decimals: 2
                    minimumValue: 0
                    maximumValue: 1
                    stepSize: 0.1
                }
                ExpandingSpacer {
                }
            }
        }
    }
}
