#ifndef PATHMANAGER_H
#define PATHMANAGER_H

#include <QObject>
#include <QString>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>

class PathManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString rootPath READ rootPath NOTIFY pathChanged)
    Q_PROPERTY(QString destPath READ destPath NOTIFY pathChanged)
    Q_PROPERTY(int filesOrganized READ filesOrganized NOTIFY statsChanged)
    Q_PROPERTY(QString lastOrganizedTime READ lastOrganizedTime NOTIFY statsChanged)

public:
    explicit PathManager(QObject *parent = nullptr);

    QString rootPath() const;
    QString destPath() const;

    int filesOrganized() const;
    QString lastOrganizedTime() const;

    Q_INVOKABLE void loadPaths();
    Q_INVOKABLE void updateRootPath(const QString &path);
    Q_INVOKABLE void updateDestPath(const QString &path);
    Q_INVOKABLE void updateStats(int files, const QString &time);

signals:
    void pathChanged();
    void statsChanged();

private:
    void initDB();

    QString m_rootPath;
    QString m_destPath;

    int m_filesOrganized = 0;
    QString m_lastOrganizedTime;

    QSqlDatabase m_db;
};

#endif // PATHMANAGER_H
