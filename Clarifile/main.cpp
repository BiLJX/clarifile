#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QIcon>

#include "fileorganizer.h"
#include "FolderPicker.h"
#include "PathManager.h"
<<<<<<< HEAD
#include "fileshredder.h"
=======
#include "junkcleaner.h" // 
>>>>>>> 0b79c87 (Junk Cleaner Feature)

int main(int argc, char *argv[])
{
    QApplication app(argc, argv); // QWidget support

    app.setWindowIcon(QIcon(":/icons/logo.ico"));

    QQmlApplicationEngine engine;

    FolderPicker picker;
    FileOrganizer organizer;
    PathManager pathManager;
<<<<<<< HEAD
    FileShredder shredder;  // Create instance
=======
    JunkCleaner junkCleaner; // ✅ Instantiate
>>>>>>> 0b79c87 (Junk Cleaner Feature)

    engine.rootContext()->setContextProperty("fileShredder", &shredder);
    engine.rootContext()->setContextProperty("fileOrganizer", &organizer);
    engine.rootContext()->setContextProperty("folderPicker", &picker);
    engine.rootContext()->setContextProperty("pathManager", &pathManager);
    engine.rootContext()->setContextProperty("junkCleaner", &junkCleaner); // ✅ Register for QML

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}