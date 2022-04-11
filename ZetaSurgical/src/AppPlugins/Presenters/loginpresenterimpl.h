#ifndef LoginPresenterIMPL_H
#define LoginPresenterIMPL_H

#include <ZetaSurgical/loginpresenter.hpp>

class PopupsPresenterImpl;

class LoginPresenterImpl : public ZetaSurgical::LoginPresenter
{
    Q_OBJECT
public:
    explicit LoginPresenterImpl(PopupsPresenterImpl *popupsPresenter);
    void onUsernameEditRequested() override;
    void onPasswordEditRequested() override;
    void onLoginClicked() override;
    void onLogoutClicked() override;

protected:
    void init() override;

private:
    void updateLoginButton();

private:
    PopupsPresenterImpl *const m_popupsPresenter;
};

#endif // LoginPresenterIMPL_H
