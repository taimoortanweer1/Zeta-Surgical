#pragma once
#include <ZetaSurgical/navigationpresenter.hpp>

namespace ZetaSurgical {
class GUINavigationPresenter;
}

class NavigationPresenterImpl : public ZetaSurgical::NavigationPresenter
{
    Q_OBJECT
public:
    explicit NavigationPresenterImpl(ZetaSurgical::GUINavigationPresenter *);

private:
    ZetaSurgical::GUINavigationPresenter *const m_navigationPresenter;

    // NavigationPresenter interface
public:
    void onNavigationStarted() override;
    void onNavigationFinished() override;
};
