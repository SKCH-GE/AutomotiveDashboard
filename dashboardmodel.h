#ifndef DASHBOARDMODEL_H
#define DASHBOARDMODEL_H

#include <QObject>

class DashboardModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(qreal speed READ speed WRITE setSpeed NOTIFY speedChanged)
    Q_PROPERTY(int gear READ gear WRITE setGear NOTIFY gearChanged)
    Q_PROPERTY(qreal fuel READ fuel WRITE setFuel NOTIFY fuelChanged)
    Q_PROPERTY(qreal temperature READ temperature WRITE setTemperature NOTIFY temperatureChanged)

public:
    explicit DashboardModel(QObject *parent = nullptr);

    qreal speed() const;
    void setSpeed(qreal newSpeed);

    int gear() const;
    void setGear(int newGear);

    qreal fuel() const;
    void setFuel(qreal newFuel);

    qreal temperature() const;
    void setTemperature(qreal newTemperature);

signals:
    void speedChanged(qreal speed);
    void gearChanged(int gear);
    void fuelChanged(qreal fuel);
    void temperatureChanged(qreal temperature);

private:
    qreal m_speed;
    int m_gear;
    qreal m_fuel;
    qreal m_temperature;
};

#endif // DASHBOARDMODEL_H