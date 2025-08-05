#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QIcon>

#include "fileorganizer.h"
#include "FolderPicker.h"
#include "PathManager.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv); // QWidget support

    // ✅ Set window/taskbar icon
    app.setWindowIcon(QIcon(":/icons/logo.ico"));

    QQmlApplicationEngine engine;

    FolderPicker picker;
    FileOrganizer organizer;
    PathManager pathManager;

    engine.rootContext()->setContextProperty("fileOrganizer", &organizer);
    engine.rootContext()->setContextProperty("folderPicker", &picker);
    engine.rootContext()->setContextProperty("pathManager", &pathManager); // ✅ Add this line

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
