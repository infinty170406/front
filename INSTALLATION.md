# Installation Guide - The Guardian Flutter App

## 📋 Table of Contents
1. [Prerequisites](#prerequisites)
2. [Quick Start](#quick-start)
3. [Detailed Setup](#detailed-setup)
4. [Font Installation](#font-installation)
5. [Running the App](#running-the-app)
6. [Troubleshooting](#troubleshooting)

---

## Prerequisites

Before you begin, ensure you have the following installed:

### Required Software
- **Flutter SDK** (version 3.0.0 or higher)
  - Download from: https://flutter.dev/docs/get-started/install
- **Dart SDK** (comes with Flutter)
- **Git** (for version control)

### IDE (Choose one)
- **Android Studio** (Recommended)
  - Download from: https://developer.android.com/studio
  - Install Flutter and Dart plugins
- **VS Code**
  - Download from: https://code.visualstudio.com/
  - Install Flutter and Dart extensions

### Platform-Specific Requirements

#### For Android Development:
- Android SDK (API level 21 or higher)
- Android Emulator or physical device
- Java Development Kit (JDK 11 or higher)

#### For iOS Development (Mac only):
- Xcode (latest version)
- CocoaPods
- iOS Simulator or physical device
- Valid Apple Developer account (for device testing)

---

## Quick Start

```bash
# 1. Navigate to project directory
cd the_guardian_flutter

# 2. Install dependencies
flutter pub get

# 3. Verify Flutter installation
flutter doctor

# 4. Run the app
flutter run
```

---

## Detailed Setup

### Step 1: Verify Flutter Installation

Open terminal/command prompt and run:

```bash
flutter doctor
```

Expected output should show checkmarks (✓) for:
- Flutter (Channel stable)
- Android toolchain
- Xcode (Mac only)
- Chrome
- Android Studio / VS Code
- Connected device

If you see any [✗] or [!], follow the instructions provided by flutter doctor.

### Step 2: Clone/Extract Project

```bash
# If using git
git clone <repository-url>
cd the_guardian_flutter

# If using extracted files
cd path/to/the_guardian_flutter
```

### Step 3: Install Dependencies

```bash
flutter pub get
```

This command will:
- Download all required packages
- Resolve dependencies
- Generate necessary files

### Step 4: Check Project Structure

Verify your project has the following structure:

```
the_guardian_flutter/
├── lib/
│   ├── main.dart
│   ├── routes.dart
│   ├── theme/
│   │   ├── app_colors.dart
│   │   └── app_theme.dart
│   └── screens/
│       └── (29 screen files)
├── assets/
│   ├── fonts/
│   └── images/
├── pubspec.yaml
└── README.md
```

---

## Font Installation

The app uses the **Lexend** font family. Follow these steps:

### Step 1: Download Lexend Font

1. Visit [Google Fonts - Lexend](https://fonts.google.com/specimen/Lexend)
2. Click "Download family" button
3. Extract the ZIP file

### Step 2: Copy Font Files

Create the fonts directory if it doesn't exist:

```bash
mkdir -p assets/fonts
```

Copy these font files to `assets/fonts/`:
- `Lexend-Regular.ttf` (Weight: 400)
- `Lexend-Medium.ttf` (Weight: 500)
- `Lexend-SemiBold.ttf` (Weight: 600)
- `Lexend-Bold.ttf` (Weight: 700)
- `Lexend-ExtraBold.ttf` (Weight: 800)

### Step 3: Verify Font Configuration

Check that `pubspec.yaml` includes:

```yaml
flutter:
  fonts:
    - family: Lexend
      fonts:
        - asset: assets/fonts/Lexend-Regular.ttf
          weight: 400
        - asset: assets/fonts/Lexend-Medium.ttf
          weight: 500
        - asset: assets/fonts/Lexend-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/Lexend-Bold.ttf
          weight: 700
        - asset: assets/fonts/Lexend-ExtraBold.ttf
          weight: 800
```

### Step 4: Regenerate Assets

```bash
flutter pub get
```

---

## Running the App

### Option 1: Using Command Line

```bash
# List available devices
flutter devices

# Run on specific device
flutter run -d <device-id>

# Run in release mode
flutter run --release

# Run with specific device and route
flutter run -d chrome
```

### Option 2: Using Android Studio

1. Open Android Studio
2. Click "Open an existing project"
3. Navigate to `the_guardian_flutter` folder
4. Wait for Gradle sync to complete
5. Select a device from the device dropdown
6. Click the green "Run" button (▶️)

### Option 3: Using VS Code

1. Open VS Code
2. Open the project folder
3. Press `F5` or click "Run > Start Debugging"
4. Select the target device

---

## Platform-Specific Instructions

### Android

#### Running on Emulator:
```bash
# Start emulator
flutter emulators --launch <emulator-name>

# Run app
flutter run
```

#### Running on Physical Device:
1. Enable USB debugging on your Android device
2. Connect device via USB
3. Run `flutter devices` to verify connection
4. Run `flutter run`

### iOS (Mac only)

#### Running on Simulator:
```bash
# List simulators
xcrun simctl list devices

# Boot simulator
open -a Simulator

# Run app
flutter run
```

#### Running on Physical Device:
1. Connect iPhone/iPad via USB
2. Trust the computer on your device
3. Open Xcode and configure signing
4. Run `flutter run`

### Web

```bash
# Enable web support (if not enabled)
flutter config --enable-web

# Run on Chrome
flutter run -d chrome

# Build for web
flutter build web
```

---

## Building the App

### Android APK
```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release

# Output: build/app/outputs/flutter-apk/app-release.apk
```

### Android App Bundle (for Play Store)
```bash
flutter build appbundle --release

# Output: build/app/outputs/bundle/release/app-release.aab
```

### iOS
```bash
# Build for iOS
flutter build ios --release

# Create archive in Xcode for App Store
```

---

## Troubleshooting

### Common Issues

#### Issue: "Pub get failed"
**Solution:**
```bash
flutter clean
flutter pub get
```

#### Issue: "Font not loading"
**Solution:**
1. Verify font files are in `assets/fonts/`
2. Check `pubspec.yaml` indentation
3. Run `flutter clean && flutter pub get`
4. Restart the app

#### Issue: "Module not found"
**Solution:**
```bash
flutter clean
flutter pub cache repair
flutter pub get
```

#### Issue: "Gradle build failed" (Android)
**Solution:**
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
```

#### Issue: "CocoaPods installation failed" (iOS)
**Solution:**
```bash
cd ios
pod install --repo-update
cd ..
flutter clean
flutter run
```

### Performance Issues

If the app runs slowly:

1. **Run in release mode:**
   ```bash
   flutter run --release
   ```

2. **Enable profile mode:**
   ```bash
   flutter run --profile
   ```

3. **Check for debug statements:**
   - Remove excessive print statements
   - Use `kReleaseMode` checks

### Device Not Detected

**Android:**
```bash
adb devices
adb kill-server
adb start-server
```

**iOS:**
```bash
idevice_id -l
```

---

## Additional Configuration

### State Management

To add state management (Provider example):

1. Add dependency in `pubspec.yaml`:
```yaml
dependencies:
  provider: ^6.1.1
```

2. Run:
```bash
flutter pub get
```

3. Wrap your app:
```dart
import 'package:provider/provider.dart';

runApp(
  MultiProvider(
    providers: [
      // Add your providers here
    ],
    child: const TheGuardianApp(),
  ),
);
```

### API Integration

To add HTTP support:

```yaml
dependencies:
  http: ^1.2.0
  # or
  dio: ^5.4.0
```

---

## Next Steps

After successful installation:

1. ✅ Explore all 29 screens
2. ✅ Review the SCREENS.md documentation
3. ✅ Check README.md for project overview
4. ✅ Customize colors in `lib/theme/app_colors.dart`
5. ✅ Add your backend API endpoints
6. ✅ Implement state management
7. ✅ Add authentication logic
8. ✅ Test on multiple devices

---

## Getting Help

If you encounter issues:

1. Check [Flutter Documentation](https://flutter.dev/docs)
2. Visit [Flutter GitHub Issues](https://github.com/flutter/flutter/issues)
3. Ask on [Stack Overflow](https://stackoverflow.com/questions/tagged/flutter)
4. Join [Flutter Discord](https://discord.gg/flutter)

---

## Version Information

- **Flutter SDK**: >= 3.0.0
- **Dart SDK**: >= 3.0.0
- **App Version**: 1.0.0+1
- **Last Updated**: February 2026

---

Happy coding! 🚀
