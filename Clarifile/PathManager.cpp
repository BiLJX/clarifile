#include "PathManager.h"
#include <QVariantMap>
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

    // Main paths table (root + destination)
    QString createPathsTable =
        "CREATE TABLE IF NOT EXISTS paths ("
        "id INTEGER PRIMARY KEY, "
        "root TEXT, "
        "destination TEXT)";
    if (!query.exec(createPathsTable)) {
        qWarning() << "Failed to create table:" << query.lastError().text();
    }

    // Custom paths table (category + path)
    QString createCustomTable =
        "CREATE TABLE IF NOT EXISTS custom_paths ("
        "category TEXT PRIMARY KEY, "
        "path TEXT)";
    if (!query.exec(createCustomTable)) {
        qWarning() << "Failed to create custom paths table:" << query.lastError().text();
    }

    // Insert initial row in main paths if none exists
    query.exec("INSERT OR IGNORE INTO paths (id, root, destination) VALUES (1, '', '')");

    // Insert default custom categories
    QStringList categories = {
        "Images", "Videos", "Documents", "Audio",
        "Archives", "Code", "Executables", "System"
    };

    for (const QString &cat : categories) {
        query.prepare("INSERT OR IGNORE INTO custom_paths (category, path) VALUES (:cat, '')");
        query.bindValue(":cat", cat);
        query.exec();
    }
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


QMap<QString, QString> PathManager::customPaths() const
{
    QMap<QString, QString> result;

    if (!m_db.isOpen()) return result;

    QSqlQuery query("SELECT category, path FROM custom_paths");
    while (query.next()) {
        result[query.value(0).toString()] = query.value(1).toString();
    }
    return result;
}

QVariantMap PathManager::customPathsAsVariantMap() const
{
    QVariantMap result;

    if (!m_db.isOpen())
        return result;

    QSqlQuery query("SELECT category, path FROM custom_paths");
    while (query.next()) {
        QString category = query.value(0).toString();
        QString path = query.value(1).toString();
        result.insert(category, path);
    }

    return result;
}

void PathManager::updateCustomPath(const QString &category, const QString &path)
{
    if (!m_db.isOpen()) return;

    QSqlQuery query;
    query.prepare("INSERT OR REPLACE INTO custom_paths (category, path) VALUES (:category, :path)");
    query.bindValue(":category", category);
    query.bindValue(":path", path);

    if (!query.exec()) {
        qWarning() << "Failed to update custom path:" << query.lastError().text();
    } else {
        qDebug() << "Custom path updated successfully for category:" << category;
    }

    emit customPathsChanged();
}
