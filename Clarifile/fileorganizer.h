#ifndef FILEORGANIZER_H
#define FILEORGANIZER_H

#include <QObject>
#include <QMap>
#include <QSet>
#include <QTimer>
#include <QFileSystemWatcher>
#include <QVariant>
#include <QVariantMap>

class FileOrganizer : public QObject
{
    Q_OBJECT

public:
    explicit FileOrganizer(QObject *parent = nullptr);
    Q_INVOKABLE void customOrganizeFromQml(const QString &directoryPath, const QVariantMap &folders);
    Q_INVOKABLE void organize(const QString &directoryPath, const QString &destinationDirectory);
    Q_INVOKABLE void customOrganize(const QString &directoryPath, const QMap<QString, QString> &customFolders);
    Q_INVOKABLE void startAutoOrganizing(const QString &sourcePath, const QString &destPath, int intervalMs = 5000); // every 5 sec
    Q_INVOKABLE void stopAutoOrganizing();

signals:
    void logMessage(const QString &msg);

private slots:
    void onDirectoryChanged(const QString &path);

private:
    QTimer m_timer;
    QString m_autoSourcePath;
    QString m_autoDestPath;
       QFileSystemWatcher m_watcher;
};

#endif // FILEORGANIZER_H
