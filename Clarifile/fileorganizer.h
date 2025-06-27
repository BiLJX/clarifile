#ifndef FILEORGANIZER_H
#define FILEORGANIZER_H

#include <QObject>
#include <QString>

class FileOrganizer : public QObject {
    Q_OBJECT
public:
    explicit FileOrganizer(QObject *parent = nullptr);
    void organize(const QString &directoryPath);

signals:
    void logMessage(const QString &message);
};

#endif // FILEORGANIZER_H