#include "guinavigationpresenterimpl.h"

GUINavigationPresenterImpl::GUINavigationPresenterImpl()
    : ZetaSurgical::GUINavigationPresenter()
{

}

void GUINavigationPresenterImpl::onScreenRequested(int screenId)
{
    if(GUINavigationPresenter::NavigationButtonIds::Upload == screenId) {
        emit selectStudyScreenShown();
        setTabIndex(0);
    } else if(GUINavigationPresenter::NavigationButtonIds::Segmentation == screenId) {
        emit segmentationScreenShown();
        setTabIndex(1);
    } else if(GUINavigationPresenter::NavigationButtonIds::Planning == screenId) {
        emit planningScreenShown();
        setTabIndex(2);
    } else if(GUINavigationPresenter::NavigationButtonIds::Positioning == screenId) {
        emit positioningScreenShown();
        setTabIndex(3);
    } else if(GUINavigationPresenter::NavigationButtonIds::Navigation == screenId) {
        emit navigationScreenShown();
        setTabIndex(4);
    }
}
