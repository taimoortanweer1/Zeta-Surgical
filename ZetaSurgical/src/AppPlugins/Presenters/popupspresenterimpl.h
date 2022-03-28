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
    void startFilterInput(TextInputCallback callback);

protected:
    void onInputChanged(QString const &username) override;
    void inputAccepted() override;

private:
    TextInputCallback m_callback = nullptr;
    QString m_inputText;
};

#endif // PopupsPresenterIMPL_H
