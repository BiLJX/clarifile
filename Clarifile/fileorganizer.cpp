#include "fileorganizer.h"
#include <QDir>
#include <QFileInfoList>
#include <QFile>
#include <QFileInfo>
#include <QSet>

FileOrganizer::FileOrganizer(QObject *parent)
    : QObject(parent)
{
    // connect(&m_timer, &QTimer::timeout, this, [this]() {
    //     this->organize(m_autoSourcePath, m_autoDestPath);
    // });
    connect(&m_watcher, &QFileSystemWatcher::directoryChanged,
            this, &FileOrganizer::onDirectoryChanged);
}

void FileOrganizer::startAutoOrganizing(const QString &sourcePath, const QString &destPath, int intervalMs)
{
    if (sourcePath.isEmpty() || destPath.isEmpty()) {
        emit logMessage("Source or destination path is empty.");
        return;
    }

    m_autoSourcePath = sourcePath;
    m_autoDestPath = destPath;
    if (!m_watcher.directories().contains(sourcePath)) {
        m_watcher.addPath(sourcePath);
        emit logMessage("Started watching directory: " + sourcePath);
    }
}

void FileOrganizer::stopAutoOrganizing()
{
    m_timer.stop();
        m_watcher.removePaths(m_watcher.directories());
    emit logMessage("Stopped auto-organizing");
}

void FileOrganizer::onDirectoryChanged(const QString &path)
{
    Q_UNUSED(path)
    organize(m_autoSourcePath, m_autoDestPath);
}

void FileOrganizer::organize(const QString &directoryPath, const QString &destinationDirectory) {
    QDir srcDir(directoryPath);
    QDir destDir(destinationDirectory);
    if (!srcDir.exists()) {
        emit logMessage("Directory does not exist!");
        return;
    }
    if (!destDir.exists()) {
        emit logMessage("Directory does not exist!");
        return;
    }

    // Default classification
    QMap<QString, QSet<QString>> categories = {
        { "Images", {"jpg", "jpeg", "png", "gif", "bmp", "svg", "webp", "tiff"} },
        { "Videos", {"mp4", "avi", "mkv", "mov", "flv", "wmv", "webm"} },
        { "Audio", {"mp3", "wav", "aac", "flac", "ogg", "m4a"} },
        { "Documents", {"pdf", "doc", "docx", "txt", "ppt", "pptx", "xls", "xlsx", "odt"} },
        { "Archives", {"zip", "rar", "7z", "tar", "gz", "bz2"} },
        { "Code", {"cpp", "h", "hpp", "py", "js", "ts", "java", "cs", "html", "css"} },
        { "Executables", {"exe", "msi", "bat", "cmd", "sh", "apk", "app"} },
        { "System", {"dll", "sys", "ini", "drv", "bin", "iso"} }
    };

    QFileInfoList files = srcDir.entryInfoList(QDir::Files);
    for (const QFileInfo &fileInfo : files) {
        QString ext = fileInfo.suffix().toLower();
        QString categoryFolder = "Others";

        if (ext.isEmpty()) {
            categoryFolder = "Unknown";
        } else {
            bool found = false;
            for (auto it = categories.begin(); it != categories.end(); ++it) {
                if (it.value().contains(ext)) {
                    categoryFolder = it.key();
                    found = true;
                    break;
                }
            }
            if (!found) {
                categoryFolder = ext.toUpper();
            }
        }

        QString targetDirPath = destDir.absolutePath() + "/" + categoryFolder;
        QDir().mkpath(targetDirPath);

        QString newFilePath = targetDirPath + "/" + fileInfo.fileName();

        if (QFile::exists(newFilePath)) {
            emit logMessage("File already exists at destination: " + newFilePath);
            continue; // Skip or handle overwrite logic
        }

        if (QFile::rename(fileInfo.absoluteFilePath(), newFilePath)) {
            emit logMessage("Moved: " + fileInfo.fileName() + " -> " + categoryFolder);
        } else {
            emit logMessage("Failed to move: " + fileInfo.fileName());
        }
    }

    emit logMessage("Organization Complete!");
}

void FileOrganizer::customOrganize(const QString &directoryPath, const QMap<QString, QString> &customFolders) {
    QDir dir(directoryPath);
    if (!dir.exists()) {
        emit logMessage("Directory does not exist!");
        return;
    }

    // Same category definition as default
    QMap<QString, QSet<QString>> categories = {
        { "Images", {"jpg", "jpeg", "png", "gif", "bmp", "svg", "webp", "tiff"} },
        { "Videos", {"mp4", "avi", "mkv", "mov", "flv", "wmv", "webm"} },
        { "Audio", {"mp3", "wav", "aac", "flac", "ogg", "m4a"} },
        { "Documents", {"pdf", "doc", "docx", "txt", "ppt", "pptx", "xls", "xlsx", "odt"} },
        { "Archives", {"zip", "rar", "7z", "tar", "gz", "bz2"} },
        { "Code", {"cpp", "h", "hpp", "py", "js", "ts", "java", "cs", "html", "css"} },
        { "Executables", {"exe", "msi", "bat", "cmd", "sh", "apk", "app"} },
        { "System", {"dll", "sys", "ini", "drv", "bin", "iso"} }
    };

    QFileInfoList files = dir.entryInfoList(QDir::Files);
    for (const QFileInfo &fileInfo : files) {
        QString ext = fileInfo.suffix().toLower();
        QString categoryFolder = "Others";

        if (ext.isEmpty()) {
            categoryFolder = "Unknown";
        } else {
            bool found = false;
            for (auto it = categories.begin(); it != categories.end(); ++it) {
                if (it.value().contains(ext)) {
                    categoryFolder = it.key();
                    found = true;
                    break;
                }
            }
            if (!found) {
                categoryFolder = ext.toUpper();
            }
        }

        // If user provided a custom folder for this category, use it
        QString targetDirPath;
        if (customFolders.contains(categoryFolder)) {
            targetDirPath = customFolders[categoryFolder];
        } else {
            targetDirPath = dir.absolutePath() + "/" + categoryFolder; // Default
        }

        QDir().mkpath(targetDirPath);

        QString newFilePath = targetDirPath + "/" + fileInfo.fileName();
        QFile::rename(fileInfo.absoluteFilePath(), newFilePath);

        emit logMessage("Moved: " + fileInfo.fileName() + " -> " + targetDirPath);
    }

    emit logMessage("Custom Organization Complete!");
}
