#include "PathManager.h"

PathManager::PathManager(QObject *parent)
    : QObject(parent)
{
    initDB();
    loadPaths();
}

void PathManager::initDB()
{
    m_db = QSqlDatabase::addDatabase("QSQLITE");
    m_db.setDatabaseName("paths.db");

    if (!m_db.open()) {
        qWarning() << "Failed to open database:" << m_db.lastError().text();
        return;
    }

    QSqlQuery query;
    QString createPathsTable = "CREATE TABLE IF NOT EXISTS paths ("
                               "id INTEGER PRIMARY KEY, "
                               "root TEXT, "
                               "destination TEXT)";
    if (!query.exec(createPathsTable)) {
        qWarning() << "Failed to create paths table:" << query.lastError().text();
    }

    QString createStatsTable = "CREATE TABLE IF NOT EXISTS stats ("
                               "id INTEGER PRIMARY KEY, "
                               "filesOrganized INTEGER, "
                               "lastOrganizedTime TEXT)";
    if (!query.exec(createStatsTable)) {
        qWarning() << "Failed to create stats table:" << query.lastError().text();
    }

    query.exec("INSERT OR IGNORE INTO paths (id, root, destination) VALUES (1, '', '')");
    query.exec("INSERT OR IGNORE INTO stats (id, filesOrganized, lastOrganizedTime) VALUES (1, 0, '')");
}

QString PathManager::rootPath() const
{
    return m_rootPath;
}

QString PathManager::destPath() const
{
    return m_destPath;
}

int PathManager::filesOrganized() const
{
    return m_filesOrganized;
}

QString PathManager::lastOrganizedTime() const
{
    return m_lastOrganizedTime;
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

    QSqlQuery statsQuery("SELECT filesOrganized, lastOrganizedTime FROM stats WHERE id = 1");
    if (statsQuery.next()) {
        m_filesOrganized = statsQuery.value(0).toInt();
        m_lastOrganizedTime = statsQuery.value(1).toString();
        emit statsChanged();
    } else {
        qWarning() << "Failed to load stats:" << statsQuery.lastError().text();
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

void PathManager::updateStats(int files, const QString &time)
{
    if (!m_db.isOpen()) return;

    m_filesOrganized = files;
    m_lastOrganizedTime = time;

    QSqlQuery query;
    query.prepare("UPDATE stats SET filesOrganized = :files, lastOrganizedTime = :time WHERE id = 1");
    query.bindValue(":files", files);
    query.bindValue(":time", time);

    if (!query.exec()) {
        qWarning() << "Failed to update stats:" << query.lastError().text();
    }

    emit statsChanged();
}
