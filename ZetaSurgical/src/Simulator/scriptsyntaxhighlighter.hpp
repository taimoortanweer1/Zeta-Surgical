/**********************************************************************************************************************
 * (C) Copyright 2021 Integrated Computer Solutions, Inc. - All rights reserved.
 **********************************************************************************************************************/

#pragma once

#include <QQuickTextDocument>
#include <QRegularExpression>
#include <QSyntaxHighlighter>

class ScriptSyntaxHighlighter : public QSyntaxHighlighter
{
    Q_OBJECT

    Q_PROPERTY(
            QQuickTextDocument *scriptDocument READ scriptDocument WRITE setScriptDocument NOTIFY scriptDocumentChanged)
    Q_PROPERTY(bool jsonHighlighter READ jsonHighlighter WRITE setJsonHighlighter NOTIFY jsonHighlighterChanged)

public:
    explicit ScriptSyntaxHighlighter(QObject *parent = nullptr);

    QQuickTextDocument *scriptDocument() const { return m_scriptDocument; }
    void setScriptDocument(QQuickTextDocument *document);

    bool jsonHighlighter() const { return m_jsonHighlighter; }
    void setJsonHighlighter(bool json);

signals:
    void scriptDocumentChanged();
    void jsonHighlighterChanged();

    // QSyntaxHighlighter interface
protected:
    void highlightBlock(const QString &text) override;

private:
    QQuickTextDocument *m_scriptDocument = nullptr;

    struct Rule {
        QRegularExpression regExp;
        QTextCharFormat format;
    };
    QVector<Rule> m_scriptRules;
    QVector<Rule> m_jsonRules;

    bool m_jsonHighlighter = false;
};
