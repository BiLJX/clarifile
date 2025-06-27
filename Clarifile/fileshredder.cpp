#include "fileshredder.h"
#include <QFile>
#include <QFileInfo>
#include <QRandomGenerator>

FileShredder::FileShredder(QObject *parent) : QObject(parent) {}

void FileShredder::shred(const QString &filePath, int passes) {
    QFile file(filePath);
    QFileInfo info(file);

    if (!file.exists()) {
        emit logMessage("File not found: " + filePath);
        return;
    }

    qint64 size = info.size();
    for (int i = 0; i < passes; ++i) {
        if (!file.open(QIODevice::WriteOnly)) {
            emit logMessage("Cannot overwrite: " + filePath);
            return;
        }

        QByteArray garbage;
        garbage.resize(static_cast<int>(size));
        for (qint64 j = 0; j < size; ++j) {
            garbage[j] = static_cast<char>(QRandomGenerator::global()->generate() % 256);
        }

        file.write(garbage);
        file.flush();
        file.close();
    }

    file.remove();
    emit logMessage("Shredded: " + info.fileName());
}