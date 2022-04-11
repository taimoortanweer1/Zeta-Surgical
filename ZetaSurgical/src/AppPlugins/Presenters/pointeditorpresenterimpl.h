#pragma once

#include <ZetaSurgical/pointeditorpresenter.hpp>

struct Point {
    double x = 0.0;
    double y = 0.0;
    double z = 0.0;
    void clear() {
        x = 0.0;
        y = 0.0;
        z = 0.0;
    }
};

using Callback = std::function<void(Point const &)>;

class PointEditorPresenterImpl : public ZetaSurgical::PointEditorPresenter
{
    Q_OBJECT
public:
    explicit PointEditorPresenterImpl();
    void addNewPoint(Callback);
    void editPoint(Point const &point, Callback);

    void init();

    void onNorthButtonClicked();
    void onSouthButtonClicked();
    void onWestButtonClicked();
    void onEastButtonClicked();
    void onAddPointClicked();
    void onSelectModeClicked(int mode);

private:

    void updatePointStrings();

    Callback m_callback;
    Point m_point;
};
