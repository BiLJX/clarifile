#ifndef FILEORGANIZER_H
#define FILEORGANIZER_H

#include <QObject>
#include <QString>
#include <QMap>

class FileOrganizer : public QObject {
    Q_OBJECT
public:
    explicit FileOrganizer(QObject *parent = nullptr);

   Q_INVOKABLE  void organize(const QString &directoryPath, const QString &destinationDirectory); // Default
    Q_INVOKABLE void customOrganize(const QString &directoryPath, const QMap<QString, QString> &customFolders); // Custom

signals:
    void logMessage(const QString &message);
};

#endif // FILEORGANIZER_H
