#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>

class Backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double purchaseAmount READ getPurchaseAmount WRITE setPurchaseAmount NOTIFY purchaseAmountChanged)
    Q_PROPERTY(double balanceAmount READ getBalanceAmount WRITE setBalanceAmount NOTIFY balanceAmountChanged)

public:
    explicit Backend(QObject *parent = nullptr);

    double getPurchaseAmount();
    void setPurchaseAmount(const double &purchaseAmount);

    double getBalanceAmount();
    void setBalanceAmount(const double &balanceAmount);


signals:
    void purchaseAmountChanged();
    void balanceAmountChanged();

private:
    double m_purchaseAmount = 0.0;
    double m_balanceAmount = 200.0;
};

#endif // BACKEND_H

