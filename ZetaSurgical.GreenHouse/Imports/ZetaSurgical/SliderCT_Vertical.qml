import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import Components 1.0 as ComponentsSet


//USES ComponentsSet.SliderItem
//PREVIEW IMAGE qrc:/GeneratedComponents/assets/Slider.png


//EDITABLE TRUE
Item {
    id: root
    
    //Exposed properties----------------------------------------------------------------------------
    //BOOL false
    property alias sliderItem_dynamicValueReporting: sliderItem.dynamicValueReporting
    //BOOL false
    property alias sliderItem_knobInset: sliderItem.knobInset
    //INT 100
    property alias sliderItem_max: sliderItem.max
    //INT 0
    property alias sliderItem_min: sliderItem.min
    //INT 1
    property alias sliderItem_stepSize: sliderItem.stepSize
    //INT 25
    property alias sliderItem_value: sliderItem.value
    
    //----------------------------------------------------------------------------------------------
    
    //Exposed signals-------------------------------------------------------------------------------
    signal sliderItem_valueChangeRequested(int value) /*sliderItem.valueChangeRequested*/
    
    //----------------------------------------------------------------------------------------------
    
    //Local bindings--------------------------------------------------------------------------------
    width: 8
    height: 176
    
    //----------------------------------------------------------------------------------------------
    
    //Children--------------------------------------------------------------------------------------
    ComponentsSet.SliderItem {
        id: sliderItem
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: 8
        backgroundSource: GreenHouseThemeManager.theme.asset("/78_2138.png")
        bottomBackgroundAssetBorder: 25
        fillMargin: 3
        knobSource: GreenHouseThemeManager.theme.asset("/78_2139.png")
        leftBackgroundAssetBorder: 3
        rightBackgroundAssetBorder: 3
        topBackgroundAssetBorder: 25
        
        
        
        
        onValueChangeRequested: {
            root.sliderItem_valueChangeRequested(value);
        }
        
    }
    
    //----------------------------------------------------------------------------------------------
    
    //States----------------------------------------------------------------------------------------
    
    //----------------------------------------------------------------------------------------------
}
