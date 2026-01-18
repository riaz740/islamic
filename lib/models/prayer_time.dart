class PrayerTime {
  final String name;
  final DateTime time;
  bool isCompleted;

  PrayerTime({
    required this.name,
    required this.time,
    this.isCompleted = false,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'time': time.toIso8601String(),
    'isCompleted': isCompleted,
  };

  factory PrayerTime.fromJson(Map<String, dynamic> json) => PrayerTime(
    name: json['name'],
    time: DateTime.parse(json['time']),
    isCompleted: json['isCompleted'] ?? false,
  );
}

class DailyPrayers {
  final DateTime date;
  final List<PrayerTime> prayers;

  DailyPrayers({required this.date, required this.prayers});

  int get completedCount => prayers.where((p) => p.isCompleted).length;
  double get completionPercentage => (completedCount / prayers.length) * 100;

  Map<String, dynamic> toJson() => {
    'date': date.toIso8601String(),
    'prayers': prayers.map((p) => p.toJson()).toList(),
  };

  factory DailyPrayers.fromJson(Map<String, dynamic> json) => DailyPrayers(
    date: DateTime.parse(json['date']),
    prayers: (json['prayers'] as List)
        .map((p) => PrayerTime.fromJson(p))
        .toList(),
  );
}
