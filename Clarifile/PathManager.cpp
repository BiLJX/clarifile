#include "PathManager.h"

PathManager::PathManager(QObject *parent)
    : QObject(parent)
{
    initDB();
    loadPaths();
}

void PathManager::initDB()
{
    // Create or open SQLite DB
    m_db = QSqlDatabase::addDatabase("QSQLITE");
    m_db.setDatabaseName("paths.db");

    if (!m_db.open()) {
        qWarning() << "Failed to open database:" << m_db.lastError().text();
        return;
    }

    QSqlQuery query;
    QString createTable = "CREATE TABLE IF NOT EXISTS paths ("
                          "id INTEGER PRIMARY KEY, "
                          "root TEXT, "
                          "destination TEXT)";
    if (!query.exec(createTable)) {
        qWarning() << "Failed to create table:" << query.lastError().text();
    }

    // Insert initial row if none exists
    query.exec("INSERT OR IGNORE INTO paths (id, root, destination) VALUES (1, '', '')");
}

QString PathManager::rootPath() const
{
    return m_rootPath;
}

QString PathManager::destPath() const
{
    return m_destPath;
}

void PathManager::loadPaths()
{
    if (!m_db.isOpen()) return;

    QSqlQuery query("SELECT root, destination FROM paths WHERE id = 1");
    if (query.next()) {
        m_rootPath = query.value(0).toString();
        m_destPath = query.value(1).toString();
        emit pathChanged();
    } else {
        qWarning() << "Failed to load paths:" << query.lastError().text();
    }
}

void PathManager::updateRootPath(const QString &path)
{
    if (!m_db.isOpen()) return;

    m_rootPath = path;

    QSqlQuery query;
    query.prepare("UPDATE paths SET root = :root WHERE id = 1");
    query.bindValue(":root", path);

    if (!query.exec()) {
        qWarning() << "Failed to update root path:" << query.lastError().text();
    }

    emit pathChanged();
}

void PathManager::updateDestPath(const QString &path)
{
    if (!m_db.isOpen()) return;

    m_destPath = path;

    QSqlQuery query;
    query.prepare("UPDATE paths SET destination = :destination WHERE id = 1");
    query.bindValue(":destination", path);

    if (!query.exec()) {
        qWarning() << "Failed to update destination path:" << query.lastError().text();
    }

    emit pathChanged();
}
