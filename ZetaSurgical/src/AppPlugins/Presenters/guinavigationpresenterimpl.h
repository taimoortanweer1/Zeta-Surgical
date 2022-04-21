#pragma once
#include <ZetaSurgical/guinavigationpresenter.hpp>

class GUINavigationPresenterImpl : public ZetaSurgical::GUINavigationPresenter
{
    Q_OBJECT
public:
    explicit GUINavigationPresenterImpl();
    void onScreenRequested(int screenId) override;
};
