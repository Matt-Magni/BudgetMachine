#include "backend.h"

Backend::Backend(QObject *parent) :
    QObject(parent)
  , m_purchaseAmount(0)
  , m_balanceAmount(200)
  , m_settings("MagniSoft", "BudgetApp")
{
    loadBalanceAmount();
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
    saveBalanceAmount();
}

void Backend::saveBalanceAmount()
{
    m_settings.setValue("balance", m_balanceAmount);
}
void Backend::loadBalanceAmount()
{
    if (m_settings.contains("balance"))
    {
        m_balanceAmount = m_settings.value("balance").toDouble();
    }
    else
    {
        m_balanceAmount  = DEFAULT_BALANCE;
    }

}

