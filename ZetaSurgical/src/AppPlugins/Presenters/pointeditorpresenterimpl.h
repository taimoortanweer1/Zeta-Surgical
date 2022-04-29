#pragma once

#include <ZetaSurgical/pointeditorpresenter.hpp>

class PopupsPresenterImpl;

struct Point {
    double x = 0.0;
    double y = 0.0;
    double z = 0.0;
    QString name;
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
    explicit PointEditorPresenterImpl(PopupsPresenterImpl *popupsPresenter);
    void addNewPoint(Callback);
    void editPoint(Point const &point, Callback);

    void init() override;

    void onNorthButtonClicked() override;
    void onSouthButtonClicked() override;
    void onWestButtonClicked() override;
    void onEastButtonClicked() override;
    void onAddPointClicked() override;
    void onSelectModeClicked(int mode) override;
    void onTargetIDEditRequested() override;
    void onTargetUpLabelEditRequested() override;
    void onTargetDownLabelEditRequested() override;

private:

    void updatePointStrings();

    Callback m_callback;
    Point m_point;
    PopupsPresenterImpl *const m_popupsPresenter;
};
