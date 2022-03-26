#include "keyboardpresenterimpl.h"
#include "keyboardconstants.h"
#include "keyboard_log.h"

#include <QClipboard>
#include <QCoreApplication>
#include <QGuiApplication>
#include <QJsonDocument>
#include <QKeyEvent>
#include <QQuickWindow>
#include <QQuickItem>

int const KEY_WITH_TEXT = 0;

KeyboardPresenterImpl::KeyboardPresenterImpl(QQuickWindow *window)
  : ZetaSurgical::KeyboardPresenter()
  , m_shiftLockEnabled(false)
  , m_shiftEnabled(false)
  , m_window(window)
{
    //Q_ASSERT(window);
    readLayoutsFromFile(LAYOUTS_FILE);
    readLayoutNames();
    loadLayoutAtIndex(0);
    kpInfo() << "Loaded following layouts:" << m_layoutNames;
}

void KeyboardPresenterImpl::readLayoutNames()
{
    m_layoutNames.clear();

    for (int i = 0; i < m_layouts.count(); ++i) {
        QJsonObject obj;
        QString const &name = m_layouts.at(i).toObject()[JsonConstants::NAME].toString();
        m_layoutNames << name;
    }
}

void KeyboardPresenterImpl::readLayoutsFromFile(const QString &fileName)
{
    QFile file(fileName);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning(keyboardPresenter) << "Error open file:" << file.errorString();
        Q_ASSERT(false);
        return;
    }

    QByteArray val = file.readAll();
    QJsonParseError error;
    QJsonDocument d = QJsonDocument::fromJson(val, &error);
    if (d.isNull()) {
        qWarning(keyboardPresenter) << error.errorString();
        Q_ASSERT(false);
        return;
    }

    Q_ASSERT(d.isArray());
    m_layouts = d.array();
}

void KeyboardPresenterImpl::setupModel(GreenHouse::Model *model, QJsonArray data, QString roleName)
{
    model->clear();

    for (int i = 0; i < data.count(); ++i) {
        QJsonObject obj;
        obj[roleName] = data.at(i).toString();
        model->appendRow(obj);
    }
}

void KeyboardPresenterImpl::loadLayoutAtIndex(int index)
{
    if (index < 0 || index >= m_layouts.count()) {
        qWarning(keyboardPresenter) << "No layout available at index: " << index;
    }
    QJsonObject const layout = m_layouts.at(index).toObject();

    lower_case_row1 = layout[JsonConstants::LOWER_CASE].toObject()[JsonConstants::ROW1].toArray();
    lower_case_row2 = layout[JsonConstants::LOWER_CASE].toObject()[JsonConstants::ROW2].toArray();
    lower_case_row3 = layout[JsonConstants::LOWER_CASE].toObject()[JsonConstants::ROW3].toArray();
    lower_case_row4 = layout[JsonConstants::LOWER_CASE].toObject()[JsonConstants::ROW4].toArray();

    upper_case_row1 = layout[JsonConstants::UPPER_CASE].toObject()[JsonConstants::ROW1].toArray();
    upper_case_row2 = layout[JsonConstants::UPPER_CASE].toObject()[JsonConstants::ROW2].toArray();
    upper_case_row3 = layout[JsonConstants::UPPER_CASE].toObject()[JsonConstants::ROW3].toArray();
    upper_case_row4 = layout[JsonConstants::UPPER_CASE].toObject()[JsonConstants::ROW4].toArray();

    reloadLayoutCase();
}

void KeyboardPresenterImpl::reloadLayoutCase()
{
    if (m_shiftLockEnabled || m_shiftEnabled) {
        setupModel(row1Model(), upper_case_row1, Row1ModelRoles::ValueRole);
        setupModel(row2Model(), upper_case_row2, Row2ModelRoles::ValueRole);
        setupModel(row3Model(), upper_case_row3, Row3ModelRoles::ValueRole);
        setupModel(row4Model(), upper_case_row4, Row4ModelRoles::ValueRole);
    } else {
        setupModel(row1Model(), lower_case_row1, Row1ModelRoles::ValueRole);
        setupModel(row2Model(), lower_case_row2, Row2ModelRoles::ValueRole);
        setupModel(row3Model(), lower_case_row3, Row3ModelRoles::ValueRole);
        setupModel(row4Model(), lower_case_row4, Row4ModelRoles::ValueRole);
    }
}

void KeyboardPresenterImpl::sendKeyEvents(int key, const QString &keyText, Qt::KeyboardModifiers modifiers)
{
    QKeyEvent pressEvent(QEvent::KeyPress, key, modifiers, keyText);
    QKeyEvent releaseEvent(QEvent::KeyRelease, key, modifiers, keyText);

    if(!m_window)
        return;
    QCoreApplication::sendEvent(m_window, &pressEvent);
    QCoreApplication::sendEvent(m_window, &releaseEvent);
}

void KeyboardPresenterImpl::onTabulationClicked()
{
    sendKeyEvents(Qt::Key_Tab);
}

void KeyboardPresenterImpl::onCopyClicked()
{
    sendKeyEvents(Qt::Key_A, QString(), Qt::ControlModifier);
    sendKeyEvents(Qt::Key_C, QString(), Qt::ControlModifier);
    sendKeyEvents(Qt::Key_Right, QString());
}

void KeyboardPresenterImpl::onPasteClicked()
{
    QKeyEvent *evt = new QKeyEvent(QEvent::Type::KeyPress, Qt::Key_V, Qt::ControlModifier);
    if(!m_window)
        return;
    QCoreApplication::postEvent(m_window, evt);
}

void KeyboardPresenterImpl::onBackspaceClicked()
{
    sendKeyEvents(Qt::Key_Backspace);
}

void KeyboardPresenterImpl::onEnterClicked() { }

void KeyboardPresenterImpl::onLeftArrowClicked()
{
    sendKeyEvents(Qt::Key_Left);
}

void KeyboardPresenterImpl::onRightArrowClicked()
{
    sendKeyEvents(Qt::Key_Right);
}

void KeyboardPresenterImpl::onSpaceClicked()
{
    onCharacterButtonClicked(QStringLiteral(" "));
}

void KeyboardPresenterImpl::onCharacterButtonClicked(const QString &character)
{
    sendKeyEvents(KEY_WITH_TEXT, character);

    if (m_shiftEnabled) {
        m_shiftEnabled = false;
        reloadLayoutCase();
    }
}

void KeyboardPresenterImpl::onShiftClicked()
{
    if (m_shiftLockEnabled)
        return;
    m_shiftEnabled = !m_shiftEnabled;
    reloadLayoutCase();
}

void KeyboardPresenterImpl::onCleanClicked()
{
    sendKeyEvents(Qt::Key_A, QString(), Qt::ControlModifier);
    sendKeyEvents(Qt::Key_Backspace);
}

void KeyboardPresenterImpl::onShiftLockClicked()
{
    m_shiftEnabled = false;
    m_shiftLockEnabled = !m_shiftLockEnabled;
    reloadLayoutCase();
}
