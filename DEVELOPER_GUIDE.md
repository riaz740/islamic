# Islamic App - Developer Guide

## Overview
This Islamic app is built using Flutter with GetX state management pattern. It provides comprehensive Islamic features including prayer times, Quran memorization tracking, prayer statistics, and educational content.

## Architecture

### State Management: GetX
The app uses GetX for:
- **State Management**: Reactive state updates with `.obs` observables
- **Dependency Injection**: Controllers are injected using `Get.put()`
- **Navigation**: Bottom navigation controlled by NavigationController

### Controllers

#### 1. NavigationController
- Manages bottom navigation bar state
- Tracks current page index
- Methods: `changeIndex(int index)`

#### 2. HifzController
- Manages Quran memorization data
- Tracks progress for 114 Surahs
- Calculates overall progress (Hifz, Surah, Juz, Ayah)
- Persists data using SharedPreferences
- Methods:
  - `loadSurahs()`: Load saved Surah data
  - `saveSurahs()`: Save Surah data to local storage
  - `updateSurahProgress(int surahNumber, int memorizedAyah)`: Update progress
  - `calculateProgress()`: Calculate overall statistics

#### 3. PrayerController
- Calculates Islamic prayer times using Adhan package
- Tracks daily prayer completion
- Manages prayer history
- Methods:
  - `calculatePrayerTimes()`: Get today's prayer times
  - `updateCurrentAndNextPrayer()`: Determine current/next prayer
  - `togglePrayerCompletion(String prayerName)`: Mark prayer as completed
  - `loadPrayerHistory()`: Load historical prayer data
  - `savePrayerHistory()`: Save prayer completion data

#### 4. TrackerController
- Tracks monthly prayer statistics
- Calculates prayer completion scores
- Manages prayer tracker calendar
- Methods:
  - `loadTrackerHistory()`: Load tracker data
  - `loadCurrentMonth()`: Get current month's data
  - `updatePrayerCount(DateTime date, String prayer, int count)`: Update counts
  - `getOverallScore()`: Calculate average score

#### 5. SettingsController
- Manages app settings and preferences
- Handles theme, language, notifications
- Methods:
  - `toggleTheme()`: Switch between light/dark mode
  - `setLanguage(String language)`: Change app language
  - `setNotificationType(String type)`: Set notification preferences
  - `toggleSyncWidget()`: Enable/disable home widget sync

### Models

#### Surah Model
```dart
class Surah {
  int number;
  String nameArabic;
  String nameEnglish;
  String translation;
  int ayahCount;
  int memorizedAyah;
  DateTime? lastOpened;
}
```

#### PrayerTime Model
```dart
class PrayerTime {
  String name;
  DateTime time;
  bool isCompleted;
}

class DailyPrayers {
  DateTime date;
  List<PrayerTime> prayers;
}
```

#### TrackerData Model
```dart
class TrackerData {
  DateTime date;
  Map<String, int> prayerCounts;
  double allPrayerScore;
  double fajrScore;
  double dhuhrScore;
  double asrScore;
}
```

## Views Structure

### 1. MainView
- Root view with bottom navigation
- Contains 5 main screens
- Navigation items: Home, Tracker, Hifz, Education, Settings

### 2. HomeView
- Displays current time and prayer information
- Shows prayer tracker for today
- Quick action grid (12 features)
- Daily Hadith section

### 3. HifzView
- Quran memorization tracker
- Progress indicators (circular)
- Tabbed interface (Surah/Juz/Ayah)
- Surah list with individual progress

### 4. TrackerView
- Monthly calendar view
- Daily prayer tracker
- Score cards for prayer statistics
- Visual progress indicators

### 5. EducationView
- Grid layout of Islamic educational topics
- 10 learning modules
- Color-coded categories

### 6. SettingsView
- Preferences section (Theme, Language)
- General settings (Location, Hijri, Notifications)
- Misc options (Backup & Restore)

## Data Persistence

### SharedPreferences Keys
- `'surahs'`: JSON string of Surah progress data
- `'prayerHistory'`: JSON string of prayer completion history
- `'trackerHistory'`: JSON string of tracker statistics
- `'isDarkMode'`: Boolean for theme preference
- `'language'`: String for selected language
- `'notificationType'`: String for notification preference
- `'syncHomeWidget'`: Boolean for widget sync

## Color Scheme

### Primary Colors
- Primary: `#00BCD4` (Cyan)
- Primary Dark: `#0097A7`
- Accent: `#4CAF50` (Green)

### Prayer Colors
- Fajr: Purple `#9C27B0`
- Dhuhr: Blue `#2196F3`
- Asr: Orange `#FF9800`
- Maghrib: Pink `#E91E63`
- Isha: Deep Purple `#673AB7`

## Key Dependencies

```yaml
get: ^4.6.6                    # GetX for state management
shared_preferences: ^2.2.2     # Local storage
intl: ^0.19.0                  # Date/time formatting
percent_indicator: ^4.2.3      # Circular progress indicators
fl_chart: ^0.68.0              # Charts and graphs
google_fonts: ^6.1.0           # Poppins font family
adhan: ^2.0.0+1                # Islamic prayer time calculations
```

## Prayer Time Calculation

The app uses the **Adhan** package with:
- **Coordinates**: Default set to Mecca (21.4225, 39.8262)
- **Calculation Method**: Umm al-Qura (Mecca)
- **Five daily prayers**: Fajr, Dhuhr, Asr, Maghrib, Isha

To customize:
```dart
// In prayer_controller.dart
final coordinates = Coordinates(latitude, longitude);
final params = CalculationMethod.muslim_world_league.getParameters();
```

## Adding New Features

### Adding a New Screen
1. Create view file in `lib/views/`
2. Add to MainView's `_pages` list
3. Add navigation item in bottom navigation bar
4. Create controller if needed in `lib/controllers/`

### Adding New Data Model
1. Create model file in `lib/models/`
2. Include `toJson()` and `fromJson()` methods for persistence
3. Update relevant controller to manage the data

### Customizing Prayer Calculation
Edit `PrayerController`:
- Change `coordinates` to your location
- Modify `params` to use different calculation method
- Available methods: `muslim_world_league`, `egyptian`, `karachi`, `umm_al_qura`, etc.

## Best Practices

1. **State Management**: Use `.obs` for reactive variables, wrap UI with `Obx()` for automatic updates
2. **Data Persistence**: Always save data after updates using SharedPreferences
3. **Error Handling**: Add try-catch blocks for async operations
4. **Performance**: Use `ListView.builder` for long lists
5. **Theming**: Use color constants from `utils/constants.dart`

## Testing

```bash
# Run tests
flutter test

# Run with coverage
flutter test --coverage

# Widget tests
flutter test test/widget_test.dart
```

## Future Enhancements

1. **Full Quran Integration**: Add complete Quran text with translations
2. **Audio Features**: Quran recitation and prayer time adhan
3. **Qibla Compass**: Use device sensors for Qibla direction
4. **Advanced Analytics**: More detailed prayer statistics and insights
5. **Cloud Sync**: Backup data to Firebase/cloud
6. **Notifications**: Prayer time reminders with customizable alerts
7. **Multiple Languages**: Add Arabic, Urdu, Turkish, etc.
8. **Widget Support**: Android home screen widget
9. **Offline Mode**: Full functionality without internet
10. **Social Features**: Community prayer tracking, mosque check-ins
