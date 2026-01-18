# Islamic App

A comprehensive Islamic app built with Flutter and GetX for Android, featuring prayer times, Quran memorization tracking, prayer statistics, Islamic education, and more.

## Features

### 1. Home Screen (Today)
- Real-time prayer times display
- Current and next prayer indication
- Prayer tracker with visual indicators
- Quick access to Islamic features (Prayer Time, Al-Qur'an, Hadith, Dua, Qibla, Tasbih, Zakat, etc.)
- Daily Hadith section

### 2. Hifz (Quran Memorizer)
- Track Quran memorization progress for all 114 Surahs
- Progress tracking by Surah, Juz, and Ayah
- Individual Surah progress visualization
- Search functionality

### 3. Tracker Score
- Monthly prayer calendar
- Daily prayer completion tracking
- Visual score cards for all prayers
- Prayer statistics and analytics

### 4. Deen Education
- Islamic learning modules (Asma Ul Husna, Ayatul Kursi, Sunnah, Prayer, 5 Pillars of Islam, etc.)

### 5. Settings
- Theme customization
- Language selection
- Prayer calculation settings
- Backup & Restore

## Installation & Running

```bash
# Install dependencies
flutter pub get

# Run the app
flutter run

# Build for Android
flutter build apk --release
```

## Tech Stack
- Flutter & GetX (State Management)
- SharedPreferences (Local Storage)
- Adhan (Prayer Times)
- Google Fonts, Percent Indicator, FL Chart

## Project Structure
```
lib/
├── main.dart
├── controllers/      # GetX controllers
├── views/           # UI screens
├── models/          # Data models
├── data/            # Static data
└── utils/           # Utilities
```

## About
This app developed for my project in University under industrial field work course.
