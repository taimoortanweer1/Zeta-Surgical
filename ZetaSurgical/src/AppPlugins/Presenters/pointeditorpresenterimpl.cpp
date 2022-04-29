#include "pointeditorpresenterimpl.h"
#include "popupspresenterimpl.h"

QString formatDouble(double const &value) {
    return QString::number(value, 'g', 3);
}

PointEditorPresenterImpl::PointEditorPresenterImpl(PopupsPresenterImpl *popupsPresenter)
    : ZetaSurgical::PointEditorPresenter()
    , m_popupsPresenter(popupsPresenter)
{
    Q_ASSERT(popupsPresenter);
}

void PointEditorPresenterImpl::addNewPoint(Callback callback)
{
    Q_ASSERT(callback);
    emit pointEditorPopupShown();
    auto const &newPointName = QStringLiteral("New point");
    setSelectedPointNameString(newPointName);
    m_point.clear();
    m_point.name = newPointName;
    m_callback = callback;
}

void PointEditorPresenterImpl::editPoint(Point const &point, Callback callback)
{
    Q_ASSERT(callback);
    m_point = point;
    m_callback = callback;
    updatePointStrings();
    emit pointEditorPopupShown();
}

void PointEditorPresenterImpl::init()
{
    updatePointStrings();
    onSelectModeClicked(0);
}

void PointEditorPresenterImpl::onNorthButtonClicked()
{
    m_point.x += 1;
    updatePointStrings();
}

void PointEditorPresenterImpl::onSouthButtonClicked()
{
    m_point.y += 1;
    updatePointStrings();
}

void PointEditorPresenterImpl::onWestButtonClicked()
{
    m_point.z += 1;
    updatePointStrings();
}

void PointEditorPresenterImpl::onEastButtonClicked()
{
    m_point.x = 12.56;
    m_point.y = 8.4;
    m_point.z = -12.345;
    updatePointStrings();
}

void PointEditorPresenterImpl::onAddPointClicked()
{
    m_callback(m_point);
    m_callback = nullptr;
    emit pointEditorPopupHidden();
}

void PointEditorPresenterImpl::onSelectModeClicked(int mode)
{
    auto const value = static_cast<PointEditorPresenter::Modes>(mode);
    qWarning() << value;
    setSelectedMode(value);
    if(value == PointEditorPresenter::Modes::Coronal)
        setNorthButtonCaption(QStringLiteral("CN"));
    else if(value == PointEditorPresenter::Modes::Axial)
        setNorthButtonCaption(QStringLiteral("AN"));
    else if(value == PointEditorPresenter::Modes::Saggital)
        setNorthButtonCaption(QStringLiteral("SN"));
}

void PointEditorPresenterImpl::onTargetIDEditRequested()
{
    qWarning() << __PRETTY_FUNCTION__;
    m_popupsPresenter->startInstrumentIDInput([this](QString const &result){
        setTargetIDEditString(result);
    });
}

void PointEditorPresenterImpl::onTargetUpLabelEditRequested()
{
    m_popupsPresenter->startTargetUpLabelInput([this](QString const &result){
        setTargetUpValueString(result);
    });
}

void PointEditorPresenterImpl::onTargetDownLabelEditRequested()
{
    m_popupsPresenter->startTargetDownLabelInput([this](QString const &result){
        setTargetDownValueString(result);
    });
}

void PointEditorPresenterImpl::updatePointStrings()
{
    setSelectedPointNameString(m_point.name);
    setXString(formatDouble(m_point.x));
    setYString(formatDouble(m_point.y));
    setZString(formatDouble(m_point.z));
}

