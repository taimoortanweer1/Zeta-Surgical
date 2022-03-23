#ifndef PopupsPresenterIMPL_H
#define PopupsPresenterIMPL_H

#include <ZetaSurgical/popupspresenter.hpp>

using TextInputCallback = std::function<void(QString const &)>;

class PopupsPresenterImpl : public ZetaSurgical::PopupsPresenter
{
    Q_OBJECT
public:
    explicit PopupsPresenterImpl();

    void startUserInput(TextInputCallback callback);
    void startPasswordInput(TextInputCallback callback);

protected:
    void userNameAccepted() override;
    void passwordAccepted() override;

    void onUserNameEdited(QString const &username) override;
    void onPasswordEdited(QString const &password) override;

private:
    TextInputCallback m_callback = nullptr;
    QString m_inputText;
};

#endif // PopupsPresenterIMPL_H
