QT += core gui
QT += sql
QT += quickdialogs2
QT += widgets



greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = FileOrganizerShredder
TEMPLATE = app

SOURCES += \
    main.cpp \
    mainwindow.cpp \
    fileorganizer.cpp \
    fileshredder.cpp \
    pathmanager.cpp

HEADERS += \
    FolderPicker.h \
    mainwindow.h \
    fileorganizer.h \
    fileshredder.h \
    pathmanager.h

FORMS += \
    mainwindow.ui

RESOURCES += resources.qrc \
    resources.qrc

QT += quick qml

RESOURCES += resources.qrc

DISTFILES += \
    main.qml

QT += svg

RC_FILE = appicon.rc
