#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "fileorganizer.h"
#include "FolderPicker.h"
#include "databasemanager.h"  // Include your new database manager header

int main(int argc, char *argv[])
{
    QApplication app(argc, argv); // Now supports QWidget dialogs

    // ✅ Set the window + taskbar icon
    app.setWindowIcon(QIcon(":/icons/logo.ico"));  // Path from your .qrc

    QQmlApplicationEngine engine;

    FolderPicker picker;
    FileOrganizer organizer;
    DatabaseManager dbManager;  // Instantiate the database manager

    engine.rootContext()->setContextProperty("fileOrganizer", &organizer);
    engine.rootContext()->setContextProperty("folderPicker", &picker);
    engine.rootContext()->setContextProperty("dbManager", &dbManager);  // Expose to QML

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}
