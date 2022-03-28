#include "popupspresenterimpl.h"

PopupsPresenterImpl::PopupsPresenterImpl()
    : ZetaSurgical::PopupsPresenter()
{}

void PopupsPresenterImpl::startUserInput(TextInputCallback callback)
{
    m_callback = callback;
    emit inputUsernameShown();
}

void PopupsPresenterImpl::startPasswordInput(TextInputCallback callback)
{
    m_callback = callback;
    emit inputPasswordShown();
}

void PopupsPresenterImpl::startFilterInput(TextInputCallback callback)
{
    m_callback = callback;
    emit inputFilterShown();
}

void PopupsPresenterImpl::inputAccepted()
{
    if(!m_callback)
        return;
    m_callback(m_inputText);
    m_callback = nullptr;
    m_inputText.clear();
    emit closeAllPopups();
}

void PopupsPresenterImpl::onInputChanged(const QString &username)
{
    m_inputText = username;
}
