#pragma once
#include <ZetaSurgical/positioningpresenter.hpp>

namespace ZetaSurgical {
class GUINavigationPresenter;
}

class PositioningPresenterImpl : public ZetaSurgical::PositioningPresenter
{
    Q_OBJECT
public:
    explicit PositioningPresenterImpl(ZetaSurgical::GUINavigationPresenter *);

private:
    ZetaSurgical::GUINavigationPresenter *const m_navigationPresenter;

    // PositioningPresenter interface
public:
    void onPositioningStarted() override;
    void onPositioningFinished() override;
    void onRegistrationStarted() override;
    void onRegistrationFinished() override;
};
