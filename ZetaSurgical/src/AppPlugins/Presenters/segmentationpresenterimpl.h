#pragma once
#include <ZetaSurgical/segmentationpresenter.hpp>

namespace ZetaSurgical {
class GUINavigationPresenter;
}

class SegmentationPresenterImpl : public ZetaSurgical::SegmentationPresenter
{
    Q_OBJECT
public:
    explicit SegmentationPresenterImpl(ZetaSurgical::GUINavigationPresenter *);
    void onSegmentationStarted() override;
    void onSegmentationFinished() override;

private:
    ZetaSurgical::GUINavigationPresenter *const m_navigationPresenter;
};
