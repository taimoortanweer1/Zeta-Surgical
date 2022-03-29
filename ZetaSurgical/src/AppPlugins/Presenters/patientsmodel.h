#pragma once

#include <QAbstractListModel>
#include <QSortFilterProxyModel>
#include <QDate>

struct Patient {
    QString name;
    QString mrn;
    QDate dob;
    QString sex;
    QString studies;
    QString sessionID;
    QDate date;
};

struct StudyData {
    QDate studyDate;
    int id;
    QString description;
    int nos;
    QDate date;
};

using Patients = QList<Patient>;

class PatientsFilterModel : public QSortFilterProxyModel
{
    Q_OBJECT
public:
    PatientsFilterModel(QObject *parent);
    void setFilterString(QString filter);
    QVariant getData(int index, int role) const;

protected:
    bool filterAcceptsRow(int source_row, const QModelIndex &source_parent) const;

private:
    QString m_filter;
};

class PatientsModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles {
        Name = Qt::UserRole + 1,
        MRN,
        DOB,
        Sex,
        Studies,
        SessionID,
        Date,
        Index
    };
    explicit PatientsModel(QObject *parent);
    void addPatient(Patient const &patient);

    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;

private:
    Patients m_data;
};

using Studies = QList<StudyData>;

class StudiesList: public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles {
        StudyDate = Qt::UserRole + 1,
        ID,
        Description,
        NOS,
        Date,
        Index
    };
    explicit StudiesList(QObject *parent);
    void addStudy(StudyData const &data);

    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;

private:
    Studies m_data;
};
