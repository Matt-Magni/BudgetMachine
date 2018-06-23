#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>

class Backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString purchaseAmount READ getPurchaseAmount WRITE setPurchaseAmount NOTIFY purchaseAmountChanged)

public:
    explicit Backend(QObject *parent = nullptr);

    QString getPurchaseAmount();
    void setPurchaseAmount(const QString &purchaseAmount);

signals:
    void purchaseAmountChanged();

private:
    QString m_purchaseAmount;
};

#endif // BACKEND_H
