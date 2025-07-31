QT += core gui
QT += sql


greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = FileOrganizerShredder
TEMPLATE = app

SOURCES += \
    databasemanager.cpp \
    main.cpp \
    mainwindow.cpp \
    fileorganizer.cpp \
    fileshredder.cpp

HEADERS += \
    FolderPicker.h \
    databasemanager.h \
    mainwindow.h \
    fileorganizer.h \
    fileshredder.h

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
