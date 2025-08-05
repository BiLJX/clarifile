/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 6.9.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QLabel>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QStackedWidget>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralwidget;
    QHBoxLayout *horizontalLayout;
    QStackedWidget *stackedWidget;
    QWidget *page;
    QVBoxLayout *verticalLayout_3;
    QVBoxLayout *verticalLayout;
    QVBoxLayout *verticalLayout_2;
    QLabel *label;
    QLabel *label_2;
    QGridLayout *gridLayout;
    QPushButton *navDefaultOrganize;
    QSpacerItem *verticalSpacer;
    QPushButton *Documentation;
    QPushButton *navCustom;
    QPushButton *navShred;
    QSpacerItem *horizontalSpacer;
    QWidget *page_2;
    QMenuBar *menubar;
    QStatusBar *statusbar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName("MainWindow");
        MainWindow->resize(1200, 530);
        QSizePolicy sizePolicy(QSizePolicy::Policy::Preferred, QSizePolicy::Policy::Preferred);
        sizePolicy.setHorizontalStretch(1);
        sizePolicy.setVerticalStretch(1);
        sizePolicy.setHeightForWidth(MainWindow->sizePolicy().hasHeightForWidth());
        MainWindow->setSizePolicy(sizePolicy);
        MainWindow->setStyleSheet(QString::fromUtf8("QMainWindow {\n"
"	background-color: rgb(28, 28, 33)\n"
"}"));
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName("centralwidget");
        QSizePolicy sizePolicy1(QSizePolicy::Policy::Expanding, QSizePolicy::Policy::Expanding);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(centralwidget->sizePolicy().hasHeightForWidth());
        centralwidget->setSizePolicy(sizePolicy1);
        centralwidget->setStyleSheet(QString::fromUtf8("padding: 16px"));
        horizontalLayout = new QHBoxLayout(centralwidget);
        horizontalLayout->setObjectName("horizontalLayout");
        stackedWidget = new QStackedWidget(centralwidget);
        stackedWidget->setObjectName("stackedWidget");
        sizePolicy1.setHeightForWidth(stackedWidget->sizePolicy().hasHeightForWidth());
        stackedWidget->setSizePolicy(sizePolicy1);
        page = new QWidget();
        page->setObjectName("page");
        sizePolicy1.setHeightForWidth(page->sizePolicy().hasHeightForWidth());
        page->setSizePolicy(sizePolicy1);
        verticalLayout_3 = new QVBoxLayout(page);
        verticalLayout_3->setObjectName("verticalLayout_3");
        verticalLayout = new QVBoxLayout();
        verticalLayout->setObjectName("verticalLayout");
        verticalLayout_2 = new QVBoxLayout();
        verticalLayout_2->setObjectName("verticalLayout_2");
        label = new QLabel(page);
        label->setObjectName("label");
        QFont font;
        font.setPointSize(36);
        font.setBold(true);
        label->setFont(font);
        label->setAlignment(Qt::AlignmentFlag::AlignLeading|Qt::AlignmentFlag::AlignLeft|Qt::AlignmentFlag::AlignVCenter);

        verticalLayout_2->addWidget(label);

        label_2 = new QLabel(page);
        label_2->setObjectName("label_2");
        QFont font1;
        font1.setPointSize(20);
        label_2->setFont(font1);
        label_2->setStyleSheet(QString::fromUtf8("color: rgb(199, 199, 199)"));
        label_2->setAlignment(Qt::AlignmentFlag::AlignLeading|Qt::AlignmentFlag::AlignLeft|Qt::AlignmentFlag::AlignVCenter);

        verticalLayout_2->addWidget(label_2);


        verticalLayout->addLayout(verticalLayout_2);

        gridLayout = new QGridLayout();
        gridLayout->setObjectName("gridLayout");
        navDefaultOrganize = new QPushButton(page);
        navDefaultOrganize->setObjectName("navDefaultOrganize");
        QSizePolicy sizePolicy2(QSizePolicy::Policy::Minimum, QSizePolicy::Policy::Expanding);
        sizePolicy2.setHorizontalStretch(0);
        sizePolicy2.setVerticalStretch(0);
        sizePolicy2.setHeightForWidth(navDefaultOrganize->sizePolicy().hasHeightForWidth());
        navDefaultOrganize->setSizePolicy(sizePolicy2);
        QFont font2;
        font2.setPointSize(16);
        font2.setWeight(QFont::Medium);
        navDefaultOrganize->setFont(font2);
        navDefaultOrganize->setStyleSheet(QString::fromUtf8("background-color: #27272C"));

        gridLayout->addWidget(navDefaultOrganize, 0, 2, 1, 1);

        verticalSpacer = new QSpacerItem(20, 10, QSizePolicy::Policy::Minimum, QSizePolicy::Policy::Preferred);

        gridLayout->addItem(verticalSpacer, 1, 0, 1, 1);

        Documentation = new QPushButton(page);
        Documentation->setObjectName("Documentation");
        sizePolicy2.setHeightForWidth(Documentation->sizePolicy().hasHeightForWidth());
        Documentation->setSizePolicy(sizePolicy2);
        Documentation->setFont(font2);
        Documentation->setStyleSheet(QString::fromUtf8("background-color: #27272C"));

        gridLayout->addWidget(Documentation, 0, 0, 1, 1);

        navCustom = new QPushButton(page);
        navCustom->setObjectName("navCustom");
        sizePolicy2.setHeightForWidth(navCustom->sizePolicy().hasHeightForWidth());
        navCustom->setSizePolicy(sizePolicy2);
        navCustom->setFont(font2);
        navCustom->setStyleSheet(QString::fromUtf8("background-color: #27272C"));

        gridLayout->addWidget(navCustom, 2, 0, 1, 1);

        navShred = new QPushButton(page);
        navShred->setObjectName("navShred");
        sizePolicy2.setHeightForWidth(navShred->sizePolicy().hasHeightForWidth());
        navShred->setSizePolicy(sizePolicy2);
        navShred->setFont(font2);
        navShred->setStyleSheet(QString::fromUtf8("background-color: #27272C"));

        gridLayout->addWidget(navShred, 2, 2, 1, 1);

        horizontalSpacer = new QSpacerItem(10, 20, QSizePolicy::Policy::Fixed, QSizePolicy::Policy::Minimum);

        gridLayout->addItem(horizontalSpacer, 0, 1, 1, 1);


        verticalLayout->addLayout(gridLayout);


        verticalLayout_3->addLayout(verticalLayout);

        stackedWidget->addWidget(page);
        page_2 = new QWidget();
        page_2->setObjectName("page_2");
        stackedWidget->addWidget(page_2);

        horizontalLayout->addWidget(stackedWidget);

        MainWindow->setCentralWidget(centralwidget);
        menubar = new QMenuBar(MainWindow);
        menubar->setObjectName("menubar");
        menubar->setGeometry(QRect(0, 0, 1200, 21));
        MainWindow->setMenuBar(menubar);
        statusbar = new QStatusBar(MainWindow);
        statusbar->setObjectName("statusbar");
        MainWindow->setStatusBar(statusbar);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        label->setText(QCoreApplication::translate("MainWindow", "Welcome to ClariFile", nullptr));
        label_2->setText(QCoreApplication::translate("MainWindow", "We will organize or shred your unmanaged files!", nullptr));
        navDefaultOrganize->setText(QCoreApplication::translate("MainWindow", "Default Organize", nullptr));
        Documentation->setText(QCoreApplication::translate("MainWindow", "Documentation", nullptr));
        navCustom->setText(QCoreApplication::translate("MainWindow", "Custom Organize", nullptr));
        navShred->setText(QCoreApplication::translate("MainWindow", "File Shred", nullptr));
        (void)MainWindow;
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
