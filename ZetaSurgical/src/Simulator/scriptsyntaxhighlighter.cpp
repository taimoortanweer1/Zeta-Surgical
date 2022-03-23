/**********************************************************************************************************************
 * (C) Copyright 2021 Integrated Computer Solutions, Inc. - All rights reserved.
 **********************************************************************************************************************/

#include "scriptsyntaxhighlighter.hpp"

ScriptSyntaxHighlighter::ScriptSyntaxHighlighter(QObject *parent)
    : QSyntaxHighlighter(parent)
{
    QTextCharFormat operatorFormat;
    operatorFormat.setForeground(QBrush(QColor(QStringLiteral("#c9ff55"))));

    QTextCharFormat flowControl;
    flowControl.setForeground(QBrush(QColor(QStringLiteral("#b4b4b4"))));

    QTextCharFormat keyword;
    keyword.setForeground(QBrush(QColor(QStringLiteral("#ffff55"))));

    QTextCharFormat scopeKeyword;
    scopeKeyword.setForeground(QBrush(QColor(QStringLiteral("#dcba95"))));

    QTextCharFormat stringLiteral;
    stringLiteral.setForeground(QBrush(QColor(QStringLiteral("#617bff"))));

    QTextCharFormat numberLiteral;
    numberLiteral.setForeground(QBrush(QColor(QStringLiteral("#a5f7f2"))));

    QTextCharFormat functionCall;
    functionCall.setForeground(QBrush(QColor(QStringLiteral("#ac9fff"))));

    QTextCharFormat type;
    type.setForeground(QBrush(QColor(QStringLiteral("#66ff25"))));

    QTextCharFormat singleLineComment;
    singleLineComment.setForeground(QBrush(QColor(QStringLiteral("#41dde2"))));

    m_scriptRules = {
        { QRegularExpression(QStringLiteral("!")), operatorFormat },
        { QRegularExpression(QStringLiteral("%")), operatorFormat },
        { QRegularExpression(QStringLiteral("&")), operatorFormat },
        { QRegularExpression(QStringLiteral("\\*")), operatorFormat },
        { QRegularExpression(QStringLiteral("-")), operatorFormat },
        { QRegularExpression(QStringLiteral("/")), operatorFormat },
        { QRegularExpression(QStringLiteral("=")), operatorFormat },
        { QRegularExpression(QStringLiteral("\\+")), operatorFormat },
        { QRegularExpression(QStringLiteral("\\^")), operatorFormat },
        { QRegularExpression(QStringLiteral("\\|")), operatorFormat },
        { QRegularExpression(QStringLiteral("<")), operatorFormat },
        { QRegularExpression(QStringLiteral(">")), operatorFormat },
        { QRegularExpression(QStringLiteral("\\.")), operatorFormat },
        { QRegularExpression(QStringLiteral(":")), operatorFormat },
        { QRegularExpression(QStringLiteral("\\?")), operatorFormat },

        { QRegularExpression(QStringLiteral(",")), flowControl },
        { QRegularExpression(QStringLiteral(";")), flowControl },
        { QRegularExpression(QStringLiteral("\\[")), flowControl },
        { QRegularExpression(QStringLiteral("\\]")), flowControl },
        { QRegularExpression(QStringLiteral("\\{")), flowControl },
        { QRegularExpression(QStringLiteral("\\}")), flowControl },
        { QRegularExpression(QStringLiteral("\\(")), flowControl },
        { QRegularExpression(QStringLiteral("\\)")), flowControl },

        { QRegularExpression(QStringLiteral("\\bawait\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bbreak\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bcase\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bcatch\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bclass\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bconsole\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bconst\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bdefault\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bdo\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\belse\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\benum\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bfalse\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bfinally\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bfor\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bfunction\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bif\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bimplements\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bimport\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bin\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\binstamceof\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\binterface\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\blet\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bnew\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bnull\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bpackage\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bprivate\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bprotected\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bpublic\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\breturn\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bstatic\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bsuper\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bswitch\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bthis\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bthrow\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\btrue\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\btry\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\btypeof\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bundefined\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bvar\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bwhile\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\bwith\\b")), keyword },
        { QRegularExpression(QStringLiteral("\\byield\\b")), keyword },

        { QRegularExpression(QStringLiteral("\\bargs\\b")), scopeKeyword },
        { QRegularExpression(QStringLiteral("\\bmethod\\b")), scopeKeyword },
        { QRegularExpression(QStringLiteral("\\bproperty\\b")), scopeKeyword },
        { QRegularExpression(QStringLiteral("\\bself\\b")), scopeKeyword },
        { QRegularExpression(QStringLiteral("\\bvalue\\b")), scopeKeyword },

        { QRegularExpression(QStringLiteral("\\d*")), numberLiteral },

        { QRegularExpression(QStringLiteral("\\b[A-Z]{1}[A-Za-z]+\\b")), type },

        { QRegularExpression(QStringLiteral("\\b[A-Za-z0-9_]+(?=\\()")), functionCall },

        { QRegularExpression(QStringLiteral("\"[A-Za-z0-9_ .,?!:;\\-=+@#$%^&*(){}<>/']*\"")), stringLiteral },
        { QRegularExpression(QStringLiteral("\'[A-Za-z0-9_ .,?!:;\\-=+@#$%^&*(){}<>/\"]*\'")), stringLiteral },

        { QRegularExpression(QStringLiteral("//[^\n]*")), singleLineComment }
    };

    m_jsonRules = { { QRegularExpression(QStringLiteral("\\{")), flowControl },
                    { QRegularExpression(QStringLiteral("\\}")), flowControl },
                    { QRegularExpression(QStringLiteral("\\[")), flowControl },
                    { QRegularExpression(QStringLiteral("\\]")), flowControl },

                    { QRegularExpression(QStringLiteral("\\btrue\\b")), keyword },
                    { QRegularExpression(QStringLiteral("\\bfalse\\b")), keyword },

                    { QRegularExpression(QStringLiteral("\\d*")), numberLiteral },

                    { QRegularExpression(QStringLiteral("\"[A-Za-z0-9_ .,?!:;\\-=+@#$%^&*(){}<>/']*\"")),
                      stringLiteral },

                    { QRegularExpression(QStringLiteral("\"[A-Za-z0-9_ .,?!:;\\-=+@#$%^&*(){}<>/']*\":")), type } };
}

void ScriptSyntaxHighlighter::setScriptDocument(QQuickTextDocument *document)
{
    if (document != m_scriptDocument) {
        m_scriptDocument = document;
        emit scriptDocumentChanged();
        setDocument(m_scriptDocument->textDocument());
    }
}

void ScriptSyntaxHighlighter::setJsonHighlighter(bool json)
{
    if (m_jsonHighlighter != json) {
        m_jsonHighlighter = json;
        emit jsonHighlighterChanged();
    }
}

void ScriptSyntaxHighlighter::highlightBlock(const QString &text)
{
    const auto rules = m_jsonHighlighter ? m_jsonRules : m_scriptRules;
    for (const auto &rule : rules) {
        QRegularExpressionMatchIterator matchIterator = rule.regExp.globalMatch(text);
        while (matchIterator.hasNext()) {
            QRegularExpressionMatch match = matchIterator.next();
            setFormat(match.capturedStart(), match.capturedLength(), rule.format);
        }
    }
}
