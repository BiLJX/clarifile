#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QFileDialog>
#include <QMessageBox>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent), ui(new Ui::MainWindow) {
    ui->setupUi(this);
    connect(ui->navDefaultOrganize, &QPushButton::clicked, this, &MainWindow::onDefaulOrganizeClicked);
    connect(ui->navCustom, &QPushButton::clicked, this, &MainWindow::onCustomOrganizeClicked);
    connect(ui->navShred, &QPushButton::clicked, this, &MainWindow::onFileShredClicked);
}

void MainWindow::onDefaulOrganizeClicked(){
    ui->stackedWidget->setCurrentIndex(1);
}

void MainWindow::onCustomOrganizeClicked(){
    ui->stackedWidget->setCurrentIndex(1);
}

void MainWindow::onFileShredClicked(){
    ui->stackedWidget->setCurrentIndex(1);
}

MainWindow::~MainWindow() {
    delete ui;
}

