#pragma once
#include <QObject>
#include <QFileDialog>

class FolderPicker : public QObject {
    Q_OBJECT
public:
    explicit FolderPicker(QObject *parent = nullptr) : QObject(parent) {}

    Q_INVOKABLE QString pickFolder() {
        QString dir = QFileDialog::getExistingDirectory(nullptr, "Select Folder");
        return dir;
    }
};
