#include "backend.h"

Backend::Backend(QObject *parent) :
    QObject(parent)
  , m_purchaseAmount(0)
  , m_balanceAmount(200)
  , m_bankAmount(0)
  , m_settings("MagniSoft", "BudgetApp")
{
    loadBalanceAmount();
    loadBankAmount();
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
    int temp = (int)(100*balanceAmount);
    m_balanceAmount = ((double)temp)/100;
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

double Backend::getBankAmount()
{
    return m_bankAmount;
}

void Backend::setBankAmount(const double &bankAmount)
{
    if (bankAmount == m_bankAmount)
        return;
    int temp = (int)(100*bankAmount);
    m_bankAmount = ((double)temp)/100;
    emit bankAmountChanged();
    saveBankAmount();
}

void Backend::saveBankAmount()
{
    m_settings.setValue("bank", m_bankAmount);
}
void Backend::loadBankAmount()
{
    if (m_settings.contains("bank"))
    {
        m_bankAmount = m_settings.value("bank").toDouble();
    }
    else
    {
        m_bankAmount  = DEFAULT_BANK;
    }
}

