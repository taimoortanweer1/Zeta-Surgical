#pragma once

#include<QLoggingCategory>

// Keyboard presenter logging category
Q_LOGGING_CATEGORY(keyboardPresenter, "[KeyboardPresenter]")
#define kpDebug() qCDebug(keyboardPresenter, )
#define kpInfo() qCInfo(keyboardPresenter, )
#define kpWarning() qCWarning(keyboardPresenter, )
#define kpCritical() qCCritical(keyboardPresenter, )
