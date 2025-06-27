#include "fileorganizer.h"
#include <QDir>
#include <QFileInfoList>
#include <QFile>
#include <QFileInfo>

FileOrganizer::FileOrganizer(QObject *parent) : QObject(parent) {}

void FileOrganizer::organize(const QString &directoryPath) {
    QDir dir(directoryPath);
    if (!dir.exists()) {
        emit logMessage("Directory does not exist!");
        return;
    }

    QFileInfoList files = dir.entryInfoList(QDir::Files);
    for (const QFileInfo &fileInfo : files) {
        QString ext = fileInfo.suffix().toLower();
        if (ext.isEmpty()) continue;

        QString targetDirPath = dir.absolutePath() + "/" + ext.toUpper();
        QDir().mkpath(targetDirPath);

        QString newFilePath = targetDirPath + "/" + fileInfo.fileName();
        QFile::rename(fileInfo.absoluteFilePath(), newFilePath);

        emit logMessage("Moved: " + fileInfo.fileName() + " -> " + ext.toUpper());
    }

    emit logMessage("Organization Complete!");
}