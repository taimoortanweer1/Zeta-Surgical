#include "patientsmodel.h"

char const * DATE_FORMAT = "dd/MM/yy";

PatientsModel::PatientsModel(QObject *parent)
    : QAbstractListModel{parent}
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
    if(role == Sex)
        res = patient.sex;
    if(role == Studies)
        res = patient.studies;
    if(role == SessionID)
        res = patient.sessionID;
    if(role == Date)
        res = patient.date.toString(QString::fromLatin1(DATE_FORMAT));
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

PatientsFilterModel::PatientsFilterModel(QObject *parent)
    : QSortFilterProxyModel(parent)
{

}

void PatientsFilterModel::setFilterString(QString filter)
{
    m_filter = filter;
    invalidate();
}

bool PatientsFilterModel::filterAcceptsRow(int source_row, const QModelIndex &source_parent) const
{
    Q_UNUSED(source_parent);

    if(m_filter.isEmpty())
        return true;
    return sourceModel()->data(sourceModel()->index(source_row, 0), PatientsModel::Name).toString().startsWith(m_filter);
}
