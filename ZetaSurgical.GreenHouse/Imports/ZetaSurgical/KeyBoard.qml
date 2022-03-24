import GreenHouse 1.0
import QtQuick 2.6
import GreenHouse.Theming 1.0
import ZetaSurgical 1.0 as ZetaSurgicalSet
import Components 1.0 as ComponentsSet

//USES Rectangle
//USES Item
//USES ZetaSurgicalSet.KeyboardButton_Letter_Lowercase
//USES ZetaSurgicalSet.KeyboardButton_MoveRight
//USES ZetaSurgicalSet.KeyboardButton_MoveLeft
//USES ZetaSurgicalSet.KeyboardButton_FunctionCenter
//USES ZetaSurgicalSet.KeyboardButton_FunctionRightGrey
//USES ZetaSurgicalSet.KeyboardButton_FunctionLeft
//USES ZetaSurgicalSet.KeyboardButton_FunctionRightBlue
//USES ComponentsSet.ModelView
//USES ZetaSurgicalSet.KeyboardButton_Letter_Uppercase

//EDITABLE TRUE
Item {
    id: root

    //Exposed properties----------------------------------------------------------------------------
    property bool symbol_flag: false
    property bool uppercase_flag: false
    //BOOL false
    property alias fi_CapsLock_doubleClickEnabeld: fi_CapsLock___default.doubleClickEnabeld
    //BOOL true
    property alias fi_CapsLock_enabled: fi_CapsLock___default.enabled
    //FONT Figma::Arial_ArialMT_30_50_2_0_0_0_-0.6
    property alias fi_CapsLock_fi_Letter_font: fi_CapsLock___default.fi_Letter_font
    //TEXTHAL 1
    property alias fi_CapsLock_fi_Letter_horizontalAlignment: fi_CapsLock___default.fi_Letter_horizontalAlignment
    //REAL 35.160000000000004
    property alias fi_CapsLock_fi_Letter_lineHeight: fi_CapsLock___default.fi_Letter_lineHeight
    //TEXTLINEHM 1
    property alias fi_CapsLock_fi_Letter_lineHeightMode: fi_CapsLock___default.fi_Letter_lineHeightMode
    //REAL 1
    property alias fi_CapsLock_fi_Letter_opacity: fi_CapsLock___default.fi_Letter_opacity
    //BOOL false
    property alias fi_CapsLock_fi_Letter_richText: fi_CapsLock___default.fi_Letter_richText
    //TRANSLATABLE caps lock
    property alias fi_CapsLock_fi_Letter_text: fi_CapsLock___default.fi_Letter_text
    //COLOR Dark Ink
    property alias fi_CapsLock_fi_Letter_textColor: fi_CapsLock___default.fi_Letter_textColor
    //TEXTVAL 64
    property alias fi_CapsLock_fi_Letter_verticalAlignment: fi_CapsLock___default.fi_Letter_verticalAlignment
    //BOOL false
    property alias fi_CapsLock_invalid_flag: fi_CapsLock___default.invalid_flag
    //INT 100
    property alias fi_CapsLock_minimumRepeatInterval: fi_CapsLock___default.minimumRepeatInterval
    //INT 1000
    property alias fi_CapsLock_repeateInterval: fi_CapsLock___default.repeateInterval
    //BOOL false
    property alias fi_Delete_doubleClickEnabeld: fi_Delete___default.doubleClickEnabeld
    //BOOL true
    property alias fi_Delete_enabled: fi_Delete___default.enabled
    //FONT Figma::Arial_ArialMT_30_50_2_0_0_0_-0.6
    property alias fi_Delete_fi_Letter_font: fi_Delete___default.fi_Letter_font
    //TEXTHAL 2
    property alias fi_Delete_fi_Letter_horizontalAlignment: fi_Delete___default.fi_Letter_horizontalAlignment
    //REAL 35.160000000000004
    property alias fi_Delete_fi_Letter_lineHeight: fi_Delete___default.fi_Letter_lineHeight
    //TEXTLINEHM 1
    property alias fi_Delete_fi_Letter_lineHeightMode: fi_Delete___default.fi_Letter_lineHeightMode
    //REAL 1
    property alias fi_Delete_fi_Letter_opacity: fi_Delete___default.fi_Letter_opacity
    //BOOL false
    property alias fi_Delete_fi_Letter_richText: fi_Delete___default.fi_Letter_richText
    //TRANSLATABLE delete
    property alias fi_Delete_fi_Letter_text: fi_Delete___default.fi_Letter_text
    //COLOR Dark Ink
    property alias fi_Delete_fi_Letter_textColor: fi_Delete___default.fi_Letter_textColor
    //TEXTVAL 64
    property alias fi_Delete_fi_Letter_verticalAlignment: fi_Delete___default.fi_Letter_verticalAlignment
    //BOOL false
    property alias fi_Delete_invalid_flag: fi_Delete___default.invalid_flag
    //INT 100
    property alias fi_Delete_minimumRepeatInterval: fi_Delete___default.minimumRepeatInterval
    //INT 1000
    property alias fi_Delete_repeateInterval: fi_Delete___default.repeateInterval
    //BOOL false
    property alias fi_Enter_doubleClickEnabeld: fi_Enter___default.doubleClickEnabeld
    //BOOL true
    property alias fi_Enter_enabled: fi_Enter___default.enabled
    //FONT Figma::Arial_ArialMT_30_50_2_0_0_0_-0.6
    property alias fi_Enter_fi_Letter_font: fi_Enter___default.fi_Letter_font
    //TEXTHAL 2
    property alias fi_Enter_fi_Letter_horizontalAlignment: fi_Enter___default.fi_Letter_horizontalAlignment
    //REAL 35.160000000000004
    property alias fi_Enter_fi_Letter_lineHeight: fi_Enter___default.fi_Letter_lineHeight
    //TEXTLINEHM 1
    property alias fi_Enter_fi_Letter_lineHeightMode: fi_Enter___default.fi_Letter_lineHeightMode
    //REAL 1
    property alias fi_Enter_fi_Letter_opacity: fi_Enter___default.fi_Letter_opacity
    //BOOL false
    property alias fi_Enter_fi_Letter_richText: fi_Enter___default.fi_Letter_richText
    //TRANSLATABLE enter
    property alias fi_Enter_fi_Letter_text: fi_Enter___default.fi_Letter_text
    //COLOR Dark Ink
    property alias fi_Enter_fi_Letter_textColor: fi_Enter___default.fi_Letter_textColor
    //TEXTVAL 64
    property alias fi_Enter_fi_Letter_verticalAlignment: fi_Enter___default.fi_Letter_verticalAlignment
    //BOOL false
    property alias fi_Enter_invalid_flag: fi_Enter___default.invalid_flag
    //INT 100
    property alias fi_Enter_minimumRepeatInterval: fi_Enter___default.minimumRepeatInterval
    //INT 1000
    property alias fi_Enter_repeateInterval: fi_Enter___default.repeateInterval
    //INT -1
    property alias fi_ListViewRow1_horizontal_currentDelegate: fi_ListViewRow1_horizontal.currentDelegate
    //MODEL
    property alias fi_ListViewRow1_horizontal_viewModel: fi_ListViewRow1_horizontal.viewModel
    //INT -1
    property alias fi_ListViewRow2_horizontal_currentDelegate: fi_ListViewRow2_horizontal.currentDelegate
    //MODEL
    property alias fi_ListViewRow2_horizontal_viewModel: fi_ListViewRow2_horizontal.viewModel
    //INT -1
    property alias fi_ListViewRow3_horizontal_currentDelegate: fi_ListViewRow3_horizontal.currentDelegate
    //MODEL
    property alias fi_ListViewRow3_horizontal_viewModel: fi_ListViewRow3_horizontal.viewModel
    //INT -1
    property alias fi_ListViewRow4_horizontal_currentDelegate: fi_ListViewRow4_horizontal.currentDelegate
    //MODEL
    property alias fi_ListViewRow4_horizontal_viewModel: fi_ListViewRow4_horizontal.viewModel
    //BOOL false
    property alias fi_MoveLeft_doubleClickEnabeld: fi_MoveLeft___default.doubleClickEnabeld
    //BOOL true
    property alias fi_MoveLeft_enabled: fi_MoveLeft___default.enabled
    //REAL 1
    property alias fi_MoveLeft_icon_opacity: fi_MoveLeft___default.icon_opacity
    //ASSET /Icons/LeftTriangle__DefaultState.png
    property alias fi_MoveLeft_icon_source: fi_MoveLeft___default.icon_source
    //INT 100
    property alias fi_MoveLeft_minimumRepeatInterval: fi_MoveLeft___default.minimumRepeatInterval
    //INT 1000
    property alias fi_MoveLeft_repeateInterval: fi_MoveLeft___default.repeateInterval
    //BOOL false
    property alias fi_MoveRight_doubleClickEnabeld: fi_MoveRight___default.doubleClickEnabeld
    //BOOL true
    property alias fi_MoveRight_enabled: fi_MoveRight___default.enabled
    //REAL 1
    property alias fi_MoveRight_icon_opacity: fi_MoveRight___default.icon_opacity
    //ASSET /Icons/RightTriangle__DefaultState.png
    property alias fi_MoveRight_icon_source: fi_MoveRight___default.icon_source
    //INT 100
    property alias fi_MoveRight_minimumRepeatInterval: fi_MoveRight___default.minimumRepeatInterval
    //INT 1000
    property alias fi_MoveRight_repeateInterval: fi_MoveRight___default.repeateInterval
    //COLOR PanelBackground/Black
    property alias fi_Rectangle_364_color: fi_Rectangle_364___default.color
    //REAL 1
    property alias fi_Rectangle_364_opacity: fi_Rectangle_364___default.opacity
    //BOOL false
    property alias fi_Shift1_doubleClickEnabeld: fi_Shift1___default.doubleClickEnabeld
    //BOOL true
    property alias fi_Shift1_enabled: fi_Shift1___default.enabled
    //FONT Figma::Arial_ArialMT_30_50_2_0_0_0_-0.6
    property alias fi_Shift1_fi_Letter_font: fi_Shift1___default.fi_Letter_font
    //TEXTHAL 1
    property alias fi_Shift1_fi_Letter_horizontalAlignment: fi_Shift1___default.fi_Letter_horizontalAlignment
    //REAL 35.160000000000004
    property alias fi_Shift1_fi_Letter_lineHeight: fi_Shift1___default.fi_Letter_lineHeight
    //TEXTLINEHM 1
    property alias fi_Shift1_fi_Letter_lineHeightMode: fi_Shift1___default.fi_Letter_lineHeightMode
    //REAL 1
    property alias fi_Shift1_fi_Letter_opacity: fi_Shift1___default.fi_Letter_opacity
    //BOOL false
    property alias fi_Shift1_fi_Letter_richText: fi_Shift1___default.fi_Letter_richText
    //TRANSLATABLE shift
    property alias fi_Shift1_fi_Letter_text: fi_Shift1___default.fi_Letter_text
    //COLOR Dark Ink
    property alias fi_Shift1_fi_Letter_textColor: fi_Shift1___default.fi_Letter_textColor
    //TEXTVAL 64
    property alias fi_Shift1_fi_Letter_verticalAlignment: fi_Shift1___default.fi_Letter_verticalAlignment
    //BOOL false
    property alias fi_Shift1_invalid_flag: fi_Shift1___default.invalid_flag
    //INT 100
    property alias fi_Shift1_minimumRepeatInterval: fi_Shift1___default.minimumRepeatInterval
    //INT 1000
    property alias fi_Shift1_repeateInterval: fi_Shift1___default.repeateInterval
    //BOOL false
    property alias fi_Shift2_doubleClickEnabeld: fi_Shift2___default.doubleClickEnabeld
    //BOOL true
    property alias fi_Shift2_enabled: fi_Shift2___default.enabled
    //FONT Figma::Arial_ArialMT_30_50_2_0_0_0_-0.6
    property alias fi_Shift2_fi_Letter_font: fi_Shift2___default.fi_Letter_font
    //TEXTHAL 2
    property alias fi_Shift2_fi_Letter_horizontalAlignment: fi_Shift2___default.fi_Letter_horizontalAlignment
    //REAL 35.160000000000004
    property alias fi_Shift2_fi_Letter_lineHeight: fi_Shift2___default.fi_Letter_lineHeight
    //TEXTLINEHM 1
    property alias fi_Shift2_fi_Letter_lineHeightMode: fi_Shift2___default.fi_Letter_lineHeightMode
    //REAL 1
    property alias fi_Shift2_fi_Letter_opacity: fi_Shift2___default.fi_Letter_opacity
    //BOOL false
    property alias fi_Shift2_fi_Letter_richText: fi_Shift2___default.fi_Letter_richText
    //TRANSLATABLE shift
    property alias fi_Shift2_fi_Letter_text: fi_Shift2___default.fi_Letter_text
    //COLOR Dark Ink
    property alias fi_Shift2_fi_Letter_textColor: fi_Shift2___default.fi_Letter_textColor
    //TEXTVAL 64
    property alias fi_Shift2_fi_Letter_verticalAlignment: fi_Shift2___default.fi_Letter_verticalAlignment
    //BOOL false
    property alias fi_Shift2_invalid_flag: fi_Shift2___default.invalid_flag
    //INT 100
    property alias fi_Shift2_minimumRepeatInterval: fi_Shift2___default.minimumRepeatInterval
    //INT 1000
    property alias fi_Shift2_repeateInterval: fi_Shift2___default.repeateInterval
    //BOOL false
    property alias fi_Space_doubleClickEnabeld: fi_Space___default.doubleClickEnabeld
    //BOOL true
    property alias fi_Space_enabled: fi_Space___default.enabled
    //FONT Figma::Arial_ArialMT_30_50_2_0_0_0_-0.6
    property alias fi_Space_fi_Label_font: fi_Space___default.fi_Label_font
    //TEXTHAL 4
    property alias fi_Space_fi_Label_horizontalAlignment: fi_Space___default.fi_Label_horizontalAlignment
    //REAL 35.160000000000004
    property alias fi_Space_fi_Label_lineHeight: fi_Space___default.fi_Label_lineHeight
    //TEXTLINEHM 1
    property alias fi_Space_fi_Label_lineHeightMode: fi_Space___default.fi_Label_lineHeightMode
    //REAL 1
    property alias fi_Space_fi_Label_opacity: fi_Space___default.fi_Label_opacity
    //BOOL false
    property alias fi_Space_fi_Label_richText: fi_Space___default.fi_Label_richText
    //TRANSLATABLE space
    property alias fi_Space_fi_Label_text: fi_Space___default.fi_Label_text
    //COLOR Dark Ink
    property alias fi_Space_fi_Label_textColor: fi_Space___default.fi_Label_textColor
    //TEXTVAL 32
    property alias fi_Space_fi_Label_verticalAlignment: fi_Space___default.fi_Label_verticalAlignment
    //BOOL false
    property alias fi_Space_invalid_flag: fi_Space___default.invalid_flag
    //INT 100
    property alias fi_Space_minimumRepeatInterval: fi_Space___default.minimumRepeatInterval
    //INT 1000
    property alias fi_Space_repeateInterval: fi_Space___default.repeateInterval
    //BOOL false
    property alias fi_Symbols_doubleClickEnabeld: fi_Symbols___default.doubleClickEnabeld
    //BOOL true
    property alias fi_Symbols_enabled: fi_Symbols___default.enabled
    //FONT Figma::Arial_ArialMT_30_50_0_0_0_0_-0.6
    property alias fi_Symbols_fi_Letter_font: fi_Symbols___default.fi_Letter_font
    //TEXTHAL 4
    property alias fi_Symbols_fi_Letter_horizontalAlignment: fi_Symbols___default.fi_Letter_horizontalAlignment
    //REAL 35.160000000000004
    property alias fi_Symbols_fi_Letter_lineHeight: fi_Symbols___default.fi_Letter_lineHeight
    //TEXTLINEHM 1
    property alias fi_Symbols_fi_Letter_lineHeightMode: fi_Symbols___default.fi_Letter_lineHeightMode
    //REAL 1
    property alias fi_Symbols_fi_Letter_opacity: fi_Symbols___default.fi_Letter_opacity
    //BOOL false
    property alias fi_Symbols_fi_Letter_richText: fi_Symbols___default.fi_Letter_richText
    //TRANSLATABLE .?123
    property alias fi_Symbols_fi_Letter_text: fi_Symbols___default.fi_Letter_text
    //COLOR Dark Ink
    property alias fi_Symbols_fi_Letter_textColor: fi_Symbols___default.fi_Letter_textColor
    //TEXTVAL 32
    property alias fi_Symbols_fi_Letter_verticalAlignment: fi_Symbols___default.fi_Letter_verticalAlignment
    //BOOL false
    property alias fi_Symbols_invalid_flag: fi_Symbols___default.invalid_flag
    //INT 100
    property alias fi_Symbols_minimumRepeatInterval: fi_Symbols___default.minimumRepeatInterval
    //INT 1000
    property alias fi_Symbols_repeateInterval: fi_Symbols___default.repeateInterval
    //BOOL false
    property alias fi_Tab_doubleClickEnabeld: fi_Tab___default.doubleClickEnabeld
    //BOOL true
    property alias fi_Tab_enabled: fi_Tab___default.enabled
    //FONT Figma::Arial_ArialMT_30_50_2_0_0_0_-0.6
    property alias fi_Tab_fi_Letter_font: fi_Tab___default.fi_Letter_font
    //TEXTHAL 1
    property alias fi_Tab_fi_Letter_horizontalAlignment: fi_Tab___default.fi_Letter_horizontalAlignment
    //REAL 35.160000000000004
    property alias fi_Tab_fi_Letter_lineHeight: fi_Tab___default.fi_Letter_lineHeight
    //TEXTLINEHM 1
    property alias fi_Tab_fi_Letter_lineHeightMode: fi_Tab___default.fi_Letter_lineHeightMode
    //REAL 1
    property alias fi_Tab_fi_Letter_opacity: fi_Tab___default.fi_Letter_opacity
    //BOOL false
    property alias fi_Tab_fi_Letter_richText: fi_Tab___default.fi_Letter_richText
    //TRANSLATABLE tab
    property alias fi_Tab_fi_Letter_text: fi_Tab___default.fi_Letter_text
    //COLOR Dark Ink
    property alias fi_Tab_fi_Letter_textColor: fi_Tab___default.fi_Letter_textColor
    //TEXTVAL 64
    property alias fi_Tab_fi_Letter_verticalAlignment: fi_Tab___default.fi_Letter_verticalAlignment
    //BOOL false
    property alias fi_Tab_invalid_flag: fi_Tab___default.invalid_flag
    //INT 100
    property alias fi_Tab_minimumRepeatInterval: fi_Tab___default.minimumRepeatInterval
    //INT 1000
    property alias fi_Tab_repeateInterval: fi_Tab___default.repeateInterval

    //----------------------------------------------------------------------------------------------

    //Exposed signals-------------------------------------------------------------------------------
    signal fi_CapsLock_clicked() /*fi_CapsLock___default.clicked*/
    signal fi_CapsLock_doubleClicked() /*fi_CapsLock___default.doubleClicked*/
    signal fi_CapsLock_pressed() /*fi_CapsLock___default.pressed*/
    signal fi_CapsLock_released() /*fi_CapsLock___default.released*/
    signal fi_CapsLock_repeatingTriggered() /*fi_CapsLock___default.repeatingTriggered*/
    signal fi_CapsLock___symbol_clicked() /*fi_CapsLock___symbol.clicked*/
    signal fi_CapsLock___symbol_doubleClicked() /*fi_CapsLock___symbol.doubleClicked*/
    signal fi_CapsLock___symbol_pressed() /*fi_CapsLock___symbol.pressed*/
    signal fi_CapsLock___symbol_released() /*fi_CapsLock___symbol.released*/
    signal fi_CapsLock___symbol_repeatingTriggered() /*fi_CapsLock___symbol.repeatingTriggered*/
    signal fi_CapsLock___uppercase_clicked() /*fi_CapsLock___uppercase.clicked*/
    signal fi_CapsLock___uppercase_doubleClicked() /*fi_CapsLock___uppercase.doubleClicked*/
    signal fi_CapsLock___uppercase_pressed() /*fi_CapsLock___uppercase.pressed*/
    signal fi_CapsLock___uppercase_released() /*fi_CapsLock___uppercase.released*/
    signal fi_CapsLock___uppercase_repeatingTriggered() /*fi_CapsLock___uppercase.repeatingTriggered*/
    signal fi_Delete_clicked() /*fi_Delete___default.clicked*/
    signal fi_Delete_doubleClicked() /*fi_Delete___default.doubleClicked*/
    signal fi_Delete_pressed() /*fi_Delete___default.pressed*/
    signal fi_Delete_released() /*fi_Delete___default.released*/
    signal fi_Delete_repeatingTriggered() /*fi_Delete___default.repeatingTriggered*/
    signal fi_Delete___symbol_clicked() /*fi_Delete___symbol.clicked*/
    signal fi_Delete___symbol_doubleClicked() /*fi_Delete___symbol.doubleClicked*/
    signal fi_Delete___symbol_pressed() /*fi_Delete___symbol.pressed*/
    signal fi_Delete___symbol_released() /*fi_Delete___symbol.released*/
    signal fi_Delete___symbol_repeatingTriggered() /*fi_Delete___symbol.repeatingTriggered*/
    signal fi_Delete___uppercase_clicked() /*fi_Delete___uppercase.clicked*/
    signal fi_Delete___uppercase_doubleClicked() /*fi_Delete___uppercase.doubleClicked*/
    signal fi_Delete___uppercase_pressed() /*fi_Delete___uppercase.pressed*/
    signal fi_Delete___uppercase_released() /*fi_Delete___uppercase.released*/
    signal fi_Delete___uppercase_repeatingTriggered() /*fi_Delete___uppercase.repeatingTriggered*/
    signal fi_Enter_clicked() /*fi_Enter___default.clicked*/
    signal fi_Enter_doubleClicked() /*fi_Enter___default.doubleClicked*/
    signal fi_Enter_pressed() /*fi_Enter___default.pressed*/
    signal fi_Enter_released() /*fi_Enter___default.released*/
    signal fi_Enter_repeatingTriggered() /*fi_Enter___default.repeatingTriggered*/
    signal fi_Enter___symbol_clicked() /*fi_Enter___symbol.clicked*/
    signal fi_Enter___symbol_doubleClicked() /*fi_Enter___symbol.doubleClicked*/
    signal fi_Enter___symbol_pressed() /*fi_Enter___symbol.pressed*/
    signal fi_Enter___symbol_released() /*fi_Enter___symbol.released*/
    signal fi_Enter___symbol_repeatingTriggered() /*fi_Enter___symbol.repeatingTriggered*/
    signal fi_Enter___uppercase_clicked() /*fi_Enter___uppercase.clicked*/
    signal fi_Enter___uppercase_doubleClicked() /*fi_Enter___uppercase.doubleClicked*/
    signal fi_Enter___uppercase_pressed() /*fi_Enter___uppercase.pressed*/
    signal fi_Enter___uppercase_released() /*fi_Enter___uppercase.released*/
    signal fi_Enter___uppercase_repeatingTriggered() /*fi_Enter___uppercase.repeatingTriggered*/
    signal fi_ListViewRow1_horizontal_currentIndexUpdated(var index) /*fi_ListViewRow1_horizontal.currentIndexUpdated*/
    signal fi_ListViewRow1_horizontal_isDragging(var dragging) /*fi_ListViewRow1_horizontal.isDragging*/
    signal fi_ListViewRow2_horizontal_currentIndexUpdated(var index) /*fi_ListViewRow2_horizontal.currentIndexUpdated*/
    signal fi_ListViewRow2_horizontal_isDragging(var dragging) /*fi_ListViewRow2_horizontal.isDragging*/
    signal fi_ListViewRow3_horizontal_currentIndexUpdated(var index) /*fi_ListViewRow3_horizontal.currentIndexUpdated*/
    signal fi_ListViewRow3_horizontal_isDragging(var dragging) /*fi_ListViewRow3_horizontal.isDragging*/
    signal fi_ListViewRow4_horizontal_currentIndexUpdated(var index) /*fi_ListViewRow4_horizontal.currentIndexUpdated*/
    signal fi_ListViewRow4_horizontal_isDragging(var dragging) /*fi_ListViewRow4_horizontal.isDragging*/
    signal fi_MoveLeft_clicked() /*fi_MoveLeft___default.clicked*/
    signal fi_MoveLeft_doubleClicked() /*fi_MoveLeft___default.doubleClicked*/
    signal fi_MoveLeft_pressed() /*fi_MoveLeft___default.pressed*/
    signal fi_MoveLeft_released() /*fi_MoveLeft___default.released*/
    signal fi_MoveLeft_repeatingTriggered() /*fi_MoveLeft___default.repeatingTriggered*/
    signal fi_MoveLeft___symbol_clicked() /*fi_MoveLeft___symbol.clicked*/
    signal fi_MoveLeft___symbol_doubleClicked() /*fi_MoveLeft___symbol.doubleClicked*/
    signal fi_MoveLeft___symbol_pressed() /*fi_MoveLeft___symbol.pressed*/
    signal fi_MoveLeft___symbol_released() /*fi_MoveLeft___symbol.released*/
    signal fi_MoveLeft___symbol_repeatingTriggered() /*fi_MoveLeft___symbol.repeatingTriggered*/
    signal fi_MoveLeft___uppercase_clicked() /*fi_MoveLeft___uppercase.clicked*/
    signal fi_MoveLeft___uppercase_doubleClicked() /*fi_MoveLeft___uppercase.doubleClicked*/
    signal fi_MoveLeft___uppercase_pressed() /*fi_MoveLeft___uppercase.pressed*/
    signal fi_MoveLeft___uppercase_released() /*fi_MoveLeft___uppercase.released*/
    signal fi_MoveLeft___uppercase_repeatingTriggered() /*fi_MoveLeft___uppercase.repeatingTriggered*/
    signal fi_MoveRight_clicked() /*fi_MoveRight___default.clicked*/
    signal fi_MoveRight_doubleClicked() /*fi_MoveRight___default.doubleClicked*/
    signal fi_MoveRight_pressed() /*fi_MoveRight___default.pressed*/
    signal fi_MoveRight_released() /*fi_MoveRight___default.released*/
    signal fi_MoveRight_repeatingTriggered() /*fi_MoveRight___default.repeatingTriggered*/
    signal fi_MoveRight___symbol_clicked() /*fi_MoveRight___symbol.clicked*/
    signal fi_MoveRight___symbol_doubleClicked() /*fi_MoveRight___symbol.doubleClicked*/
    signal fi_MoveRight___symbol_pressed() /*fi_MoveRight___symbol.pressed*/
    signal fi_MoveRight___symbol_released() /*fi_MoveRight___symbol.released*/
    signal fi_MoveRight___symbol_repeatingTriggered() /*fi_MoveRight___symbol.repeatingTriggered*/
    signal fi_MoveRight___uppercase_clicked() /*fi_MoveRight___uppercase.clicked*/
    signal fi_MoveRight___uppercase_doubleClicked() /*fi_MoveRight___uppercase.doubleClicked*/
    signal fi_MoveRight___uppercase_pressed() /*fi_MoveRight___uppercase.pressed*/
    signal fi_MoveRight___uppercase_released() /*fi_MoveRight___uppercase.released*/
    signal fi_MoveRight___uppercase_repeatingTriggered() /*fi_MoveRight___uppercase.repeatingTriggered*/
    signal fi_Shift1_clicked() /*fi_Shift1___default.clicked*/
    signal fi_Shift1_doubleClicked() /*fi_Shift1___default.doubleClicked*/
    signal fi_Shift1_pressed() /*fi_Shift1___default.pressed*/
    signal fi_Shift1_released() /*fi_Shift1___default.released*/
    signal fi_Shift1_repeatingTriggered() /*fi_Shift1___default.repeatingTriggered*/
    signal fi_Shift1___symbol_clicked() /*fi_Shift1___symbol.clicked*/
    signal fi_Shift1___symbol_doubleClicked() /*fi_Shift1___symbol.doubleClicked*/
    signal fi_Shift1___symbol_pressed() /*fi_Shift1___symbol.pressed*/
    signal fi_Shift1___symbol_released() /*fi_Shift1___symbol.released*/
    signal fi_Shift1___symbol_repeatingTriggered() /*fi_Shift1___symbol.repeatingTriggered*/
    signal fi_Shift1___uppercase_clicked() /*fi_Shift1___uppercase.clicked*/
    signal fi_Shift1___uppercase_doubleClicked() /*fi_Shift1___uppercase.doubleClicked*/
    signal fi_Shift1___uppercase_pressed() /*fi_Shift1___uppercase.pressed*/
    signal fi_Shift1___uppercase_released() /*fi_Shift1___uppercase.released*/
    signal fi_Shift1___uppercase_repeatingTriggered() /*fi_Shift1___uppercase.repeatingTriggered*/
    signal fi_Shift2_clicked() /*fi_Shift2___default.clicked*/
    signal fi_Shift2_doubleClicked() /*fi_Shift2___default.doubleClicked*/
    signal fi_Shift2_pressed() /*fi_Shift2___default.pressed*/
    signal fi_Shift2_released() /*fi_Shift2___default.released*/
    signal fi_Shift2_repeatingTriggered() /*fi_Shift2___default.repeatingTriggered*/
    signal fi_Shift2___symbol_clicked() /*fi_Shift2___symbol.clicked*/
    signal fi_Shift2___symbol_doubleClicked() /*fi_Shift2___symbol.doubleClicked*/
    signal fi_Shift2___symbol_pressed() /*fi_Shift2___symbol.pressed*/
    signal fi_Shift2___symbol_released() /*fi_Shift2___symbol.released*/
    signal fi_Shift2___symbol_repeatingTriggered() /*fi_Shift2___symbol.repeatingTriggered*/
    signal fi_Shift2___uppercase_clicked() /*fi_Shift2___uppercase.clicked*/
    signal fi_Shift2___uppercase_doubleClicked() /*fi_Shift2___uppercase.doubleClicked*/
    signal fi_Shift2___uppercase_pressed() /*fi_Shift2___uppercase.pressed*/
    signal fi_Shift2___uppercase_released() /*fi_Shift2___uppercase.released*/
    signal fi_Shift2___uppercase_repeatingTriggered() /*fi_Shift2___uppercase.repeatingTriggered*/
    signal fi_Space_clicked() /*fi_Space___default.clicked*/
    signal fi_Space_doubleClicked() /*fi_Space___default.doubleClicked*/
    signal fi_Space_pressed() /*fi_Space___default.pressed*/
    signal fi_Space_released() /*fi_Space___default.released*/
    signal fi_Space_repeatingTriggered() /*fi_Space___default.repeatingTriggered*/
    signal fi_Space___symbol_clicked() /*fi_Space___symbol.clicked*/
    signal fi_Space___symbol_doubleClicked() /*fi_Space___symbol.doubleClicked*/
    signal fi_Space___symbol_pressed() /*fi_Space___symbol.pressed*/
    signal fi_Space___symbol_released() /*fi_Space___symbol.released*/
    signal fi_Space___symbol_repeatingTriggered() /*fi_Space___symbol.repeatingTriggered*/
    signal fi_Space___uppercase_clicked() /*fi_Space___uppercase.clicked*/
    signal fi_Space___uppercase_doubleClicked() /*fi_Space___uppercase.doubleClicked*/
    signal fi_Space___uppercase_pressed() /*fi_Space___uppercase.pressed*/
    signal fi_Space___uppercase_released() /*fi_Space___uppercase.released*/
    signal fi_Space___uppercase_repeatingTriggered() /*fi_Space___uppercase.repeatingTriggered*/
    signal fi_Symbols_clicked() /*fi_Symbols___default.clicked*/
    signal fi_Symbols_doubleClicked() /*fi_Symbols___default.doubleClicked*/
    signal fi_Symbols_pressed() /*fi_Symbols___default.pressed*/
    signal fi_Symbols_released() /*fi_Symbols___default.released*/
    signal fi_Symbols_repeatingTriggered() /*fi_Symbols___default.repeatingTriggered*/
    signal fi_Symbols___symbol_clicked() /*fi_Symbols___symbol.clicked*/
    signal fi_Symbols___symbol_doubleClicked() /*fi_Symbols___symbol.doubleClicked*/
    signal fi_Symbols___symbol_pressed() /*fi_Symbols___symbol.pressed*/
    signal fi_Symbols___symbol_released() /*fi_Symbols___symbol.released*/
    signal fi_Symbols___symbol_repeatingTriggered() /*fi_Symbols___symbol.repeatingTriggered*/
    signal fi_Symbols___uppercase_clicked() /*fi_Symbols___uppercase.clicked*/
    signal fi_Symbols___uppercase_doubleClicked() /*fi_Symbols___uppercase.doubleClicked*/
    signal fi_Symbols___uppercase_pressed() /*fi_Symbols___uppercase.pressed*/
    signal fi_Symbols___uppercase_released() /*fi_Symbols___uppercase.released*/
    signal fi_Symbols___uppercase_repeatingTriggered() /*fi_Symbols___uppercase.repeatingTriggered*/
    signal fi_Tab_clicked() /*fi_Tab___default.clicked*/
    signal fi_Tab_doubleClicked() /*fi_Tab___default.doubleClicked*/
    signal fi_Tab_pressed() /*fi_Tab___default.pressed*/
    signal fi_Tab_released() /*fi_Tab___default.released*/
    signal fi_Tab_repeatingTriggered() /*fi_Tab___default.repeatingTriggered*/
    signal fi_Tab___symbol_clicked() /*fi_Tab___symbol.clicked*/
    signal fi_Tab___symbol_doubleClicked() /*fi_Tab___symbol.doubleClicked*/
    signal fi_Tab___symbol_pressed() /*fi_Tab___symbol.pressed*/
    signal fi_Tab___symbol_released() /*fi_Tab___symbol.released*/
    signal fi_Tab___symbol_repeatingTriggered() /*fi_Tab___symbol.repeatingTriggered*/
    signal fi_Tab___uppercase_clicked() /*fi_Tab___uppercase.clicked*/
    signal fi_Tab___uppercase_doubleClicked() /*fi_Tab___uppercase.doubleClicked*/
    signal fi_Tab___uppercase_pressed() /*fi_Tab___uppercase.pressed*/
    signal fi_Tab___uppercase_released() /*fi_Tab___uppercase.released*/
    signal fi_Tab___uppercase_repeatingTriggered() /*fi_Tab___uppercase.repeatingTriggered*/
    signal fi_row1_key2_clicked(int index) /*fi_row1_key2.clicked*/
    signal fi_row1_key2_doubleClicked(int index) /*fi_row1_key2.doubleClicked*/
    signal fi_row1_key2_pressed(int index) /*fi_row1_key2.pressed*/
    signal fi_row1_key2_released(int index) /*fi_row1_key2.released*/
    signal fi_row1_key2_repeatingTriggered(int index) /*fi_row1_key2.repeatingTriggered*/
    signal fi_row2_key1_clicked(int index) /*fi_row2_key1.clicked*/
    signal fi_row2_key1_doubleClicked(int index) /*fi_row2_key1.doubleClicked*/
    signal fi_row2_key1_pressed(int index) /*fi_row2_key1.pressed*/
    signal fi_row2_key1_released(int index) /*fi_row2_key1.released*/
    signal fi_row2_key1_repeatingTriggered(int index) /*fi_row2_key1.repeatingTriggered*/
    signal fi_row3_key1_clicked(int index) /*fi_row3_key1.clicked*/
    signal fi_row3_key1_doubleClicked(int index) /*fi_row3_key1.doubleClicked*/
    signal fi_row3_key1_pressed(int index) /*fi_row3_key1.pressed*/
    signal fi_row3_key1_released(int index) /*fi_row3_key1.released*/
    signal fi_row3_key1_repeatingTriggered(int index) /*fi_row3_key1.repeatingTriggered*/

    //----------------------------------------------------------------------------------------------

    //Local bindings--------------------------------------------------------------------------------
    width: 1920
    height: 464

    //----------------------------------------------------------------------------------------------

    //Children--------------------------------------------------------------------------------------
    Component {
        id: fi_ListViewRow4_horizontal_delegate_cmp
        FocusScope {
            id: fi_ListViewRow4_horizontal_delegate
            width: 148
            height: 80
        }
    }
    Component {
        id: fi_ListViewRow3_horizontal_delegate_cmp
        FocusScope {
            id: fi_ListViewRow3_horizontal_delegate
            width: 148
            height: 80

            ZetaSurgicalSet.KeyboardButton_Letter_Uppercase {
                id: fi_row3_key1
                anchors.left: parent.left
                anchors.top: parent.top
                width: 148
                height: 80
                fi_Label_lineHeight: 35.160000000000004
                fi_Label_text: qsTr("a", "FigmaNode::I234:33595;211:5636") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::I234:33595;211:5636") : "")

                onClicked: {
                    root.fi_row3_key1_clicked(index);
                }
                onDoubleClicked: {
                    root.fi_row3_key1_doubleClicked(index);
                }
                onPressed: {
                    root.fi_row3_key1_pressed(index);
                }
                onReleased: {
                    root.fi_row3_key1_released(index);
                }
                onRepeatingTriggered: {
                    root.fi_row3_key1_repeatingTriggered(index);
                }
            }
        }
    }
    Component {
        id: fi_ListViewRow2_horizontal_delegate_cmp
        FocusScope {
            id: fi_ListViewRow2_horizontal_delegate
            width: 148
            height: 80

            ZetaSurgicalSet.KeyboardButton_Letter_Uppercase {
                id: fi_row2_key1
                anchors.left: parent.left
                anchors.top: parent.top
                width: 148
                height: 80
                fi_Label_lineHeight: 35.160000000000004

                onClicked: {
                    root.fi_row2_key1_clicked(index);
                }
                onDoubleClicked: {
                    root.fi_row2_key1_doubleClicked(index);
                }
                onPressed: {
                    root.fi_row2_key1_pressed(index);
                }
                onReleased: {
                    root.fi_row2_key1_released(index);
                }
                onRepeatingTriggered: {
                    root.fi_row2_key1_repeatingTriggered(index);
                }
            }
        }
    }
    Component {
        id: fi_ListViewRow1_horizontal_delegate_cmp
        FocusScope {
            id: fi_ListViewRow1_horizontal_delegate
            width: 136
            height: 80

            ZetaSurgicalSet.KeyboardButton_Letter_Lowercase {
                id: fi_row1_key2
                anchors.left: parent.left
                anchors.top: parent.top
                width: 136
                height: 80
                fi_Label_lineHeight: 35.160000000000004
                fi_Label_text: qsTr("1", "FigmaNode::I234:33638;208:4911") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::I234:33638;208:4911") : "")

                onClicked: {
                    root.fi_row1_key2_clicked(index);
                }
                onDoubleClicked: {
                    root.fi_row1_key2_doubleClicked(index);
                }
                onPressed: {
                    root.fi_row1_key2_pressed(index);
                }
                onReleased: {
                    root.fi_row1_key2_released(index);
                }
                onRepeatingTriggered: {
                    root.fi_row1_key2_repeatingTriggered(index);
                }
            }
        }
    }
    Item {
        id: default_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Item {
            id: fi_Background___default
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            Rectangle {
                id: fi_Rectangle_364___default
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                color: GreenHouseThemeManager.theme.color("PanelBackground/Black")
                border.color: GreenHouseThemeManager.theme.color("Figma::0_0_0_0")
                border.width: 1
            }
        }
        Item {
            id: fi_Keys___default
            anchors.left: parent.left
            anchors.leftMargin: 16
            anchors.right: parent.right
            anchors.rightMargin: 16
            anchors.top: parent.top
            anchors.topMargin: 16
            z: 1
            height: 432

            ZetaSurgicalSet.KeyboardButton_Letter_Lowercase {
                id: fi_Space___default
                anchors.left: parent.left
                anchors.leftMargin: 244
                anchors.top: parent.top
                anchors.topMargin: 352
                width: 1220
                height: 80
                fi_Label_lineHeight: 35.160000000000004
                fi_Label_text: qsTr("space", "FigmaNode::I211:5846;208:4911") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::I211:5846;208:4911") : "")

                onClicked: {
                    root.fi_Space_clicked();
                }
                onDoubleClicked: {
                    root.fi_Space_doubleClicked();
                }
                onPressed: {
                    root.fi_Space_pressed();
                }
                onReleased: {
                    root.fi_Space_released();
                }
                onRepeatingTriggered: {
                    root.fi_Space_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_MoveRight {
                id: fi_MoveRight___default
                anchors.left: parent.left
                anchors.leftMargin: 1584
                anchors.top: parent.top
                anchors.topMargin: 352
                z: 1
                width: 104
                height: 80

                onClicked: {
                    root.fi_MoveRight_clicked();
                }
                onDoubleClicked: {
                    root.fi_MoveRight_doubleClicked();
                }
                onPressed: {
                    root.fi_MoveRight_pressed();
                }
                onReleased: {
                    root.fi_MoveRight_released();
                }
                onRepeatingTriggered: {
                    root.fi_MoveRight_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_MoveLeft {
                id: fi_MoveLeft___default
                anchors.left: parent.left
                anchors.leftMargin: 1472
                anchors.top: parent.top
                anchors.topMargin: 352
                z: 2
                width: 104
                height: 80

                onClicked: {
                    root.fi_MoveLeft_clicked();
                }
                onDoubleClicked: {
                    root.fi_MoveLeft_doubleClicked();
                }
                onPressed: {
                    root.fi_MoveLeft_pressed();
                }
                onReleased: {
                    root.fi_MoveLeft_released();
                }
                onRepeatingTriggered: {
                    root.fi_MoveLeft_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_FunctionCenter {
                id: fi_Symbols___default
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 352
                z: 3
                width: 236
                height: 80
                fi_Letter_lineHeight: 35.160000000000004

                onClicked: {
                    root.fi_Symbols_clicked();
                }
                onDoubleClicked: {
                    root.fi_Symbols_doubleClicked();
                }
                onPressed: {
                    root.fi_Symbols_pressed();
                }
                onReleased: {
                    root.fi_Symbols_released();
                }
                onRepeatingTriggered: {
                    root.fi_Symbols_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_FunctionRightGrey {
                id: fi_Shift2___default
                anchors.left: parent.left
                anchors.leftMargin: 1664
                anchors.top: parent.top
                anchors.topMargin: 264
                z: 4
                width: 224
                height: 80
                fi_Letter_lineHeight: 35.160000000000004

                onClicked: {
                    root.fi_Shift2_clicked();
                }
                onDoubleClicked: {
                    root.fi_Shift2_doubleClicked();
                }
                onPressed: {
                    root.fi_Shift2_pressed();
                }
                onReleased: {
                    root.fi_Shift2_released();
                }
                onRepeatingTriggered: {
                    root.fi_Shift2_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_FunctionLeft {
                id: fi_Shift1___default
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 264
                z: 5
                width: 168
                height: 80
                fi_Letter_lineHeight: 35.160000000000004
                fi_Letter_text: qsTr("shift", "FigmaNode::I211:5872;208:4909") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::I211:5872;208:4909") : "")

                onClicked: {
                    root.fi_Shift1_clicked();
                }
                onDoubleClicked: {
                    root.fi_Shift1_doubleClicked();
                }
                onPressed: {
                    root.fi_Shift1_pressed();
                }
                onReleased: {
                    root.fi_Shift1_released();
                }
                onRepeatingTriggered: {
                    root.fi_Shift1_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_FunctionLeft {
                id: fi_CapsLock___default
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 176
                z: 6
                width: 144
                height: 80
                fi_Letter_lineHeight: 35.160000000000004
                fi_Letter_text: qsTr("caps lock", "FigmaNode::I211:5871;208:4909") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::I211:5871;208:4909") : "")

                onClicked: {
                    root.fi_CapsLock_clicked();
                }
                onDoubleClicked: {
                    root.fi_CapsLock_doubleClicked();
                }
                onPressed: {
                    root.fi_CapsLock_pressed();
                }
                onReleased: {
                    root.fi_CapsLock_released();
                }
                onRepeatingTriggered: {
                    root.fi_CapsLock_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_FunctionRightBlue {
                id: fi_Enter___default
                anchors.left: parent.left
                anchors.leftMargin: 1696
                anchors.top: parent.top
                anchors.topMargin: 352
                z: 7
                width: 192
                height: 80
                fi_Letter_lineHeight: 35.160000000000004
                fi_Letter_text: qsTr("enter", "FigmaNode::I211:5875;211:5102") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::I211:5875;211:5102") : "")

                onClicked: {
                    root.fi_Enter_clicked();
                }
                onDoubleClicked: {
                    root.fi_Enter_doubleClicked();
                }
                onPressed: {
                    root.fi_Enter_pressed();
                }
                onReleased: {
                    root.fi_Enter_released();
                }
                onRepeatingTriggered: {
                    root.fi_Enter_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_FunctionRightGrey {
                id: fi_Delete___default
                anchors.left: parent.left
                anchors.leftMargin: 1752
                anchors.top: parent.top
                z: 8
                width: 136
                height: 80
                fi_Letter_lineHeight: 35.160000000000004
                fi_Letter_text: qsTr("delete", "FigmaNode::I211:5873;211:5005") + (typeof GreenHouseTestFixture !== 'undefined' && GreenHouseTestFixture !== null ? GreenHouseTestFixture.textId("FigmaNode::I211:5873;211:5005") : "")

                onClicked: {
                    root.fi_Delete_clicked();
                }
                onDoubleClicked: {
                    root.fi_Delete_doubleClicked();
                }
                onPressed: {
                    root.fi_Delete_pressed();
                }
                onReleased: {
                    root.fi_Delete_released();
                }
                onRepeatingTriggered: {
                    root.fi_Delete_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_FunctionLeft {
                id: fi_Tab___default
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 88
                z: 9
                width: 120
                height: 80
                fi_Letter_lineHeight: 35.160000000000004

                onClicked: {
                    root.fi_Tab_clicked();
                }
                onDoubleClicked: {
                    root.fi_Tab_doubleClicked();
                }
                onPressed: {
                    root.fi_Tab_pressed();
                }
                onReleased: {
                    root.fi_Tab_released();
                }
                onRepeatingTriggered: {
                    root.fi_Tab_repeatingTriggered();
                }
            }
        }
    }
    Item {
        id: symbol_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        visible: false

        Item {
            id: fi_Background___symbol
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            Rectangle {
                id: fi_Rectangle_364___symbol
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                color: fi_Rectangle_364___default.color
                opacity: fi_Rectangle_364___default.opacity
                border.color: GreenHouseThemeManager.theme.color("Figma::0_0_0_0")
                border.width: 1
            }
        }
        Item {
            id: fi_Keys___symbol
            anchors.left: parent.left
            anchors.leftMargin: 16
            anchors.right: parent.right
            anchors.rightMargin: 16
            anchors.top: parent.top
            anchors.topMargin: 16
            z: 1
            height: 432

            ZetaSurgicalSet.KeyboardButton_Letter_Lowercase {
                id: fi_Space___symbol
                anchors.left: parent.left
                anchors.leftMargin: 244
                anchors.top: parent.top
                anchors.topMargin: 352
                width: 1220
                height: 80
                enabled: fi_Space___default.enabled
                doubleClickEnabeld: fi_Space___default.doubleClickEnabeld
                fi_Label_font: fi_Space___default.fi_Label_font
                fi_Label_horizontalAlignment: fi_Space___default.fi_Label_horizontalAlignment
                fi_Label_lineHeight: fi_Space___default.fi_Label_lineHeight
                fi_Label_lineHeightMode: fi_Space___default.fi_Label_lineHeightMode
                fi_Label_opacity: fi_Space___default.fi_Label_opacity
                fi_Label_richText: fi_Space___default.fi_Label_richText
                fi_Label_text: fi_Space___default.fi_Label_text
                fi_Label_textColor: fi_Space___default.fi_Label_textColor
                fi_Label_verticalAlignment: fi_Space___default.fi_Label_verticalAlignment
                invalid_flag: fi_Space___default.invalid_flag
                minimumRepeatInterval: fi_Space___default.minimumRepeatInterval
                repeateInterval: fi_Space___default.repeateInterval

                onClicked: {
                    root.fi_Space___symbol_clicked();
                }
                onDoubleClicked: {
                    root.fi_Space___symbol_doubleClicked();
                }
                onPressed: {
                    root.fi_Space___symbol_pressed();
                }
                onReleased: {
                    root.fi_Space___symbol_released();
                }
                onRepeatingTriggered: {
                    root.fi_Space___symbol_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_MoveLeft {
                id: fi_MoveLeft___symbol
                anchors.left: parent.left
                anchors.leftMargin: 1472
                anchors.top: parent.top
                anchors.topMargin: 352
                z: 1
                width: 104
                height: 80
                enabled: fi_MoveLeft___default.enabled
                doubleClickEnabeld: fi_MoveLeft___default.doubleClickEnabeld
                icon_opacity: fi_MoveLeft___default.icon_opacity
                icon_source: fi_MoveLeft___default.icon_source
                minimumRepeatInterval: fi_MoveLeft___default.minimumRepeatInterval
                repeateInterval: fi_MoveLeft___default.repeateInterval

                onClicked: {
                    root.fi_MoveLeft___symbol_clicked();
                }
                onDoubleClicked: {
                    root.fi_MoveLeft___symbol_doubleClicked();
                }
                onPressed: {
                    root.fi_MoveLeft___symbol_pressed();
                }
                onReleased: {
                    root.fi_MoveLeft___symbol_released();
                }
                onRepeatingTriggered: {
                    root.fi_MoveLeft___symbol_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_MoveRight {
                id: fi_MoveRight___symbol
                anchors.left: parent.left
                anchors.leftMargin: 1584
                anchors.top: parent.top
                anchors.topMargin: 352
                z: 2
                width: 104
                height: 80
                enabled: fi_MoveRight___default.enabled
                doubleClickEnabeld: fi_MoveRight___default.doubleClickEnabeld
                icon_opacity: fi_MoveRight___default.icon_opacity
                icon_source: fi_MoveRight___default.icon_source
                minimumRepeatInterval: fi_MoveRight___default.minimumRepeatInterval
                repeateInterval: fi_MoveRight___default.repeateInterval

                onClicked: {
                    root.fi_MoveRight___symbol_clicked();
                }
                onDoubleClicked: {
                    root.fi_MoveRight___symbol_doubleClicked();
                }
                onPressed: {
                    root.fi_MoveRight___symbol_pressed();
                }
                onReleased: {
                    root.fi_MoveRight___symbol_released();
                }
                onRepeatingTriggered: {
                    root.fi_MoveRight___symbol_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_FunctionCenter {
                id: fi_Symbols___symbol
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 352
                z: 3
                width: 236
                height: 80
                enabled: fi_Symbols___default.enabled
                doubleClickEnabeld: fi_Symbols___default.doubleClickEnabeld
                fi_Letter_font: fi_Symbols___default.fi_Letter_font
                fi_Letter_horizontalAlignment: fi_Symbols___default.fi_Letter_horizontalAlignment
                fi_Letter_lineHeight: fi_Symbols___default.fi_Letter_lineHeight
                fi_Letter_lineHeightMode: fi_Symbols___default.fi_Letter_lineHeightMode
                fi_Letter_opacity: fi_Symbols___default.fi_Letter_opacity
                fi_Letter_richText: fi_Symbols___default.fi_Letter_richText
                fi_Letter_text: fi_Symbols___default.fi_Letter_text
                fi_Letter_textColor: fi_Symbols___default.fi_Letter_textColor
                fi_Letter_verticalAlignment: fi_Symbols___default.fi_Letter_verticalAlignment
                invalid_flag: fi_Symbols___default.invalid_flag
                minimumRepeatInterval: fi_Symbols___default.minimumRepeatInterval
                repeateInterval: fi_Symbols___default.repeateInterval

                onClicked: {
                    root.fi_Symbols___symbol_clicked();
                }
                onDoubleClicked: {
                    root.fi_Symbols___symbol_doubleClicked();
                }
                onPressed: {
                    root.fi_Symbols___symbol_pressed();
                }
                onReleased: {
                    root.fi_Symbols___symbol_released();
                }
                onRepeatingTriggered: {
                    root.fi_Symbols___symbol_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_FunctionRightGrey {
                id: fi_Shift2___symbol
                anchors.left: parent.left
                anchors.leftMargin: 1664
                anchors.top: parent.top
                anchors.topMargin: 264
                z: 4
                width: 224
                height: 80
                enabled: fi_Shift2___default.enabled
                doubleClickEnabeld: fi_Shift2___default.doubleClickEnabeld
                fi_Letter_font: fi_Shift2___default.fi_Letter_font
                fi_Letter_horizontalAlignment: fi_Shift2___default.fi_Letter_horizontalAlignment
                fi_Letter_lineHeight: fi_Shift2___default.fi_Letter_lineHeight
                fi_Letter_lineHeightMode: fi_Shift2___default.fi_Letter_lineHeightMode
                fi_Letter_opacity: fi_Shift2___default.fi_Letter_opacity
                fi_Letter_richText: fi_Shift2___default.fi_Letter_richText
                fi_Letter_text: fi_Shift2___default.fi_Letter_text
                fi_Letter_textColor: fi_Shift2___default.fi_Letter_textColor
                fi_Letter_verticalAlignment: fi_Shift2___default.fi_Letter_verticalAlignment
                invalid_flag: fi_Shift2___default.invalid_flag
                minimumRepeatInterval: fi_Shift2___default.minimumRepeatInterval
                repeateInterval: fi_Shift2___default.repeateInterval

                onClicked: {
                    root.fi_Shift2___symbol_clicked();
                }
                onDoubleClicked: {
                    root.fi_Shift2___symbol_doubleClicked();
                }
                onPressed: {
                    root.fi_Shift2___symbol_pressed();
                }
                onReleased: {
                    root.fi_Shift2___symbol_released();
                }
                onRepeatingTriggered: {
                    root.fi_Shift2___symbol_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_FunctionLeft {
                id: fi_Shift1___symbol
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 264
                z: 5
                width: 168
                height: 80
                enabled: fi_Shift1___default.enabled
                doubleClickEnabeld: fi_Shift1___default.doubleClickEnabeld
                fi_Letter_font: fi_Shift1___default.fi_Letter_font
                fi_Letter_horizontalAlignment: fi_Shift1___default.fi_Letter_horizontalAlignment
                fi_Letter_lineHeight: fi_Shift1___default.fi_Letter_lineHeight
                fi_Letter_lineHeightMode: fi_Shift1___default.fi_Letter_lineHeightMode
                fi_Letter_opacity: fi_Shift1___default.fi_Letter_opacity
                fi_Letter_richText: fi_Shift1___default.fi_Letter_richText
                fi_Letter_text: fi_Shift1___default.fi_Letter_text
                fi_Letter_textColor: fi_Shift1___default.fi_Letter_textColor
                fi_Letter_verticalAlignment: fi_Shift1___default.fi_Letter_verticalAlignment
                invalid_flag: fi_Shift1___default.invalid_flag
                minimumRepeatInterval: fi_Shift1___default.minimumRepeatInterval
                repeateInterval: fi_Shift1___default.repeateInterval

                onClicked: {
                    root.fi_Shift1___symbol_clicked();
                }
                onDoubleClicked: {
                    root.fi_Shift1___symbol_doubleClicked();
                }
                onPressed: {
                    root.fi_Shift1___symbol_pressed();
                }
                onReleased: {
                    root.fi_Shift1___symbol_released();
                }
                onRepeatingTriggered: {
                    root.fi_Shift1___symbol_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_FunctionLeft {
                id: fi_CapsLock___symbol
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 176
                z: 6
                width: 144
                height: 80
                enabled: fi_CapsLock___default.enabled
                doubleClickEnabeld: fi_CapsLock___default.doubleClickEnabeld
                fi_Letter_font: fi_CapsLock___default.fi_Letter_font
                fi_Letter_horizontalAlignment: fi_CapsLock___default.fi_Letter_horizontalAlignment
                fi_Letter_lineHeight: fi_CapsLock___default.fi_Letter_lineHeight
                fi_Letter_lineHeightMode: fi_CapsLock___default.fi_Letter_lineHeightMode
                fi_Letter_opacity: fi_CapsLock___default.fi_Letter_opacity
                fi_Letter_richText: fi_CapsLock___default.fi_Letter_richText
                fi_Letter_text: fi_CapsLock___default.fi_Letter_text
                fi_Letter_textColor: fi_CapsLock___default.fi_Letter_textColor
                fi_Letter_verticalAlignment: fi_CapsLock___default.fi_Letter_verticalAlignment
                invalid_flag: fi_CapsLock___default.invalid_flag
                minimumRepeatInterval: fi_CapsLock___default.minimumRepeatInterval
                repeateInterval: fi_CapsLock___default.repeateInterval

                onClicked: {
                    root.fi_CapsLock___symbol_clicked();
                }
                onDoubleClicked: {
                    root.fi_CapsLock___symbol_doubleClicked();
                }
                onPressed: {
                    root.fi_CapsLock___symbol_pressed();
                }
                onReleased: {
                    root.fi_CapsLock___symbol_released();
                }
                onRepeatingTriggered: {
                    root.fi_CapsLock___symbol_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_FunctionRightBlue {
                id: fi_Enter___symbol
                anchors.left: parent.left
                anchors.leftMargin: 1696
                anchors.top: parent.top
                anchors.topMargin: 352
                z: 7
                width: 192
                height: 80
                enabled: fi_Enter___default.enabled
                doubleClickEnabeld: fi_Enter___default.doubleClickEnabeld
                fi_Letter_font: fi_Enter___default.fi_Letter_font
                fi_Letter_horizontalAlignment: fi_Enter___default.fi_Letter_horizontalAlignment
                fi_Letter_lineHeight: fi_Enter___default.fi_Letter_lineHeight
                fi_Letter_lineHeightMode: fi_Enter___default.fi_Letter_lineHeightMode
                fi_Letter_opacity: fi_Enter___default.fi_Letter_opacity
                fi_Letter_richText: fi_Enter___default.fi_Letter_richText
                fi_Letter_text: fi_Enter___default.fi_Letter_text
                fi_Letter_textColor: fi_Enter___default.fi_Letter_textColor
                fi_Letter_verticalAlignment: fi_Enter___default.fi_Letter_verticalAlignment
                invalid_flag: fi_Enter___default.invalid_flag
                minimumRepeatInterval: fi_Enter___default.minimumRepeatInterval
                repeateInterval: fi_Enter___default.repeateInterval

                onClicked: {
                    root.fi_Enter___symbol_clicked();
                }
                onDoubleClicked: {
                    root.fi_Enter___symbol_doubleClicked();
                }
                onPressed: {
                    root.fi_Enter___symbol_pressed();
                }
                onReleased: {
                    root.fi_Enter___symbol_released();
                }
                onRepeatingTriggered: {
                    root.fi_Enter___symbol_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_FunctionRightGrey {
                id: fi_Delete___symbol
                anchors.left: parent.left
                anchors.leftMargin: 1752
                anchors.top: parent.top
                z: 8
                width: 136
                height: 80
                enabled: fi_Delete___default.enabled
                doubleClickEnabeld: fi_Delete___default.doubleClickEnabeld
                fi_Letter_font: fi_Delete___default.fi_Letter_font
                fi_Letter_horizontalAlignment: fi_Delete___default.fi_Letter_horizontalAlignment
                fi_Letter_lineHeight: fi_Delete___default.fi_Letter_lineHeight
                fi_Letter_lineHeightMode: fi_Delete___default.fi_Letter_lineHeightMode
                fi_Letter_opacity: fi_Delete___default.fi_Letter_opacity
                fi_Letter_richText: fi_Delete___default.fi_Letter_richText
                fi_Letter_text: fi_Delete___default.fi_Letter_text
                fi_Letter_textColor: fi_Delete___default.fi_Letter_textColor
                fi_Letter_verticalAlignment: fi_Delete___default.fi_Letter_verticalAlignment
                invalid_flag: fi_Delete___default.invalid_flag
                minimumRepeatInterval: fi_Delete___default.minimumRepeatInterval
                repeateInterval: fi_Delete___default.repeateInterval

                onClicked: {
                    root.fi_Delete___symbol_clicked();
                }
                onDoubleClicked: {
                    root.fi_Delete___symbol_doubleClicked();
                }
                onPressed: {
                    root.fi_Delete___symbol_pressed();
                }
                onReleased: {
                    root.fi_Delete___symbol_released();
                }
                onRepeatingTriggered: {
                    root.fi_Delete___symbol_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_FunctionLeft {
                id: fi_Tab___symbol
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 88
                z: 9
                width: 120
                height: 80
                enabled: fi_Tab___default.enabled
                doubleClickEnabeld: fi_Tab___default.doubleClickEnabeld
                fi_Letter_font: fi_Tab___default.fi_Letter_font
                fi_Letter_horizontalAlignment: fi_Tab___default.fi_Letter_horizontalAlignment
                fi_Letter_lineHeight: fi_Tab___default.fi_Letter_lineHeight
                fi_Letter_lineHeightMode: fi_Tab___default.fi_Letter_lineHeightMode
                fi_Letter_opacity: fi_Tab___default.fi_Letter_opacity
                fi_Letter_richText: fi_Tab___default.fi_Letter_richText
                fi_Letter_text: fi_Tab___default.fi_Letter_text
                fi_Letter_textColor: fi_Tab___default.fi_Letter_textColor
                fi_Letter_verticalAlignment: fi_Tab___default.fi_Letter_verticalAlignment
                invalid_flag: fi_Tab___default.invalid_flag
                minimumRepeatInterval: fi_Tab___default.minimumRepeatInterval
                repeateInterval: fi_Tab___default.repeateInterval

                onClicked: {
                    root.fi_Tab___symbol_clicked();
                }
                onDoubleClicked: {
                    root.fi_Tab___symbol_doubleClicked();
                }
                onPressed: {
                    root.fi_Tab___symbol_pressed();
                }
                onReleased: {
                    root.fi_Tab___symbol_released();
                }
                onRepeatingTriggered: {
                    root.fi_Tab___symbol_repeatingTriggered();
                }
            }
        }
    }
    Item {
        id: uppercase_StateParent
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        visible: false

        Item {
            id: fi_Background___uppercase
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            Rectangle {
                id: fi_Rectangle_364___uppercase
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                color: fi_Rectangle_364___default.color
                opacity: fi_Rectangle_364___default.opacity
                border.color: GreenHouseThemeManager.theme.color("Figma::0_0_0_0")
                border.width: 1
            }
        }
        Item {
            id: fi_Keys___uppercase
            anchors.left: parent.left
            anchors.leftMargin: 16
            anchors.right: parent.right
            anchors.rightMargin: 16
            anchors.top: parent.top
            anchors.topMargin: 16
            z: 1
            height: 432

            ZetaSurgicalSet.KeyboardButton_Letter_Lowercase {
                id: fi_Space___uppercase
                anchors.left: parent.left
                anchors.leftMargin: 244
                anchors.top: parent.top
                anchors.topMargin: 352
                width: 1220
                height: 80
                enabled: fi_Space___default.enabled
                doubleClickEnabeld: fi_Space___default.doubleClickEnabeld
                fi_Label_font: fi_Space___default.fi_Label_font
                fi_Label_horizontalAlignment: fi_Space___default.fi_Label_horizontalAlignment
                fi_Label_lineHeight: fi_Space___default.fi_Label_lineHeight
                fi_Label_lineHeightMode: fi_Space___default.fi_Label_lineHeightMode
                fi_Label_opacity: fi_Space___default.fi_Label_opacity
                fi_Label_richText: fi_Space___default.fi_Label_richText
                fi_Label_text: fi_Space___default.fi_Label_text
                fi_Label_textColor: fi_Space___default.fi_Label_textColor
                fi_Label_verticalAlignment: fi_Space___default.fi_Label_verticalAlignment
                invalid_flag: fi_Space___default.invalid_flag
                minimumRepeatInterval: fi_Space___default.minimumRepeatInterval
                repeateInterval: fi_Space___default.repeateInterval

                onClicked: {
                    root.fi_Space___uppercase_clicked();
                }
                onDoubleClicked: {
                    root.fi_Space___uppercase_doubleClicked();
                }
                onPressed: {
                    root.fi_Space___uppercase_pressed();
                }
                onReleased: {
                    root.fi_Space___uppercase_released();
                }
                onRepeatingTriggered: {
                    root.fi_Space___uppercase_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_MoveLeft {
                id: fi_MoveLeft___uppercase
                anchors.left: parent.left
                anchors.leftMargin: 1472
                anchors.top: parent.top
                anchors.topMargin: 352
                z: 1
                width: 104
                height: 80
                enabled: fi_MoveLeft___default.enabled
                doubleClickEnabeld: fi_MoveLeft___default.doubleClickEnabeld
                icon_opacity: fi_MoveLeft___default.icon_opacity
                icon_source: fi_MoveLeft___default.icon_source
                minimumRepeatInterval: fi_MoveLeft___default.minimumRepeatInterval
                repeateInterval: fi_MoveLeft___default.repeateInterval

                onClicked: {
                    root.fi_MoveLeft___uppercase_clicked();
                }
                onDoubleClicked: {
                    root.fi_MoveLeft___uppercase_doubleClicked();
                }
                onPressed: {
                    root.fi_MoveLeft___uppercase_pressed();
                }
                onReleased: {
                    root.fi_MoveLeft___uppercase_released();
                }
                onRepeatingTriggered: {
                    root.fi_MoveLeft___uppercase_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_MoveRight {
                id: fi_MoveRight___uppercase
                anchors.left: parent.left
                anchors.leftMargin: 1584
                anchors.top: parent.top
                anchors.topMargin: 352
                z: 2
                width: 104
                height: 80
                enabled: fi_MoveRight___default.enabled
                doubleClickEnabeld: fi_MoveRight___default.doubleClickEnabeld
                icon_opacity: fi_MoveRight___default.icon_opacity
                icon_source: fi_MoveRight___default.icon_source
                minimumRepeatInterval: fi_MoveRight___default.minimumRepeatInterval
                repeateInterval: fi_MoveRight___default.repeateInterval

                onClicked: {
                    root.fi_MoveRight___uppercase_clicked();
                }
                onDoubleClicked: {
                    root.fi_MoveRight___uppercase_doubleClicked();
                }
                onPressed: {
                    root.fi_MoveRight___uppercase_pressed();
                }
                onReleased: {
                    root.fi_MoveRight___uppercase_released();
                }
                onRepeatingTriggered: {
                    root.fi_MoveRight___uppercase_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_FunctionCenter {
                id: fi_Symbols___uppercase
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 352
                z: 3
                width: 236
                height: 80
                enabled: fi_Symbols___default.enabled
                doubleClickEnabeld: fi_Symbols___default.doubleClickEnabeld
                fi_Letter_font: fi_Symbols___default.fi_Letter_font
                fi_Letter_horizontalAlignment: fi_Symbols___default.fi_Letter_horizontalAlignment
                fi_Letter_lineHeight: fi_Symbols___default.fi_Letter_lineHeight
                fi_Letter_lineHeightMode: fi_Symbols___default.fi_Letter_lineHeightMode
                fi_Letter_opacity: fi_Symbols___default.fi_Letter_opacity
                fi_Letter_richText: fi_Symbols___default.fi_Letter_richText
                fi_Letter_text: fi_Symbols___default.fi_Letter_text
                fi_Letter_textColor: fi_Symbols___default.fi_Letter_textColor
                fi_Letter_verticalAlignment: fi_Symbols___default.fi_Letter_verticalAlignment
                invalid_flag: fi_Symbols___default.invalid_flag
                minimumRepeatInterval: fi_Symbols___default.minimumRepeatInterval
                repeateInterval: fi_Symbols___default.repeateInterval

                onClicked: {
                    root.fi_Symbols___uppercase_clicked();
                }
                onDoubleClicked: {
                    root.fi_Symbols___uppercase_doubleClicked();
                }
                onPressed: {
                    root.fi_Symbols___uppercase_pressed();
                }
                onReleased: {
                    root.fi_Symbols___uppercase_released();
                }
                onRepeatingTriggered: {
                    root.fi_Symbols___uppercase_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_FunctionRightGrey {
                id: fi_Shift2___uppercase
                anchors.left: parent.left
                anchors.leftMargin: 1664
                anchors.top: parent.top
                anchors.topMargin: 264
                z: 4
                width: 224
                height: 80
                enabled: fi_Shift2___default.enabled
                doubleClickEnabeld: fi_Shift2___default.doubleClickEnabeld
                fi_Letter_font: fi_Shift2___default.fi_Letter_font
                fi_Letter_horizontalAlignment: fi_Shift2___default.fi_Letter_horizontalAlignment
                fi_Letter_lineHeight: fi_Shift2___default.fi_Letter_lineHeight
                fi_Letter_lineHeightMode: fi_Shift2___default.fi_Letter_lineHeightMode
                fi_Letter_opacity: fi_Shift2___default.fi_Letter_opacity
                fi_Letter_richText: fi_Shift2___default.fi_Letter_richText
                fi_Letter_text: fi_Shift2___default.fi_Letter_text
                fi_Letter_textColor: fi_Shift2___default.fi_Letter_textColor
                fi_Letter_verticalAlignment: fi_Shift2___default.fi_Letter_verticalAlignment
                invalid_flag: fi_Shift2___default.invalid_flag
                minimumRepeatInterval: fi_Shift2___default.minimumRepeatInterval
                repeateInterval: fi_Shift2___default.repeateInterval

                onClicked: {
                    root.fi_Shift2___uppercase_clicked();
                }
                onDoubleClicked: {
                    root.fi_Shift2___uppercase_doubleClicked();
                }
                onPressed: {
                    root.fi_Shift2___uppercase_pressed();
                }
                onReleased: {
                    root.fi_Shift2___uppercase_released();
                }
                onRepeatingTriggered: {
                    root.fi_Shift2___uppercase_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_FunctionLeft {
                id: fi_Shift1___uppercase
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 264
                z: 5
                width: 168
                height: 80
                enabled: fi_Shift1___default.enabled
                doubleClickEnabeld: fi_Shift1___default.doubleClickEnabeld
                fi_Letter_font: fi_Shift1___default.fi_Letter_font
                fi_Letter_horizontalAlignment: fi_Shift1___default.fi_Letter_horizontalAlignment
                fi_Letter_lineHeight: fi_Shift1___default.fi_Letter_lineHeight
                fi_Letter_lineHeightMode: fi_Shift1___default.fi_Letter_lineHeightMode
                fi_Letter_opacity: fi_Shift1___default.fi_Letter_opacity
                fi_Letter_richText: fi_Shift1___default.fi_Letter_richText
                fi_Letter_text: fi_Shift1___default.fi_Letter_text
                fi_Letter_textColor: fi_Shift1___default.fi_Letter_textColor
                fi_Letter_verticalAlignment: fi_Shift1___default.fi_Letter_verticalAlignment
                invalid_flag: fi_Shift1___default.invalid_flag
                minimumRepeatInterval: fi_Shift1___default.minimumRepeatInterval
                repeateInterval: fi_Shift1___default.repeateInterval

                onClicked: {
                    root.fi_Shift1___uppercase_clicked();
                }
                onDoubleClicked: {
                    root.fi_Shift1___uppercase_doubleClicked();
                }
                onPressed: {
                    root.fi_Shift1___uppercase_pressed();
                }
                onReleased: {
                    root.fi_Shift1___uppercase_released();
                }
                onRepeatingTriggered: {
                    root.fi_Shift1___uppercase_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_FunctionLeft {
                id: fi_CapsLock___uppercase
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 176
                z: 6
                width: 144
                height: 80
                enabled: fi_CapsLock___default.enabled
                doubleClickEnabeld: fi_CapsLock___default.doubleClickEnabeld
                fi_Letter_font: fi_CapsLock___default.fi_Letter_font
                fi_Letter_horizontalAlignment: fi_CapsLock___default.fi_Letter_horizontalAlignment
                fi_Letter_lineHeight: fi_CapsLock___default.fi_Letter_lineHeight
                fi_Letter_lineHeightMode: fi_CapsLock___default.fi_Letter_lineHeightMode
                fi_Letter_opacity: fi_CapsLock___default.fi_Letter_opacity
                fi_Letter_richText: fi_CapsLock___default.fi_Letter_richText
                fi_Letter_text: fi_CapsLock___default.fi_Letter_text
                fi_Letter_textColor: fi_CapsLock___default.fi_Letter_textColor
                fi_Letter_verticalAlignment: fi_CapsLock___default.fi_Letter_verticalAlignment
                invalid_flag: fi_CapsLock___default.invalid_flag
                minimumRepeatInterval: fi_CapsLock___default.minimumRepeatInterval
                repeateInterval: fi_CapsLock___default.repeateInterval

                onClicked: {
                    root.fi_CapsLock___uppercase_clicked();
                }
                onDoubleClicked: {
                    root.fi_CapsLock___uppercase_doubleClicked();
                }
                onPressed: {
                    root.fi_CapsLock___uppercase_pressed();
                }
                onReleased: {
                    root.fi_CapsLock___uppercase_released();
                }
                onRepeatingTriggered: {
                    root.fi_CapsLock___uppercase_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_FunctionRightBlue {
                id: fi_Enter___uppercase
                anchors.left: parent.left
                anchors.leftMargin: 1696
                anchors.top: parent.top
                anchors.topMargin: 352
                z: 7
                width: 192
                height: 80
                enabled: fi_Enter___default.enabled
                doubleClickEnabeld: fi_Enter___default.doubleClickEnabeld
                fi_Letter_font: fi_Enter___default.fi_Letter_font
                fi_Letter_horizontalAlignment: fi_Enter___default.fi_Letter_horizontalAlignment
                fi_Letter_lineHeight: fi_Enter___default.fi_Letter_lineHeight
                fi_Letter_lineHeightMode: fi_Enter___default.fi_Letter_lineHeightMode
                fi_Letter_opacity: fi_Enter___default.fi_Letter_opacity
                fi_Letter_richText: fi_Enter___default.fi_Letter_richText
                fi_Letter_text: fi_Enter___default.fi_Letter_text
                fi_Letter_textColor: fi_Enter___default.fi_Letter_textColor
                fi_Letter_verticalAlignment: fi_Enter___default.fi_Letter_verticalAlignment
                invalid_flag: fi_Enter___default.invalid_flag
                minimumRepeatInterval: fi_Enter___default.minimumRepeatInterval
                repeateInterval: fi_Enter___default.repeateInterval

                onClicked: {
                    root.fi_Enter___uppercase_clicked();
                }
                onDoubleClicked: {
                    root.fi_Enter___uppercase_doubleClicked();
                }
                onPressed: {
                    root.fi_Enter___uppercase_pressed();
                }
                onReleased: {
                    root.fi_Enter___uppercase_released();
                }
                onRepeatingTriggered: {
                    root.fi_Enter___uppercase_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_FunctionRightGrey {
                id: fi_Delete___uppercase
                anchors.left: parent.left
                anchors.leftMargin: 1752
                anchors.top: parent.top
                z: 8
                width: 136
                height: 80
                enabled: fi_Delete___default.enabled
                doubleClickEnabeld: fi_Delete___default.doubleClickEnabeld
                fi_Letter_font: fi_Delete___default.fi_Letter_font
                fi_Letter_horizontalAlignment: fi_Delete___default.fi_Letter_horizontalAlignment
                fi_Letter_lineHeight: fi_Delete___default.fi_Letter_lineHeight
                fi_Letter_lineHeightMode: fi_Delete___default.fi_Letter_lineHeightMode
                fi_Letter_opacity: fi_Delete___default.fi_Letter_opacity
                fi_Letter_richText: fi_Delete___default.fi_Letter_richText
                fi_Letter_text: fi_Delete___default.fi_Letter_text
                fi_Letter_textColor: fi_Delete___default.fi_Letter_textColor
                fi_Letter_verticalAlignment: fi_Delete___default.fi_Letter_verticalAlignment
                invalid_flag: fi_Delete___default.invalid_flag
                minimumRepeatInterval: fi_Delete___default.minimumRepeatInterval
                repeateInterval: fi_Delete___default.repeateInterval

                onClicked: {
                    root.fi_Delete___uppercase_clicked();
                }
                onDoubleClicked: {
                    root.fi_Delete___uppercase_doubleClicked();
                }
                onPressed: {
                    root.fi_Delete___uppercase_pressed();
                }
                onReleased: {
                    root.fi_Delete___uppercase_released();
                }
                onRepeatingTriggered: {
                    root.fi_Delete___uppercase_repeatingTriggered();
                }
            }
            ZetaSurgicalSet.KeyboardButton_FunctionLeft {
                id: fi_Tab___uppercase
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 88
                z: 9
                width: 120
                height: 80
                enabled: fi_Tab___default.enabled
                doubleClickEnabeld: fi_Tab___default.doubleClickEnabeld
                fi_Letter_font: fi_Tab___default.fi_Letter_font
                fi_Letter_horizontalAlignment: fi_Tab___default.fi_Letter_horizontalAlignment
                fi_Letter_lineHeight: fi_Tab___default.fi_Letter_lineHeight
                fi_Letter_lineHeightMode: fi_Tab___default.fi_Letter_lineHeightMode
                fi_Letter_opacity: fi_Tab___default.fi_Letter_opacity
                fi_Letter_richText: fi_Tab___default.fi_Letter_richText
                fi_Letter_text: fi_Tab___default.fi_Letter_text
                fi_Letter_textColor: fi_Tab___default.fi_Letter_textColor
                fi_Letter_verticalAlignment: fi_Tab___default.fi_Letter_verticalAlignment
                invalid_flag: fi_Tab___default.invalid_flag
                minimumRepeatInterval: fi_Tab___default.minimumRepeatInterval
                repeateInterval: fi_Tab___default.repeateInterval

                onClicked: {
                    root.fi_Tab___uppercase_clicked();
                }
                onDoubleClicked: {
                    root.fi_Tab___uppercase_doubleClicked();
                }
                onPressed: {
                    root.fi_Tab___uppercase_pressed();
                }
                onReleased: {
                    root.fi_Tab___uppercase_released();
                }
                onRepeatingTriggered: {
                    root.fi_Tab___uppercase_repeatingTriggered();
                }
            }
            ComponentsSet.ModelView {
                id: fi_ListViewRow4_horizontal
                anchors.left: parent.left
                anchors.leftMargin: 176
                anchors.top: parent.top
                anchors.topMargin: 265
                z: 10
                width: 1480
                height: 80
                viewDelegate: fi_ListViewRow4_horizontal_delegate_cmp
                delegateSpacing: 8
                vertical: false

                onCurrentIndexUpdated: {
                    root.fi_ListViewRow4_horizontal_currentIndexUpdated(index);
                }
                onIsDragging: {
                    root.fi_ListViewRow4_horizontal_isDragging(dragging);
                }
            }
            ComponentsSet.ModelView {
                id: fi_ListViewRow3_horizontal
                anchors.left: parent.left
                anchors.leftMargin: 152
                anchors.top: parent.top
                anchors.topMargin: 176
                z: 11
                width: 1736
                height: 80
                viewDelegate: fi_ListViewRow3_horizontal_delegate_cmp
                delegateSpacing: 8
                vertical: false

                onCurrentIndexUpdated: {
                    root.fi_ListViewRow3_horizontal_currentIndexUpdated(index);
                }
                onIsDragging: {
                    root.fi_ListViewRow3_horizontal_isDragging(dragging);
                }
            }
            ComponentsSet.ModelView {
                id: fi_ListViewRow2_horizontal
                anchors.left: parent.left
                anchors.leftMargin: 128
                anchors.top: parent.top
                anchors.topMargin: 88
                z: 12
                width: 1760
                height: 80
                viewDelegate: fi_ListViewRow2_horizontal_delegate_cmp
                delegateSpacing: 8
                vertical: false

                onCurrentIndexUpdated: {
                    root.fi_ListViewRow2_horizontal_currentIndexUpdated(index);
                }
                onIsDragging: {
                    root.fi_ListViewRow2_horizontal_isDragging(dragging);
                }
            }
            ComponentsSet.ModelView {
                id: fi_ListViewRow1_horizontal
                anchors.left: parent.left
                anchors.top: parent.top
                z: 13
                width: 1744
                height: 80
                viewDelegate: fi_ListViewRow1_horizontal_delegate_cmp
                delegateSpacing: 8
                vertical: false

                onCurrentIndexUpdated: {
                    root.fi_ListViewRow1_horizontal_currentIndexUpdated(index);
                }
                onIsDragging: {
                    root.fi_ListViewRow1_horizontal_isDragging(dragging);
                }
            }
        }
    }

    //----------------------------------------------------------------------------------------------

    //States----------------------------------------------------------------------------------------
    StateGroup { // generic_symbol
        states: [
        State {
            when: root.symbol_flag
            name: "symbol"
            PropertyChanges {
                target: symbol_StateParent
                visible: true
                z: 999
            }
        }
        ]
    }
    StateGroup { // generic_uppercase
        states: [
        State {
            when: root.uppercase_flag
            name: "uppercase"
            PropertyChanges {
                target: uppercase_StateParent
                visible: true
                z: 999
            }
        }
        ]
    }

    //----------------------------------------------------------------------------------------------
}
