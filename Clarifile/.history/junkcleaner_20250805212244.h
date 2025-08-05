#ifndef JUNKCLEANER_H
#define JUNKCLEANER_H

#include <QObject>
#include <QStringList>

class JunkCleaner : public QObject {
    Q_OBJECT
    Q_PROPERTY(QStringList filesToDelete READ filesToDelete NOTIFY filesToDeleteChanged)
    Q_PROPERTY(qint64 totalSize READ totalSize NOTIFY totalSizeChanged)

public:
    explicit JunkCleaner(QObject *parent = nullptr);

    Q_INVOKABLE void scanJunk();
    Q_INVOKABLE void cleanJunk();

    QStringList filesToDelete() const;
    qint64 totalSize() const;

signals:
    void filesToDeleteChanged();
    void totalSizeChanged();
    void cleaningStarted();
    void cleaningFinished();

private:
    QStringList m_filesToDelete;
    qint64 m_totalSize;

    void findTempFiles(const QString &dirPath);
};

#endif // JUNKCLEANER_H
