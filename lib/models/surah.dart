class Surah {
  final int number;
  final String nameArabic;
  final String nameEnglish;
  final String translation;
  final int ayahCount;
  final int memorizedAyah;
  final DateTime? lastOpened;

  Surah({
    required this.number,
    required this.nameArabic,
    required this.nameEnglish,
    required this.translation,
    required this.ayahCount,
    this.memorizedAyah = 0,
    this.lastOpened,
  });

  double get progressPercentage => (memorizedAyah / ayahCount) * 100;

  Map<String, dynamic> toJson() => {
    'number': number,
    'nameArabic': nameArabic,
    'nameEnglish': nameEnglish,
    'translation': translation,
    'ayahCount': ayahCount,
    'memorizedAyah': memorizedAyah,
    'lastOpened': lastOpened?.toIso8601String(),
  };

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
    number: json['number'],
    nameArabic: json['nameArabic'],
    nameEnglish: json['nameEnglish'],
    translation: json['translation'],
    ayahCount: json['ayahCount'],
    memorizedAyah: json['memorizedAyah'] ?? 0,
    lastOpened: json['lastOpened'] != null
        ? DateTime.parse(json['lastOpened'])
        : null,
  );

  Surah copyWith({
    int? number,
    String? nameArabic,
    String? nameEnglish,
    String? translation,
    int? ayahCount,
    int? memorizedAyah,
    DateTime? lastOpened,
  }) {
    return Surah(
      number: number ?? this.number,
      nameArabic: nameArabic ?? this.nameArabic,
      nameEnglish: nameEnglish ?? this.nameEnglish,
      translation: translation ?? this.translation,
      ayahCount: ayahCount ?? this.ayahCount,
      memorizedAyah: memorizedAyah ?? this.memorizedAyah,
      lastOpened: lastOpened ?? this.lastOpened,
    );
  }
}
