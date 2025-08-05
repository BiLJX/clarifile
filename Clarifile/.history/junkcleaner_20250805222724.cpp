#include "junkcleaner.h"
#include <QDirIterator>
#include <QFileInfo>
#include <QFile>
#include <QDebug>
#include <QThread>
#include <QDateTime>
#include <QDir>

#ifdef Q_OS_WIN
#include <windows.h>
#include <shlobj.h>

// Move file to Recycle Bin instead of deleting permanently
bool moveToTrash(const QString &filePath) {
    SHFILEOPSTRUCT fileOp = {0};
    QString from = filePath + '\0'; // Double null-terminated
    fileOp.wFunc = FO_DELETE;
    fileOp.pFrom = (LPCWSTR)from.utf16();
    fileOp.fFlags = FOF_ALLOWUNDO | FOF_NOCONFIRMATION | FOF_SILENT;
    return SHFileOperation(&fileOp) == 0;
}
#endif

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
        if (!dir.isEmpty())
            findTempFiles(dir);
    }

    emit filesToDeleteChanged();
    emit totalSizeChanged();
}

void JunkCleaner::findTempFiles(const QString &dirPath) {
    QStringList allowedExtensions = { "tmp", "log", "bak", "old" };

    QDirIterator it(dirPath, QDir::Files | QDir::NoSymLinks, QDirIterator::Subdirectories);

    while (it.hasNext()) {
        it.next();
        QFileInfo fileInfo = it.fileInfo();
        QString filePath = fileInfo.absoluteFilePath();

        // Only allow files with specific extensions
        if (!allowedExtensions.contains(fileInfo.suffix(), Qt::CaseInsensitive))
            continue;

        // Skip recently modified files (within the last hour)
        if (fileInfo.lastModified().secsTo(QDateTime::currentDateTime()) < 3600)
            continue;

        // Skip if the file is not writable
        if (!fileInfo.isWritable())
            continue;

        // Skip hidden or symlink files
        if (fileInfo.isHidden() || fileInfo.isSymLink())
            continue;

        // Passed all checks
        m_filesToDelete << filePath;
        m_totalSize += fileInfo.size();
    }
}

void JunkCleaner::cleanJunk() {
    emit cleaningStarted();
    QThread::sleep(1); // simulate delay

    for (const QString &filePath : m_filesToDelete) {
#ifdef Q_OS_WIN
        moveToTrash(filePath); // Safer deletion
#else
        QFile::remove(filePath); // Fallback for Linux/macOS
#endif
    }

    m_filesToDelete.clear();
    m_totalSize = 0;

    emit filesToDeleteChanged();
    emit totalSizeChanged();

    QThread::sleep(1); // simulate delay
    emit cleaningFinished();
}

// New clear method to reset state
void JunkCleaner::clear() {
    m_filesToDelete.clear();
    m_totalSize = 0;
    emit filesToDeleteChanged();
    emit totalSizeChanged();
}
