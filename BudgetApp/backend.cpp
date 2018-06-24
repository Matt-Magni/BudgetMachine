#include "backend.h"

Backend::Backend(QObject *parent) :
    QObject(parent)
{
}

double Backend::getPurchaseAmount()
{
    return m_purchaseAmount;
}

void Backend::setPurchaseAmount(const double &purchaseAmount)
{
    if (purchaseAmount == m_purchaseAmount)
        return;

    m_purchaseAmount = purchaseAmount;
    emit purchaseAmountChanged();
}

double Backend::getBalanceAmount()
{
    return m_balanceAmount;
}

void Backend::setBalanceAmount(const double &balanceAmount)
{
    if (balanceAmount == m_balanceAmount)
        return;

    m_balanceAmount = balanceAmount;
    emit balanceAmountChanged();
}


