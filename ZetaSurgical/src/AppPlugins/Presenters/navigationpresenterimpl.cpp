#include "navigationpresenterimpl.h"
#include <ZetaSurgical/guinavigationpresenter.hpp>

NavigationPresenterImpl::NavigationPresenterImpl(ZetaSurgical::GUINavigationPresenter *navPresenter)
    : ZetaSurgical::NavigationPresenter()
    , m_navigationPresenter(navPresenter)
{
    Q_ASSERT(m_navigationPresenter);
}


void NavigationPresenterImpl::onNavigationStarted()
{
    m_navigationPresenter->setTabIndex(4);
    emit m_navigationPresenter->navigationScreenShown();
}

void NavigationPresenterImpl::onNavigationFinished()
{
}
