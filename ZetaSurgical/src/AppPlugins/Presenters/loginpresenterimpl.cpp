#include "loginpresenterimpl.h"
#include "popupspresenterimpl.h"

LoginPresenterImpl::LoginPresenterImpl(PopupsPresenterImpl *popupsPresenter)
   : LoginPresenter()
   , m_popupsPresenter(popupsPresenter)
{
    Q_ASSERT(m_popupsPresenter);
}

void LoginPresenterImpl::onUsernameEditRequested()
{
    qWarning() << __PRETTY_FUNCTION__;
    m_popupsPresenter->startUserInput([this](QString const &text){
        setEnteredUsername(text);
    });
}

void LoginPresenterImpl::onPasswordEditRequested()
{
    qWarning() << __PRETTY_FUNCTION__;
    m_popupsPresenter->startPasswordInput([this](QString const &text){
        setEnteredPassword(text);
    });
}

void LoginPresenterImpl::onLoginClicked()
{
    qWarning() << __PRETTY_FUNCTION__;
    if(enteredPassword().compare(QStringLiteral("123")) == 0) {
        emit loggedInScreenShown();
    }

    setEnteredUsername(QString());
    setEnteredPassword(QString());
}
