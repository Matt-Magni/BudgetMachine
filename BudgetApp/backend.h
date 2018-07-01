#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>
#include <QSettings>

#define DEFAULT_BALANCE 200.0
#define DEFAULT_BANK 0.0

class Backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double purchaseAmount READ getPurchaseAmount WRITE setPurchaseAmount NOTIFY purchaseAmountChanged)
    Q_PROPERTY(double balanceAmount READ getBalanceAmount WRITE setBalanceAmount NOTIFY balanceAmountChanged)
    Q_PROPERTY(double bankAmount READ getBankAmount WRITE setBankAmount NOTIFY bankAmountChanged)

public:
    explicit Backend(QObject *parent = nullptr);

    double getPurchaseAmount();
    void setPurchaseAmount(const double &purchaseAmount);

    double getBalanceAmount();
    void setBalanceAmount(const double &balanceAmount);

    double getBankAmount();
    void setBankAmount(const double &bankAmount);


signals:
    void purchaseAmountChanged();
    void balanceAmountChanged();
    void bankAmountChanged();

private:
    void saveBalanceAmount();
    void loadBalanceAmount();
    void saveBankAmount();
    void loadBankAmount();

    double m_purchaseAmount;
    double m_balanceAmount;
    double m_bankAmount;

    QSettings m_settings;
};

#endif // BACKEND_H

