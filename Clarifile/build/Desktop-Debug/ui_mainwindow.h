/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 6.9.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QListWidget>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralwidget;
    QVBoxLayout *verticalLayout;
    QHBoxLayout *topLayout;
    QLineEdit *lineEdit;
    QPushButton *browseButton;
    QHBoxLayout *middleLayout;
    QPushButton *organizeButton;
    QPushButton *shredButton;
    QListWidget *listWidget;
    QMenuBar *menubar;
    QStatusBar *statusbar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName("MainWindow");
        MainWindow->resize(600, 400);
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName("centralwidget");
        verticalLayout = new QVBoxLayout(centralwidget);
        verticalLayout->setObjectName("verticalLayout");
        topLayout = new QHBoxLayout();
        topLayout->setObjectName("topLayout");
        lineEdit = new QLineEdit(centralwidget);
        lineEdit->setObjectName("lineEdit");

        topLayout->addWidget(lineEdit);

        browseButton = new QPushButton(centralwidget);
        browseButton->setObjectName("browseButton");

        topLayout->addWidget(browseButton);


        verticalLayout->addLayout(topLayout);

        middleLayout = new QHBoxLayout();
        middleLayout->setObjectName("middleLayout");
        organizeButton = new QPushButton(centralwidget);
        organizeButton->setObjectName("organizeButton");

        middleLayout->addWidget(organizeButton);

        shredButton = new QPushButton(centralwidget);
        shredButton->setObjectName("shredButton");

        middleLayout->addWidget(shredButton);


        verticalLayout->addLayout(middleLayout);

        listWidget = new QListWidget(centralwidget);
        listWidget->setObjectName("listWidget");

        verticalLayout->addWidget(listWidget);

        MainWindow->setCentralWidget(centralwidget);
        menubar = new QMenuBar(MainWindow);
        menubar->setObjectName("menubar");
        MainWindow->setMenuBar(menubar);
        statusbar = new QStatusBar(MainWindow);
        statusbar->setObjectName("statusbar");
        MainWindow->setStatusBar(statusbar);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        browseButton->setText(QCoreApplication::translate("MainWindow", "Browse", nullptr));
        organizeButton->setText(QCoreApplication::translate("MainWindow", "Organize", nullptr));
        shredButton->setText(QCoreApplication::translate("MainWindow", "Shred", nullptr));
        (void)MainWindow;
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
