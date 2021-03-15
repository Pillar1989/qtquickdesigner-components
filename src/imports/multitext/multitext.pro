TARGET = multitextplugin
TARGETPATH = QtQuick/Studio/MultiText
IMPORT_VERSION = 1.0

QT += qml quick
QT_PRIVATE += core-private gui-private qml-private quick-private 

DEFINES += QT_NO_CAST_TO_ASCII QT_NO_CAST_FROM_ASCII

include(multitext.pri)

OTHER_FILES += \
    qmldir \
    $$QML_FILES

SOURCES += \
    $$PWD/multitextplugin.cpp


!static: qtConfig(quick-designer): include(designer/designer.pri)
## include(doc/doc.pri)

CONFIG += no_cxx_module install_qml_files qtquickcompiler
load(qml_plugin)


