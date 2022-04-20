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
        Index,
        RawDOB,
        RawDate,
        Invalid = -1
    };
    explicit PatientsModel(QObject *parent);
    void addPatient(Patient const &patient);

    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;

private:
    Patients m_data;
};

class SortFilterModel : public QSortFilterProxyModel
{
    Q_OBJECT
public:
    SortFilterModel(QObject *parent);
    void setFilterString(QString filter);
    QVariant getData(int index, int role) const;
    void sortByRole(int role, Qt::SortOrder order);

protected:
    bool filterAcceptsRow(int source_row, const QModelIndex &source_parent) const override;
    bool lessThan(const QModelIndex &left, const QModelIndex &right) const override;

private:
    QString m_filter;
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

struct StudyDescriptionData {
    int series;
    QString description;
    QString modality;
    QString size;
    int count;
    QDate date;
};

using StudiesDescription = QList<StudyDescriptionData >;

class StudyDescriptionList: public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles {
        Series = Qt::UserRole + 1,
        Description,
        Modality,
        Size,
        Count,
        Date,
        Index
    };
    explicit StudyDescriptionList(QObject *parent);
    void addStudyDescription(StudyDescriptionData const &data);

    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;

private:
    StudiesDescription m_data;
};

struct ListHeaderData {
    QString caption;
    int width;
    int sortOrder;
    int id;
};

class ListHeaderModel: public QAbstractListModel {
    Q_OBJECT
public:
    enum Roles {
        Label = Qt::UserRole + 1,
        Width,
        Index,
        SortOrder
    };
    explicit ListHeaderModel(QList<ListHeaderData> const &data, QObject *parent);
    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;
    void toggleSortRole(int headerEntry);
    int sortOrderForHeaderEntry(int headerEntry);

private:
    QList<ListHeaderData> m_data;
};
