#include "fileshredder.h"
#include <QFile>
#include <QFileInfo>
#include <QRandomGenerator>
#include <QDebug>
#include <QUrl>

#ifdef Q_OS_UNIX
#include <unistd.h>
#endif

FileShredder::FileShredder(QObject *parent)
    : QObject(parent) {}

void FileShredder::shred(const QString &filePath, int passes) {
    QString localPath = QUrl(filePath).toLocalFile();  // ✅ Convert URL to local file path
    qDebug() << "shred() called with file:" << localPath << "passes:" << passes;

    QFile file(localPath);

    if (!file.exists()) {
        emit logMessage("Error: File does not exist.");
        return;
    }

    if (!file.open(QIODevice::ReadWrite)) {  // ✅ Use ReadWrite
        emit logMessage("Error: Failed to open file for shredding.");
        return;
    }

    qint64 size = file.size();
    if (size <= 0) {
        emit logMessage("Error: File is empty or invalid.");
        file.close();
        return;
    }

    emit logMessage(QString("Shredding file: %1 (%2 bytes)").arg(localPath).arg(size));

    const qint64 chunkSize = 1024 * 1024; // 1 MB

    for (int pass = 0; pass < passes; ++pass) {
        file.seek(0);
        emit logMessage(QString("Pass %1: started").arg(pass + 1));

        qint64 totalWritten = 0;
        while (totalWritten < size) {
            qint64 writeSize = qMin(chunkSize, size - totalWritten);
            QByteArray data(writeSize, '\0');

            if (pass % 3 == 0) {
                data.fill('\x00');
            } else if (pass % 3 == 1) {
                data.fill('\xFF');
            } else {
                for (int i = 0; i < writeSize; ++i)
                    data[i] = static_cast<char>(QRandomGenerator::global()->bounded(256));
            }

            qint64 written = file.write(data);
            if (written != writeSize) {
                emit logMessage("Error: Incomplete write during pass.");
                file.close();
                return;
            }

            totalWritten += written;
        }

        file.flush();

#ifdef Q_OS_UNIX
        int fd = file.handle();
        if (fd != -1) {
            fsync(fd);
        }
#endif

        emit logMessage(QString("Pass %1: completed").arg(pass + 1));
    }

    file.close();

    if (QFile::remove(localPath)) {
        emit logMessage("File successfully shredded and deleted.");
    } else {
        emit logMessage("Error: Failed to delete file after shredding.");
    }
}
