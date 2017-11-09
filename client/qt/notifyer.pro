TEMPLATE = app
TARGET = Notifyer

QT +=
CONFIG += qt plugin

SOURCES += matrix.cpp \
    models/roomlistmodel.cpp \
    models/messageeventmodel.cpp \
    models/imageprovider.cpp \
    models/pixmapprovider.cpp \
    matrixconn.cpp

HEADERS += matrix.h \
    models/roomlistmodel.h \
    models/messageeventmodel.h \
    models/imageprovider.h \
    models/pixmapprovider.h \
    matrixconn.h

OTHER_FILES = qmldir

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
    copy_qmldir.commands = $(COPY_FILE) \"$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)\" \"$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)\"
    QMAKE_EXTRA_TARGETS += copy_qmldir
    PRE_TARGETDEPS += $$copy_qmldir.target
}

qmldir.files = qmldir
installPath = $${UBUNTU_CLICK_PLUGIN_PATH}/Matrix
qmldir.path = $$installPath
target.path = $$installPath
INSTALLS += target qmldir
