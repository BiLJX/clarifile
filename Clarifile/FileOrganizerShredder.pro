QT += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = FileOrganizerShredder
TEMPLATE = app

SOURCES += \
    main.cpp \
    mainwindow.cpp \
    fileorganizer.cpp \
    fileshredder.cpp

HEADERS += \
    mainwindow.h \
    fileorganizer.h \
    fileshredder.h

FORMS += \
    mainwindow.ui

RESOURCES += resources.qrc

