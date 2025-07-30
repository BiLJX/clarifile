#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "FolderPicker.h"
int main(int argc, char *argv[])
{
    QApplication app(argc, argv); // <-- Now supports QWidget dialogs

    QQmlApplicationEngine engine;

    FolderPicker picker;
    engine.rootContext()->setContextProperty("folderPicker", &picker);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}
