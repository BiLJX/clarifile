/****************************************************************************
** Meta object code from reading C++ file 'junkcleaner.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.9.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../junkcleaner.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'junkcleaner.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 69
#error "This file was generated using the moc from 6.9.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {
struct qt_meta_tag_ZN11JunkCleanerE_t {};
} // unnamed namespace

template <> constexpr inline auto JunkCleaner::qt_create_metaobjectdata<qt_meta_tag_ZN11JunkCleanerE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "JunkCleaner",
        "filesToDeleteChanged",
        "",
        "totalSizeChanged",
        "cleaningStarted",
        "cleaningFinished",
        "scanJunk",
        "cleanJunk",
        "clear",
        "filesToDelete",
        "totalSize"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'filesToDeleteChanged'
        QtMocHelpers::SignalData<void()>(1, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'totalSizeChanged'
        QtMocHelpers::SignalData<void()>(3, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'cleaningStarted'
        QtMocHelpers::SignalData<void()>(4, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'cleaningFinished'
        QtMocHelpers::SignalData<void()>(5, 2, QMC::AccessPublic, QMetaType::Void),
        // Method 'scanJunk'
        QtMocHelpers::MethodData<void()>(6, 2, QMC::AccessPublic, QMetaType::Void),
        // Method 'cleanJunk'
        QtMocHelpers::MethodData<void()>(7, 2, QMC::AccessPublic, QMetaType::Void),
        // Method 'clear'
        QtMocHelpers::MethodData<void()>(8, 2, QMC::AccessPublic, QMetaType::Void),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'filesToDelete'
        QtMocHelpers::PropertyData<QStringList>(9, QMetaType::QStringList, QMC::DefaultPropertyFlags, 0),
        // property 'totalSize'
        QtMocHelpers::PropertyData<qint64>(10, QMetaType::LongLong, QMC::DefaultPropertyFlags, 1),
    };
    QtMocHelpers::UintData qt_enums {
    };
    return QtMocHelpers::metaObjectData<JunkCleaner, qt_meta_tag_ZN11JunkCleanerE_t>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums);
}
Q_CONSTINIT const QMetaObject JunkCleaner::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN11JunkCleanerE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN11JunkCleanerE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN11JunkCleanerE_t>.metaTypes,
    nullptr
} };

void JunkCleaner::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<JunkCleaner *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->filesToDeleteChanged(); break;
        case 1: _t->totalSizeChanged(); break;
        case 2: _t->cleaningStarted(); break;
        case 3: _t->cleaningFinished(); break;
        case 4: _t->scanJunk(); break;
        case 5: _t->cleanJunk(); break;
        case 6: _t->clear(); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (JunkCleaner::*)()>(_a, &JunkCleaner::filesToDeleteChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (JunkCleaner::*)()>(_a, &JunkCleaner::totalSizeChanged, 1))
            return;
        if (QtMocHelpers::indexOfMethod<void (JunkCleaner::*)()>(_a, &JunkCleaner::cleaningStarted, 2))
            return;
        if (QtMocHelpers::indexOfMethod<void (JunkCleaner::*)()>(_a, &JunkCleaner::cleaningFinished, 3))
            return;
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<QStringList*>(_v) = _t->filesToDelete(); break;
        case 1: *reinterpret_cast<qint64*>(_v) = _t->totalSize(); break;
        default: break;
        }
    }
}

const QMetaObject *JunkCleaner::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *JunkCleaner::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN11JunkCleanerE_t>.strings))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int JunkCleaner::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 7)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 7;
    }
    if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    }
    return _id;
}

// SIGNAL 0
void JunkCleaner::filesToDeleteChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void JunkCleaner::totalSizeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void JunkCleaner::cleaningStarted()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void JunkCleaner::cleaningFinished()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}
QT_WARNING_POP
