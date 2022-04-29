#ifndef PopupsPresenterIMPL_H
#define PopupsPresenterIMPL_H

#include <ZetaSurgical/popupspresenter.hpp>

using TextInputCallback = std::function<void(QString const &)>;
using ConfirmCallback = std::function<void()>;

class PopupsPresenterImpl : public ZetaSurgical::PopupsPresenter
{
    Q_OBJECT
public:
    explicit PopupsPresenterImpl();

    void startUserInput(TextInputCallback callback);
    void startPasswordInput(TextInputCallback callback);
    void startFilterInput(TextInputCallback callback);
    void confirmPointRemoval(ConfirmCallback callback);
    void confirmInstrumentRemoval(ConfirmCallback callback);

    void startInstrumentIDInput(TextInputCallback callback);
    void startTargetUpLabelInput(TextInputCallback callback);
    void startTargetDownLabelInput(TextInputCallback callback);

protected:
    void onInputChanged(QString const &username) override;
    void inputAccepted() override;
    void onConfirmed() override;
    void onCancelled() override;

private:
    TextInputCallback m_callback = nullptr;
    ConfirmCallback m_confirmCallback = nullptr;
    QString m_inputText;
};

#endif // PopupsPresenterIMPL_H
