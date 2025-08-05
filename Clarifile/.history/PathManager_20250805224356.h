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

    Q_INVOKABLE void loadPaths();
    Q_INVOKABLE void updateRootPath(const QString &path);
    Q_INVOKABLE void updateDestPath(const QString &path);

signals:
    void pathChanged();

private:
    void initDB();

    QString m_rootPath;
    QString m_destPath;

    QSqlDatabase m_db;
};

#endif // PATHMANAGER_H
