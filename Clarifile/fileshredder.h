#ifndef FILESHREDDER_H
#define FILESHREDDER_H

#include <QObject>
#include <QString>

class FileShredder : public QObject {
    Q_OBJECT
public:
    explicit FileShredder(QObject *parent = nullptr);
    void shred(const QString &filePath, int passes = 3);

signals:
    void logMessage(const QString &message);
};

#endif // FILESHREDDER_H