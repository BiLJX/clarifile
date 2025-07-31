#ifndef DATABASEMANAGER_H
#define DATABASEMANAGER_H

#include <QObject>
#include <QSqlDatabase>
#include <QStringList>
#include <QVariantList>

class DatabaseManager : public QObject {
    Q_OBJECT

public:
    explicit DatabaseManager(QObject *parent = nullptr);
    ~DatabaseManager();

    Q_INVOKABLE void addRecentFolder(const QString &folderPath);

    // Choose one getRecentFolders, QVariantList is more QML friendly
    Q_INVOKABLE QVariantList getRecentFolders();

signals:
    void recentFoldersChanged();

private:
    void initializeDatabase();

    QSqlDatabase m_db;
};

#endif // DATABASEMANAGER_H
