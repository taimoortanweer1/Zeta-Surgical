#include "patientsmodel.h"
#include <QDebug>

char const * DATE_FORMAT = "dd/MM/yy";

PatientsModel::PatientsModel(QObject *parent)
    : QAbstractListModel(parent)
{

}

void PatientsModel::addPatient(const Patient &patient)
{
    m_data << patient;
}

int PatientsModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_data.count();
}

QVariant PatientsModel::data(const QModelIndex &index, int role) const
{
    QVariant res;
    if(!index.isValid())
        return res;
    if(index.row() < 0 || index.row() >= m_data.count())
        return res;
    auto const &patient = m_data.at(index.row());
    if(role == Name)
        res = patient.name;
    if(role == MRN)
        res = patient.mrn;
    if(role == DOB)
        res = patient.dob.toString(QString::fromLatin1(DATE_FORMAT));
    if(role == RawDOB)
        res = patient.dob;
    if(role == Sex)
        res = patient.sex;
    if(role == Studies)
        res = patient.studies;
    if(role == SessionID)
        res = patient.sessionID;
    if(role == Date)
        res = patient.date.toString(QString::fromLatin1(DATE_FORMAT));
    if(role == RawDate)
        res = patient.date;
    if(role == Index)
        res = index.row();
    return res;
}

QHash<int, QByteArray> PatientsModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[Name] = "name";
    roles[MRN] = "mrn";
    roles[DOB] = "dob";
    roles[Sex] = "sex";
    roles[Studies] = "studies";
    roles[SessionID] = "sessionID";
    roles[Date] = "date";
    roles[Index] = "index";
    return roles;
}

SortFilterModel::SortFilterModel(QObject *parent)
    : QSortFilterProxyModel(parent)
{

}

void SortFilterModel::setFilterString(QString filter)
{
    m_filter = filter;
    invalidate();
}

QVariant SortFilterModel::getData(int ind, int role) const
{
    auto const sourceIndex = mapToSource(index(ind, 0));
    return sourceModel()->data(sourceIndex, role);
}

void SortFilterModel::sortByRole(int role)
{
    qWarning() << __PRETTY_FUNCTION__ << role;
    setSortRole(role);
    sort(0, Qt::AscendingOrder);
}

bool SortFilterModel::lessThan(const QModelIndex &left, const QModelIndex &right) const
{
    auto const leftData = sourceModel()->data(left, sortRole());
    auto const rightData = sourceModel()->data(right, sortRole());
    return leftData < rightData;
}

bool SortFilterModel::filterAcceptsRow(int source_row, const QModelIndex &source_parent) const
{
    Q_UNUSED(source_parent);

    if(m_filter.isEmpty())
        return true;
    return sourceModel()->data(sourceModel()->index(source_row, 0), PatientsModel::Name).toString().startsWith(m_filter);
}

StudiesList::StudiesList(QObject *parent)
    : QAbstractListModel(parent)
{

}

void StudiesList::addStudy(const StudyData &data)
{
    m_data << data;
}

int StudiesList::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_data.count();
}

QVariant StudiesList::data(const QModelIndex &index, int role) const
{
    QVariant res;
    if(!index.isValid())
        return res;
    if(index.row() < 0 || index.row() >= m_data.count())
        return res;
    auto const &study = m_data.at(index.row());
    if(role == StudyDate)
        res = study.studyDate.toString(QString::fromLatin1(DATE_FORMAT));;
    if(role == ID)
        res = study.id;
    if(role == Description)
        res = study.description;
    if(role == NOS)
        res = study.nos;
    if(role == Date)
        res = study.date.toString(QString::fromLatin1(DATE_FORMAT));;
    if(role == Index)
        res = index.row();
    return res;
}

QHash<int, QByteArray> StudiesList::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[StudyDate] = "studyDate";
    roles[ID] = "id";
    roles[Description] = "description";
    roles[NOS] = "nos";
    roles[Date] = "date";
    roles[Index] = "index";
    return roles;
}

StudyDescriptionList::StudyDescriptionList(QObject *parent)
    : QAbstractListModel(parent)
{

}

void StudyDescriptionList::addStudyDescription(const StudyDescriptionData &data)
{
    m_data << data;
}

int StudyDescriptionList::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_data.count();
}

QVariant StudyDescriptionList::data(const QModelIndex &index, int role) const
{
    QVariant res;
    if(!index.isValid())
        return res;
    if(index.row() < 0 || index.row() >= m_data.count())
        return res;
    auto const &value = m_data.at(index.row());
    if(role == Series)
        res = QStringLiteral("#%1").arg(value.series);
    if(role == Description)
        res = value.description;
    if(role == Modality)
        res = value.modality;
    if(role == Size)
        res = value.size;
    if(role == Count)
        res = value.count;
    if(role == Date)
        res = value.date.toString(QString::fromLatin1(DATE_FORMAT));;
    if(role == Index)
        res = index.row();
    return res;
}

QHash<int, QByteArray> StudyDescriptionList::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[Series] = "series";
    roles[Description] = "description";
    roles[Modality] = "modality";
    roles[Size] = "size";
    roles[Count] = "count";
    roles[Date] = "dateAdded";
    roles[Index] = "index";
    return roles;
}
