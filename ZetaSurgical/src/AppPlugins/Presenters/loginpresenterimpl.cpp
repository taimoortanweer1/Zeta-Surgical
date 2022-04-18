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
    m_popupsPresenter->startUserInput([this](QString const &text){
        setEnteredUsername(text);
        updateLoginButton();
    });
}

void LoginPresenterImpl::onPasswordEditRequested()
{
    m_popupsPresenter->startPasswordInput([this](QString const &text){
        setEnteredPassword(text);
        updateLoginButton();
    });
}

void LoginPresenterImpl::onLoginClicked()
{
    //if(enteredPassword().compare(QStringLiteral("123")) == 0) {
        emit loggedInScreenShown();
    //}

    setLoggedInUserString(QStringLiteral("Welcome %1").arg(enteredUsername()));
    setEnteredUsername(QString());
    setEnteredPassword(QStringLiteral("123"));
    updateLoginButton();
}

void LoginPresenterImpl::onLogoutClicked()
{
    setLoggedInUserString(QString());
    emit loggedOutScreenShown();
}

void LoginPresenterImpl::init()
{
    updateLoginButton();
    setEnteredPassword(QStringLiteral("123"));
}

void LoginPresenterImpl::updateLoginButton()
{
    setUsernameEntered(!enteredUsername().isEmpty());
    setPasswordEntered(!enteredPassword().isEmpty());
    setLoginDataEntered(enteredPassword().count() > 0 && enteredUsername().count() > 0);
}
