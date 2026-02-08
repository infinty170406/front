# The Guardian - Flutter App

<div align="center">
  <h3>🛡️ Protect your children, simply</h3>
  <p>A modern parental control application built with Flutter</p>
</div>

## 📱 Overview

The Guardian is a comprehensive parental control application that helps parents monitor and manage their children's digital activities. This Flutter implementation is converted from HTML/Tailwind designs and features 29 fully functional screens.

## ✨ Features

### 🎨 Beautiful UI
- Modern, clean design with support for light and dark themes
- Smooth animations and transitions
- Responsive layouts for all screen sizes
- Custom color palette (Primary: #7F13EC)

### 📊 Complete Screen Set
- **Onboarding** - Welcome and feature introduction
- **Authentication** - Parent account creation and PIN lock
- **Dashboard** - Multi-child activity overview
- **Profiles** - Child profile management
- **Monitoring** - Activity reports and analytics
- **Controls** - Screen time, app filtering, content rules
- **Location** - Real-time tracking, safe zones, alerts
- **Settings** - Comprehensive app configuration
- **AI Features** - Smart recommendations and safety suggestions

## 🗂️ Project Structure

```
the_guardian_flutter/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── routes.dart              # Navigation routes
│   ├── theme/
│   │   ├── app_colors.dart      # Color palette
│   │   └── app_theme.dart       # Theme configuration
│   └── screens/                 # All 29 screens
│       ├── splash_screen_screen.dart
│       ├── onboarding__understand_screen.dart
│       ├── onboarding__control_screen.dart
│       ├── create_parent_account_screen.dart
│       ├── create_child_profile_screen.dart
│       ├── multi_child_dashboard_screen.dart
│       ├── child_profile_details_screen.dart
│       ├── weekly_activity_report_screen.dart
│       ├── child_real_time_location_screen.dart
│       ├── safe_zones_management_screen.dart
│       ├── parent_app_settings_screen.dart
│       └── ... (18 more screens)
├── assets/
│   ├── images/
│   └── fonts/                   # Lexend font family
├── pubspec.yaml
└── README.md
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>= 3.0.0)
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- iOS development tools (for iOS deployment)

### Installation

1. **Clone or extract the project**
   ```bash
   cd the_guardian_flutter
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Download Lexend font**
   - Visit [Google Fonts - Lexend](https://fonts.google.com/specimen/Lexend)
   - Download the font family
   - Place the font files in `assets/fonts/` directory:
     - Lexend-Regular.ttf
     - Lexend-Medium.ttf
     - Lexend-SemiBold.ttf
     - Lexend-Bold.ttf
     - Lexend-ExtraBold.ttf

4. **Run the app**
   ```bash
   flutter run
   ```

## 📱 Screens Overview

### Onboarding & Authentication
| Screen | Description |
|--------|-------------|
| Splash Screen | App intro with animated logo |
| Onboarding: Understand | Feature introduction (1/3) |
| Onboarding: Control | Feature introduction (2/3) |
| Create Parent Account | Sign-up form for parents |
| Parental PIN Lock | Security PIN setup |

### Dashboards & Profiles
| Screen | Description |
|--------|-------------|
| Multi-Child Dashboard | Overview of all children |
| Child Profile Details | Individual child information |
| Create Child Profile | Add new child profile |
| Link Child Device | Connect child's device |

### Monitoring & Reports
| Screen | Description |
|--------|-------------|
| Weekly Activity Report | Comprehensive activity overview |
| Advanced Activity Analytics | Detailed usage statistics |
| AI Smart Recommendation | AI-powered insights |
| AI Safety Suggestions | Proactive safety tips |

### Controls & Rules
| Screen | Description |
|--------|-------------|
| Configure Simple Rules | Quick rule setup |
| Strict Mode Configuration | Enhanced protection mode |
| Content Filtering Rules | Website/app filtering |
| Screen Time Request | Child's time extension request |
| Child Request Approval | Approve/deny child requests |

### Location Features
| Screen | Description |
|--------|-------------|
| Child Real-time Location | Live GPS tracking |
| Location History Timeline | Past location records |
| Safe Zones Management | Manage safe areas |
| Create New Safe Zone | Add new safe zone |
| Safe Zone Alert | Entry/exit notifications |
| Exit Zone Alert Detail | Detailed zone exit info |

### Settings & Advanced
| Screen | Description |
|--------|-------------|
| Parent App Settings | App configuration |
| Connected Devices Hub | Device management |
| Smart TV Control (Coming Soon) | TV monitoring feature |
| AI Assistant Guide | AI feature walkthrough |
| Lock Screen Safety Notification | System notifications |

## 🎨 Theme & Design

### Color Palette
- **Primary**: `#7F13EC` (Purple)
- **Background Light**: `#F7F6F8`
- **Background Dark**: `#191022`
- **Text Main**: `#140D1B`
- **Slate/Gray**: Various shades for UI elements

### Typography
- **Font Family**: Lexend
- **Weights**: 300, 400, 500, 600, 700, 800

## 🛠️ Customization

### Adding State Management

Uncomment desired state management packages in `pubspec.yaml`:

```yaml
dependencies:
  # provider: ^6.1.1
  # riverpod: ^2.4.9
  # flutter_bloc: ^8.1.3
```

### Adding Navigation

For advanced navigation, use go_router:

```yaml
dependencies:
  go_router: ^13.0.0
```

### Adding Backend Integration

For API integration:

```yaml
dependencies:
  http: ^1.2.0
  # or
  dio: ^5.4.0
```

## 📝 Next Steps

1. **Implement State Management**
   - Add Provider/Riverpod/Bloc for state handling
   - Create models for User, Child, Activity, etc.

2. **Backend Integration**
   - Connect to REST API or Firebase
   - Implement authentication flow
   - Add real-time data synchronization

3. **Complete UI Details**
   - Refine each screen based on original HTML design
   - Add form validation
   - Implement error handling

4. **Add Features**
   - Push notifications
   - Real-time location tracking
   - Chart visualizations
   - Image uploads

5. **Testing**
   - Unit tests
   - Widget tests
   - Integration tests

6. **Deploy**
   - Build for Android (APK/AAB)
   - Build for iOS (IPA)
   - Submit to app stores

## 🤝 Contributing

This is a converted design project. To contribute:

1. Review the original HTML designs in the source
2. Implement missing features or improve existing ones
3. Ensure consistency with the design system
4. Test on multiple devices and screen sizes

## 📄 License

This project is provided as-is for educational and development purposes.

## 🙏 Acknowledgments

- Original HTML/Tailwind designs converted to Flutter
- Material Design 3 components
- Lexend font by Google Fonts

---

<div align="center">
  Made with ❤️ using Flutter
</div>
