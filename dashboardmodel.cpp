#include "dashboardmodel.h"

DashboardModel::DashboardModel(QObject *parent)
    : QObject(parent)
    , m_speed(0)
    , m_gear(1)
    , m_fuel(100)
    , m_temperature(90)
{
}

qreal DashboardModel::speed() const
{
    return m_speed;
}

void DashboardModel::setSpeed(qreal newSpeed)
{
    if (qFuzzyCompare(m_speed, newSpeed))
        return;
    
    // Clamp speed between 0 and 220
    m_speed = qBound(0.0, newSpeed, 220.0);
    emit speedChanged(m_speed);
}

int DashboardModel::gear() const
{
    return m_gear;
}

void DashboardModel::setGear(int newGear)
{
    if (m_gear == newGear)
        return;
    
    // Clamp gear between 1 and 6
    m_gear = qBound(1, newGear, 6);
    emit gearChanged(m_gear);
}

qreal DashboardModel::fuel() const
{
    return m_fuel;
}

void DashboardModel::setFuel(qreal newFuel)
{
    if (qFuzzyCompare(m_fuel, newFuel))
        return;
    
    // Clamp fuel between 0 and 100
    m_fuel = qBound(0.0, newFuel, 100.0);
    emit fuelChanged(m_fuel);
}

qreal DashboardModel::temperature() const
{
    return m_temperature;
}

void DashboardModel::setTemperature(qreal newTemperature)
{
    if (qFuzzyCompare(m_temperature, newTemperature))
        return;
    
    // Clamp temperature between 50 and 130
    m_temperature = qBound(50.0, newTemperature, 130.0);
    emit temperatureChanged(m_temperature);
}