class TrackerData {
  final DateTime date;
  final Map<String, int>
  prayerCounts; // 'fajr', 'dhuhr', 'asr', 'maghrib', 'isha'
  final double allPrayerScore;
  final double fajrScore;
  final double dhuhrScore;
  final double asrScore;

  TrackerData({
    required this.date,
    required this.prayerCounts,
    this.allPrayerScore = 0.0,
    this.fajrScore = 0.0,
    this.dhuhrScore = 0.0,
    this.asrScore = 0.0,
  });

  Map<String, dynamic> toJson() => {
    'date': date.toIso8601String(),
    'prayerCounts': prayerCounts,
    'allPrayerScore': allPrayerScore,
    'fajrScore': fajrScore,
    'dhuhrScore': dhuhrScore,
    'asrScore': asrScore,
  };

  factory TrackerData.fromJson(Map<String, dynamic> json) => TrackerData(
    date: DateTime.parse(json['date']),
    prayerCounts: Map<String, int>.from(json['prayerCounts']),
    allPrayerScore: json['allPrayerScore'] ?? 0.0,
    fajrScore: json['fajrScore'] ?? 0.0,
    dhuhrScore: json['dhuhrScore'] ?? 0.0,
    asrScore: json['asrScore'] ?? 0.0,
  );
}
