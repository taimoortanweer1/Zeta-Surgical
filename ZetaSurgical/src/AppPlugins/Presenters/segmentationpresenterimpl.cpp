#include "segmentationpresenterimpl.h"
#include <ZetaSurgical/guinavigationpresenter.hpp>

SegmentationPresenterImpl::SegmentationPresenterImpl(ZetaSurgical::GUINavigationPresenter *navPresenter)
    : ZetaSurgical::SegmentationPresenter()
    , m_navigationPresenter(navPresenter)
{
    //qWarning() << __PRETTY_FUNCTION__;
    Q_ASSERT(m_navigationPresenter);
}

void SegmentationPresenterImpl::onSegmentationStarted()
{
    //qWarning() << __PRETTY_FUNCTION__;
    m_navigationPresenter->setTabIndex(1);
    emit m_navigationPresenter->segmentationScreenShown();
}

void SegmentationPresenterImpl::onSegmentationFinished()
{
    m_navigationPresenter->setSegmentationCompleted(true);
}
