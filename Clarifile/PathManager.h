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
    Q_PROPERTY(QString autoRootPath READ autoRootPath NOTIFY autoPathChanged)
    Q_PROPERTY(QString autoDestPath READ autoDestPath NOTIFY autoPathChanged)
public:
    explicit PathManager(QObject *parent = nullptr);

    QString rootPath() const;
    QString destPath() const;
    QString autoRootPath() const;
    QString autoDestPath() const;

    Q_INVOKABLE void loadPaths();
    Q_INVOKABLE void updateRootPath(const QString &path);
    Q_INVOKABLE void updateDestPath(const QString &path);
    Q_INVOKABLE QMap<QString, QString> customPaths() const;
    Q_INVOKABLE void updateCustomPath(const QString &category, const QString &path);
    Q_INVOKABLE QVariantMap customPathsAsVariantMap() const;

    Q_INVOKABLE void updateAutoRootPath(const QString &path);
    Q_INVOKABLE void updateAutoDestPath(const QString &path);


signals:
    void pathChanged();
    void customPathsChanged();
    void autoPathChanged();
private:
    void initDB();

    QString m_rootPath;
    QString m_destPath;
    QString m_autoRootPath;
    QString m_autoDestPath;

    QSqlDatabase m_db;
};

#endif // PATHMANAGER_H
