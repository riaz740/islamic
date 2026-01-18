I will upgrade the Islamic App to be fully functional, replacing mock data and hardcoded values with real implementations and robust features.

### 1. Dependencies & Configuration
- **Add Packages**:
  - `geolocator`: For real-time user location (Prayer Times).
  - `permission_handler`: To manage location permissions.
  - `quran`: To provide the full text of the Quran (114 Surahs) instead of just 4.
  - `flutter_qiblah`: To provide real Qibla direction using device sensors.
- **Update AndroidManifest**: Add necessary permissions for location and sensors.

### 2. Feature Implementation
#### A. Prayer Times (Real Location)
- **Update `PrayerController`**:
  - Remove hardcoded coordinates (Dhaka).
  - Implement `determinePosition()` to fetch the user's actual GPS location.
  - Add error handling for location services (denied/disabled) with a fallback.

#### B. Full Quran (114 Surahs)
- **Rewrite `QuranView` & `SurahDetailView`**:
  - Replace `MockData` with the `quran` package.
  - Implement a full list of 114 Surahs.
  - Display full Arabic text for every Surah.
  - *Note*: Translation might be limited to what the package offers or we keep the mock translations for the first few and show just Arabic for the rest, or finding a way to map translations. *Correction*: The `quran` package mainly gives Arabic. I will try to map English names and details correctly.

#### C. Qibla Direction (Real Sensors)
- **Rewrite `QiblaView`**:
  - Replace the "Simulation Mode" with `flutter_qiblah` widget.
  - Show a real compass arrow pointing to Makkah.
  - Add a loading state and error state (e.g., for devices without sensors).

#### D. Tasbih (Persistence)
- **Update `TasbihController`**:
  - Implement `saveCount()` and `loadCount()` using `SharedPreferences`.
  - Ensure the counter value is remembered even after closing the app.

#### E. Zakat Calculator (Enhanced)
- **Update `ZakatController`**:
  - Add a "Reset" button.
  - Ensure the calculation logic uses the correct inputs.

#### F. Content Expansion
- **Expand `MockData`**:
  - Add more **Hadiths** (from 5 to ~20).
  - Add more **Duas** (from 4 to ~15 covering daily activities).
  - Ensure all Education modules have rich text content.

### 3. Verification
- Verify that `PrayerController` requests location.
- Verify `QuranView` lists all 114 Surahs.
- Verify `Tasbih` saves the count.
- Verify `Qibla` attempts to initialize sensors.

This plan ensures no feature is left as a "mock" or "placeholder", fulfilling the requirement "konota jate bad na jai".