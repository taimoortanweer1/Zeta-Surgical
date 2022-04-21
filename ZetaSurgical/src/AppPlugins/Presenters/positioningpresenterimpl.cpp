#include "positioningpresenterimpl.h"
#include <ZetaSurgical/guinavigationpresenter.hpp>

PositioningPresenterImpl::PositioningPresenterImpl(ZetaSurgical::GUINavigationPresenter *navPresenter)
    : ZetaSurgical::PositioningPresenter()
    , m_navigationPresenter(navPresenter)
{
    Q_ASSERT(m_navigationPresenter);
}


void PositioningPresenterImpl::onPositioningStarted()
{
    m_navigationPresenter->setTabIndex(3);
    emit m_navigationPresenter->positioningScreenShown();
}

void PositioningPresenterImpl::onPositioningFinished()
{
    onRegistrationStarted();
}

void PositioningPresenterImpl::onRegistrationStarted()
{
    emit m_navigationPresenter->registrationScreenShown();
}

void PositioningPresenterImpl::onRegistrationFinished()
{
    m_navigationPresenter->setPositioningCompleted(true);
}
