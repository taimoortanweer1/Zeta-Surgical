#include "cartpresenterimpl.h"

CartPresenterImpl::CartPresenterImpl()
    : ZetaSurgical::CartPresenter()
{
    m_dummyTimer.setInterval(100);
    connect(&m_dummyTimer, &QTimer::timeout, this, [this](){
        m_distance += 1;
        if(m_distance > 100)
            m_distance = 0;
        setCameraToFaceDistanceString(QStringLiteral("%1 mm").arg(m_distance));
    });
    m_dummyTimer.start();
}

void CartPresenterImpl::toggleWheelsLock()
{
    setWheelsAreLocked(!wheelsAreLocked());
}
