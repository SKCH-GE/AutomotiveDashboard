# Qt Automotive Dashboard

A modern, customizable automotive dashboard built with Qt/QML featuring real-time gauges, notifications, and interactive controls.

## Features

- **Real-time Gauges**: Speed, gear, fuel level, and engine temperature visualization
- **Danger Zone Alerts**: Visual indicators and popup notifications for critical values
- **Interactive Controls**: Adjust gauge values with sliders and dropdowns
- **Customizable Design**: Modern dark theme optimized for automotive displays
- **Responsive Layout**: Adapts to different screen sizes

## Project Structure

The project follows a clean architecture separating UI components and data model:

```
├── QML/                    # QML UI components
│   ├── CircularGauge.qml   # Reusable gauge component
│   ├── Dashboard.qml       # Main dashboard layout
│   ├── main.qml            # Application entry point
│   ├── NotificationSystem.qml  # Alert popup system
│   └── ValueSlider.qml     # Custom slider control
├── src/                    # C++ source files
│   ├── dashboardmodel.h    # Data model header
│   ├── dashboardmodel.cpp  # Data model implementation
│   └── main.cpp            # Application bootstrap
├── AutomotiveDashboard.pro # Qt project file
└── qml.qrc                 # Resource collection file
```

## Architecture Overview

The application follows the Model-View pattern:
- **Model**: C++ `DashboardModel` class providing data and business logic
- **View**: QML components for visualization and user interaction
- **Connection**: QML context property system bridges C++ model to QML views

## Component Diagrams

See the UML diagrams below for a detailed breakdown of system components and their interactions.

### Class Diagram

![VPHDJzmm48Rl-HK-WjgWjkBKGyK71I6LgYAebNf1atZ8MkkCgJq1jgZ_lV54ktQoQIyeVjvtFfWPE0aCdllE5aLO6te43vrgB8HmoknDtJDUDuugynlLkxdbqX5NlB6eQcVraYfnxu_dqXaqwzQxdlIviywhBwPTSRNUdDaUz_hmtZsFjWlmwye2uvM7pQ8lrVnG58A7eB2g7NXzupH](https://github.com/user-attachments/assets/6d79473a-0d87-49c6-9f45-734057ea1a3d)


### Sequence Diagram

![ZP4nRzim48Lt_eg3fcJeKA2JXoA9t7f9Z09gF7IxY6UPDKMoTsGCf-X_BydOjLG4HHV3klVntNlaZKJac4QhbEoD2yWuWj2FHAud-Aa0RfdzeVNMCooHzvt5I2l6OvRkpPRkZQCxpvhubMazkwtr1-8xcsWAORyVs2UdAvZdmovs--C9-u8SJMy2klWlkodt_uwVlOjTF5g29s_r6vf-1](https://github.com/user-attachments/assets/427e8ed4-29dd-4026-b4ae-210e08d9d2c5)

### Activity Diagram

![RLBDRjf04BxlKunoIewLUe93am29aA1gGsYatZRsO8zOTgpPTHAtujqxknZNg9KGikVdc-_7jo5QYUt16HFsv1ihzW2sYFH6iOFV1k21VTpGBuHFd_NjtXRxIhZrvOmT2woegkDctzsx5bERfKGvjUPMzXjd8pwAxRHt9yBl_s_b6x5p2A_iIdCq9jCoPhBq5CcwTF-kQHmLDXBxgPd](https://github.com/user-attachments/assets/836447c4-7485-4f80-ba1e-3eefb1850431)

### State Diagram (Notification System)

![XP7FI_j04CNl-rVC-GizVCLJaLBRL154fF47A1x6Pao7R7R3P8Aaul_kBY6whKAFUUzzTYPlvgsYQ5TROzgANOE2DGHD2JuCm08tLIc-SyNIMozmpULMywfVs8wYxQKW6QmCfSfj02y5--1TUASvxmZ-duvVsbk2LsyByvcEGn7_3d7SiPTE8lZyxmKcanbSELP6opjs9Km3MpVUaLD](https://github.com/user-attachments/assets/6acaa775-16f4-4e2f-8241-b1b21987fb33)



## Requirements

- Qt 5.12+ (Qt 6.x compatible)
- C++17 compiler

## Building and Running

1. Clone the repository:
```bash
git clone https://github.com/yourusername/qt-automotive-dashboard.git
cd qt-automotive-dashboard
```

2. Open the project in Qt Creator:
```bash
qtcreator AutomotiveDashboard.pro
```

3. Build and run the project from Qt Creator, or use qmake directly:
```bash
mkdir build && cd build
qmake ../AutomotiveDashboard.pro
make
./AutomotiveDashboard
```

## Usage

The dashboard shows four primary gauges for automotive metrics:

- **Speed**: Current vehicle speed (0-220 km/h)
- **Gear**: Current gear selection (1-6)
- **Fuel**: Remaining fuel level (0-100%)
- **Temperature**: Engine temperature (50-130°C)

Use the control panel at the bottom to adjust values and observe how the gauges and notification system respond.

## Customization

The dashboard is designed to be easily customizable:

- Adjust gauge parameters in `CircularGauge.qml` (colors, ranges, etc.)
- Modify the dashboard layout in `Dashboard.qml`
- Add new gauges by creating additional `CircularGauge` instances
- Change the notification behavior in `NotificationSystem.qml`

## Architecture Details

### Class Diagram

See the class diagram below for a detailed view of component relationships.

### Sequence Diagrams

The sequence diagrams illustrate key interactions such as gauge value changes and notification display.

### Component Dependencies

The component diagram shows how different parts of the system connect and interact.

## License

[MIT License](LICENSE)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request
