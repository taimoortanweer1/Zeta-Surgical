#pragma once

#include <ZetaSurgical/keyboardpresenter.hpp>

class QQuickWindow;

class KeyboardPresenterImpl : public ZetaSurgical::KeyboardPresenter
{
    Q_OBJECT
public:
    explicit KeyboardPresenterImpl(QQuickWindow *window);

    virtual void onTabulationClicked() override;
    virtual void onShiftLockClicked() override;
    virtual void onCopyClicked() override;
    virtual void onPasteClicked() override;
    virtual void onBackspaceClicked() override;
    virtual void onEnterClicked() override;
    virtual void onLeftArrowClicked() override;
    virtual void onRightArrowClicked() override;
    virtual void onSpaceClicked() override;
    virtual void onCharacterButtonClicked(const QString &character) override;
    virtual void onShiftClicked() override;
    virtual void onCleanClicked() override;

private:
    void readLayoutNames();
    void readLayoutsFromFile(QString const &fileName);
    void setupModel(GreenHouse::Model *model, QJsonArray data, QString roleName);
    void loadLayoutAtIndex(int index);
    void reloadLayoutCase();
    void sendKeyEvents(int key, QString const &keyText = QString(), Qt::KeyboardModifiers modifiers = Qt::NoModifier);

private:
    QJsonArray lower_case_row1;
    QJsonArray lower_case_row2;
    QJsonArray lower_case_row3;
    QJsonArray lower_case_row4;

    QJsonArray upper_case_row1;
    QJsonArray upper_case_row2;
    QJsonArray upper_case_row3;
    QJsonArray upper_case_row4;

    QStringList m_layoutNames;
    QJsonArray m_layouts;
    bool m_shiftLockEnabled;
    bool m_shiftEnabled;

    QQuickWindow *const m_window;
};
