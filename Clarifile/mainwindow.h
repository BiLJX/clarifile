#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class FileOrganizer;
class FileShredder;

class MainWindow : public QMainWindow {
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void browseFolder();
    void organizeFiles();
    void shredFiles();
    void log(const QString &message);

private:
    Ui::MainWindow *ui;
    FileOrganizer *organizer;
    FileShredder *shredder;
};

#endif // MAINWINDOW_H