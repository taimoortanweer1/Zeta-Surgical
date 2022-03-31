#pragma once

#include <ZetaSurgical/cartpresenter.hpp>
#include <QTimer>

class CartPresenterImpl : public ZetaSurgical::CartPresenter
{
    Q_OBJECT
public:
    explicit CartPresenterImpl();
    void toggleWheelsLock() override;

private:
    QTimer m_dummyTimer;
    double m_distance = 0.0;
};
