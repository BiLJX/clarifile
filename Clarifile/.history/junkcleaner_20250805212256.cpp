#include "junkcleaner.h"
#include <QDirIterator>
#include <QFileInfo>
#include <QFile>
#include <QDebug>
#include <QThread>

JunkCleaner::JunkCleaner(QObject *parent)
    : QObject(parent), m_totalSize(0) {}

QStringList JunkCleaner::filesToDelete() const {
    return m_filesToDelete;
}

qint64 JunkCleaner::totalSize() const {
    return m_totalSize;
}

void JunkCleaner::scanJunk() {
    m_filesToDelete.clear();
    m_totalSize = 0;

#ifdef Q_OS_WIN
    QStringList tempDirs = {
        qgetenv("TEMP"),
        qgetenv("TMP"),
        QDir::tempPath()
    };
#else
    QStringList tempDirs = { "/tmp" };
#endif

    for (const QString &dir : tempDirs) {
        findTempFiles(dir);
    }

    emit filesToDeleteChanged();
    emit totalSizeChanged();
}

void JunkCleaner::findTempFiles(const QString &dirPath) {
    QDirIterator it(dirPath, QDir::Files | QDir::NoSymLinks,
                    QDirIterator::Subdirectories);

    while (it.hasNext()) {
        it.next();
        QFileInfo fileInfo = it.fileInfo();
        m_filesToDelete << fileInfo.absoluteFilePath();
        m_totalSize += fileInfo.size();
    }
}

void JunkCleaner::cleanJunk() {
    emit cleaningStarted();
    QThread::sleep(1); // simulate delay

    for (const QString &filePath : m_filesToDelete) {
        QFile::remove(filePath);
    }

    m_filesToDelete.clear();
    m_totalSize = 0;

    emit filesToDeleteChanged();
    emit totalSizeChanged();

    QThread::sleep(1); // simulate delay
    emit cleaningFinished();
}
