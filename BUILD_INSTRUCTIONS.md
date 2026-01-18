# 🚀 Build & Run Instructions

## Quick Start

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Run the App

#### On Android Device/Emulator
```bash
flutter run
```

#### On Windows (for testing)
```bash
flutter run -d windows
```

#### List Available Devices
```bash
flutter devices
```

### 3. Build APK for Android

#### Debug APK (for testing)
```bash
flutter build apk --debug
```

#### Release APK (for distribution)
```bash
flutter build apk --release
```

The APK will be located at:
`build/app/outputs/flutter-apk/app-release.apk`

#### App Bundle (for Google Play Store)
```bash
flutter build appbundle --release
```

## Common Issues & Solutions

### Issue 1: Gradle Build Errors
**Solution:**
```bash
flutter clean
flutter pub get
flutter run
```

### Issue 2: SDK Version Mismatch
**Solution:**
Update `android/app/build.gradle.kts`:
```kotlin
android {
    compileSdk = 34
    defaultConfig {
        minSdk = 21
        targetSdk = 34
    }
}
```

### Issue 3: Package Import Errors
**Solution:**
```bash
flutter pub cache clean
flutter pub get
```

### Issue 4: Android Device Not Detected
**Solutions:**
- Enable USB Debugging on Android device
- Install ADB drivers
- Run: `flutter doctor`
- Check: `adb devices`

### Issue 5: Build Cache Problems
**Solution:**
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
```

## Development Workflow

### 1. Hot Reload
While app is running, press `r` in terminal for hot reload

### 2. Hot Restart
While app is running, press `R` for full restart

### 3. Quit App
Press `q` in terminal

### 4. Run with Verbose Output
```bash
flutter run -v
```

## Building for Release

### Step-by-Step Release Build

1. **Update Version**
   Edit `pubspec.yaml`:
   ```yaml
   version: 1.0.0+1
   ```

2. **Create Keystore** (first time only)
   ```bash
   keytool -genkey -v -keystore islamic-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias islamic
   ```

3. **Configure Signing**
   Create `android/key.properties`:
   ```properties
   storePassword=<your-password>
   keyPassword=<your-password>
   keyAlias=islamic
   storeFile=<path-to-keystore>/islamic-release-key.jks
   ```

4. **Update build.gradle.kts**
   The signing configuration is already set up in the project.

5. **Build Release APK**
   ```bash
   flutter build apk --release
   ```

6. **Build App Bundle** (recommended for Play Store)
   ```bash
   flutter build appbundle --release
   ```

## Testing

### Run Tests
```bash
flutter test
```

### Run with Coverage
```bash
flutter test --coverage
```

### Analyze Code
```bash
flutter analyze
```

## Performance Profiling

### Build Profile Version
```bash
flutter build apk --profile
flutter run --profile
```

### Check App Size
```bash
flutter build apk --analyze-size
```

## Environment Setup Check

### Check Flutter Installation
```bash
flutter doctor
```

Should show:
- ✓ Flutter (Channel stable)
- ✓ Android toolchain
- ✓ Connected device (if running on device)

### Upgrade Flutter
```bash
flutter upgrade
```

## Running on Specific Device

### List Devices
```bash
flutter devices
```

### Run on Specific Device
```bash
flutter run -d <device-id>
```

## Build Variants

### Debug Build
```bash
flutter run --debug
```

### Profile Build (for performance testing)
```bash
flutter run --profile
```

### Release Build
```bash
flutter run --release
```

## Troubleshooting Commands

### Clear Everything and Rebuild
```bash
flutter clean
cd android
./gradlew clean
cd ..
flutter pub cache clean
flutter pub get
flutter run
```

### Check Dependencies
```bash
flutter pub outdated
flutter pub upgrade
```

### Fix Pub Cache
```bash
flutter pub cache repair
```

## Deployment Checklist

- [ ] Update version in `pubspec.yaml`
- [ ] Test on multiple Android versions
- [ ] Test on different screen sizes
- [ ] Build release APK/bundle
- [ ] Test release build on device
- [ ] Create app icons (if needed)
- [ ] Update app name (if needed)
- [ ] Sign APK with keystore
- [ ] Test signed APK
- [ ] Prepare Play Store listing (if publishing)

## Notes

- **Minimum Android Version**: Android 5.0 (API 21)
- **Target Android Version**: Latest (API 34)
- **Flutter SDK**: 3.9.2 or higher
- **Dart SDK**: Included with Flutter

## Support

For issues:
1. Check error messages carefully
2. Run `flutter doctor` to check environment
3. Try `flutter clean` and rebuild
4. Check GitHub issues for similar problems
5. Review Flutter documentation

## Success Indicators

App is ready when:
✅ `flutter pub get` completes successfully
✅ `flutter analyze` shows no issues
✅ `flutter run` launches app without errors
✅ All 5 screens are accessible via bottom navigation
✅ Data persists after app restart
✅ No console errors during navigation

---

**Ready to build and deploy your Islamic app! 🎉**
