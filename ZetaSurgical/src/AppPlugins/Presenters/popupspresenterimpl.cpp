#include "popupspresenterimpl.h"

PopupsPresenterImpl::PopupsPresenterImpl()
    : ZetaSurgical::PopupsPresenter()
{}

void PopupsPresenterImpl::startUserInput(TextInputCallback callback)
{
    m_callback = callback;
    emit inputUsernameShown();
    emit keyboardShown();
}

void PopupsPresenterImpl::startPasswordInput(TextInputCallback callback)
{
    m_callback = callback;
    emit inputPasswordShown();
    emit keyboardShown();
}

void PopupsPresenterImpl::startFilterInput(TextInputCallback callback)
{
    m_callback = callback;
    emit inputFilterShown();
    emit keyboardShown();
}

void PopupsPresenterImpl::confirmPointRemoval(ConfirmCallback callback)
{
    m_confirmCallback = callback;
    emit deletePointConfirmationDialogShown();
}

void PopupsPresenterImpl::confirmInstrumentRemoval(ConfirmCallback callback)
{
    m_confirmCallback = callback;
    emit deleteInstrumentConfirmationDialogShown();
}

void PopupsPresenterImpl::startInstrumentIDInput(TextInputCallback callback)
{
    m_callback = callback;
    emit targetIDEditShown();
    emit smallKeyboardShown();
}

void PopupsPresenterImpl::startTargetUpLabelInput(TextInputCallback callback)
{
    m_callback = callback;
    emit targetUpLabelEditShown();
    emit smallKeyboardShown();
}

void PopupsPresenterImpl::startTargetDownLabelInput(TextInputCallback callback)
{
    m_callback = callback;
    emit targetDownLabelEditShown();
    emit smallKeyboardShown();
}

void PopupsPresenterImpl::inputAccepted()
{
    if(!m_callback)
        return;
    m_callback(m_inputText);
    m_callback = nullptr;
    m_inputText.clear();
    emit closeAllPopups();
    emit smallKeyboardHidden();
}

void PopupsPresenterImpl::onConfirmed()
{
    m_confirmCallback();
    m_confirmCallback = nullptr;
    emit closeAllPopups();
    emit smallKeyboardHidden();
}

void PopupsPresenterImpl::onCancelled()
{
    emit closeAllPopups();
    emit smallKeyboardHidden();
    m_confirmCallback = nullptr;
}

void PopupsPresenterImpl::onInputChanged(const QString &username)
{
    m_inputText = username;
    if(!m_callback)
        return;
    m_callback(m_inputText);
}
