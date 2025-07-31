#include "databasemanager.h"
#include <QSqlQuery>
#include <QSqlError>
#include <QVariant>
#include <QDebug>

DatabaseManager::DatabaseManager(QObject *parent) : QObject(parent) {
    m_db = QSqlDatabase::addDatabase("QSQLITE");
    m_db.setDatabaseName("recentfolders.db");

    if (!m_db.open()) {
        qWarning() << "Failed to open database:" << m_db.lastError().text();
    } else {
        initializeDatabase();
    }
}

DatabaseManager::~DatabaseManager() {
    if (m_db.isOpen()) {
        m_db.close();
    }
}

void DatabaseManager::initializeDatabase() {
    QSqlQuery query;
    if (!query.exec("CREATE TABLE IF NOT EXISTS recent_folders ("
                    "id INTEGER PRIMARY KEY AUTOINCREMENT,"
                    "folder_path TEXT UNIQUE,"
                    "last_used DATETIME DEFAULT CURRENT_TIMESTAMP)")) {
        qWarning() << "Failed to create table:" << query.lastError().text();
    }
}

void DatabaseManager::addRecentFolder(const QString &folderPath) {
    QSqlQuery query;
    query.prepare("INSERT OR REPLACE INTO recent_folders (folder_path, last_used) "
                  "VALUES (:folder_path, CURRENT_TIMESTAMP)");
    query.bindValue(":folder_path", folderPath);

    if (!query.exec()) {
        qWarning() << "Failed to insert folder:" << query.lastError().text();
    } else {
        emit recentFoldersChanged();
    }
}

QVariantList DatabaseManager::getRecentFolders() {
    QVariantList folderList;
    QSqlQuery query("SELECT folder_path FROM recent_folders ORDER BY last_used DESC LIMIT 10");

    while (query.next()) {
        folderList.append(query.value(0).toString());
    }
    return folderList;
}
