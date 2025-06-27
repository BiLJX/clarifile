#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "fileorganizer.h"
#include "fileshredder.h"
#include <QFileDialog>
#include <QMessageBox>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent), ui(new Ui::MainWindow) {
    ui->setupUi(this);
    organizer = new FileOrganizer(this);
    shredder = new FileShredder(this);

    connect(organizer, &FileOrganizer::logMessage, this, &MainWindow::log);
    connect(shredder, &FileShredder::logMessage, this, &MainWindow::log);

    connect(ui->browseButton, &QPushButton::clicked, this, &MainWindow::browseFolder);
    connect(ui->organizeButton, &QPushButton::clicked, this, &MainWindow::organizeFiles);
    connect(ui->shredButton, &QPushButton::clicked, this, &MainWindow::shredFiles);
}

MainWindow::~MainWindow() {
    delete ui;
}

void MainWindow::log(const QString &message) {
    ui->listWidget->addItem(message);
}

void MainWindow::browseFolder() {
    QString path = QFileDialog::getExistingDirectory(this, "Select Directory");
    if (!path.isEmpty()) ui->lineEdit->setText(path);
}

void MainWindow::organizeFiles() {
    QString path = ui->lineEdit->text();
    organizer->organize(path);
}

void MainWindow::shredFiles() {
    QString file = QFileDialog::getOpenFileName(this, "Select File to Shred");
    if (!file.isEmpty()) shredder->shred(file);
}