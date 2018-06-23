#include "backend.h"

Backend::Backend(QObject *parent) :
    QObject(parent)
{
}

QString Backend::getPurchaseAmount()
{
    return m_purchaseAmount;
}

void Backend::setPurchaseAmount(const QString &purchaseAmount)
{
    if (purchaseAmount == m_purchaseAmount)
        return;

    m_purchaseAmount = purchaseAmount;
    emit purchaseAmountChanged();
}
