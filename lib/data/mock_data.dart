class MockData {
  static final List<Map<String, dynamic>> surahs = [
    {
      'number': 1,
      'nameArabic': 'الفاتحة',
      'nameEnglish': 'Al-Fatiha',
      'meaning': 'The Opening',
      'ayahs': [
        'Bismillahir Rahmanir Rahim',
        'Alhamdulillahi Rabbil Alamin',
        'Ar Rahmanir Rahim',
        'Maliki Yawmid Din',
        'Iyyaka Na\'budu wa Iyyaka Nasta\'in',
        'Ihdinas Siratal Mustaqim',
        'Siratal Ladhina An\'amta Alayhim Ghairil Maghdubi Alayhim Walad Dallin',
      ],
      'translation': [
        'In the name of Allah, the Entirely Merciful, the Especially Merciful.',
        '[All] praise is [due] to Allah, Lord of the worlds -',
        'The Entirely Merciful, the Especially Merciful,',
        'Sovereign of the Day of Recompense.',
        'It is You we worship and You we ask for help.',
        'Guide us to the straight path -',
        'The path of those upon whom You have bestowed favor, not of those who have evoked [Your] anger or of those who are astray.',
      ],
    },
    {
      'number': 112,
      'nameArabic': 'الإخلاص',
      'nameEnglish': 'Al-Ikhlas',
      'meaning': 'The Sincerity',
      'ayahs': [
        'Qul Huwa Allahu Ahad',
        'Allahus Samad',
        'Lam Yalid Wa Lam Yulad',
        'Wa Lam Yakun Lahu Kufuwan Ahad',
      ],
      'translation': [
        'Say, "He is Allah, [who is] One,',
        'Allah, the Eternal Refuge.',
        'He neither begets nor is born,',
        'Nor is there to Him any equivalent."',
      ],
    },
    {
      'number': 113,
      'nameArabic': 'الفلق',
      'nameEnglish': 'Al-Falaq',
      'meaning': 'The Daybreak',
      'ayahs': [
        'Qul A\'udhu Bi Rabbil Falaq',
        'Min Sharri Ma Khalaq',
        'Wa Min Sharri Ghasiqin Idhaj Waqab',
        'Wa Min Sharri Naffathati Fil Uqad',
        'Wa Min Sharri Hasidin Idha Hasad',
      ],
      'translation': [
        'Say, "I seek refuge in the Lord of daybreak',
        'From the evil of that which He created',
        'And from the evil of darkness when it settles',
        'And from the evil of the blowers in knots',
        'And from the evil of an envier when he envies."',
      ],
    },
    {
      'number': 114,
      'nameArabic': 'الناس',
      'nameEnglish': 'An-Nas',
      'meaning': 'The Mankind',
      'ayahs': [
        'Qul A\'udhu Bi Rabbin Nas',
        'Malikin Nas',
        'Ilahin Nas',
        'Min Sharril Waswasil Khannas',
        'Alladhi Yuwaswisu Fi Sudurin Nas',
        'Minal Jinnati Wan Nas',
      ],
      'translation': [
        'Say, "I seek refuge in the Lord of mankind,',
        'The Sovereign of mankind,',
        'The God of mankind,',
        'From the evil of the retreating whisperer -',
        'Who whispers [evil] into the breasts of mankind -',
        'From among the jinn and mankind."',
      ],
    },
  ];

  static final List<Map<String, String>> hadiths = [
    {
      'source': 'Sahih Bukhari',
      'text':
          'Actions are judged by intentions, so each man will have what he intended.',
    },
    {
      'source': 'Sahih Muslim',
      'text':
          'He who is not merciful to others, will not be treated mercifully.',
    },
    {
      'source': 'Tirmidhi',
      'text':
          'The best among you is the one who learns the Quran and teaches it.',
    },
    {'source': 'Abu Dawood', 'text': 'Cleanliness is half of faith.'},
    {
      'source': 'Ibn Majah',
      'text':
          'The strong believer is better and more beloved to Allah than the weak believer, while there is good in both.',
    },
    {
      'source': 'Sahih Bukhari',
      'text':
          'None of you will have faith till he loves for his brother what he loves for himself.',
    },
    {
      'source': 'Sahih Muslim',
      'text':
          'He who does not show mercy to our young ones and recognize the rights of our elders is not one of us.',
    },
    {
      'source': 'Tirmidhi',
      'text': 'The best of you is he who is best to his family.',
    },
    {
      'source': 'Ibn Majah',
      'text': 'Seeking knowledge is a duty upon every Muslim.',
    },
    {
      'source': 'Abu Dawood',
      'text':
          'The most perfect believer in respect of faith is he who is best of them in manners.',
    },
    {'source': 'Sahih Bukhari', 'text': 'A good word is a charitable act.'},
    {
      'source': 'Sahih Muslim',
      'text':
          'Do not envy one another, and do not inflate prices for one another, and do not hate one another.',
    },
    {'source': 'Tirmidhi', 'text': 'Fear Allah wherever you are.'},
    {'source': 'Riyad as-Salihin', 'text': 'Patience is illumination.'},
    {
      'source': 'Sahih Bukhari',
      'text': 'The believer is not stung from the same hole twice.',
    },
  ];

  static final List<Map<String, String>> duas = [
    {
      'title': 'Before Eating',
      'arabic': 'بِسْمِ اللَّهِ',
      'transliteration': 'Bismillah',
      'meaning': 'In the name of Allah',
    },
    {
      'title': 'After Eating',
      'arabic':
          'الْحَمْدُ لِلَّهِ الَّذِي أَطْعَمَنَا وَسَقَانَا وَجَعَلَنَا مُسْلِمِينَ',
      'transliteration':
          'Alhamdulillahilladhi at\'amana wa saqana wa ja\'alana muslimin',
      'meaning':
          'All praise is due to Allah who fed us, gave us drink, and made us Muslims',
    },
    {
      'title': 'Leaving Home',
      'arabic':
          'بِسْمِ اللَّهِ تَوَكَّلْتُ عَلَى اللَّهِ، وَلَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ',
      'transliteration':
          'Bismillahi tawakkaltu \'alallahi, wa la hawla wa la quwwata illa billah',
      'meaning':
          'In the name of Allah, I rely on Allah, and there is no power nor strength except through Allah',
    },
    {
      'title': 'Entering Mosque',
      'arabic': 'اللَّهُمَّ افْتَحْ لِي أَبْوَابَ رَحْمَتِكَ',
      'transliteration': 'Allahumma iftah li abwaba rahmatik',
      'meaning': 'O Allah, open the gates of Your mercy for me',
    },
    {
      'title': 'Leaving Mosque',
      'arabic': 'اللَّهُمَّ إِنِّي أَسْأَلُكَ مِنْ فَضْلِكَ',
      'transliteration': 'Allahumma inni as-aluka min fadlik',
      'meaning': 'O Allah, I ask You for Your bounty',
    },
    {
      'title': 'Before Sleep',
      'arabic': 'بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا',
      'transliteration': 'Bismika Allahumma amutu wa ahya',
      'meaning': 'In Your Name, O Allah, I die and I live',
    },
    {
      'title': 'Waking Up',
      'arabic':
          'الْحَمْدُ لِلَّهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ',
      'transliteration':
          'Alhamdu lillahil-ladhi ahyana ba\'da ma amatana wa ilaihin-nushur',
      'meaning':
          'All praise is due to Allah who gave us life after having given us death and unto Him is the resurrection',
    },
    {
      'title': 'Entering Toilet',
      'arabic': 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْخُبُثِ وَالْخَبَائِثِ',
      'transliteration':
          'Allahumma inni a\'udhu bika minal-khubuthi wal-khaba\'ith',
      'meaning':
          'O Allah, I seek refuge with You from all evil and wicked things',
    },
    {
      'title': 'Leaving Toilet',
      'arabic': 'غُفْرَانَكَ',
      'transliteration': 'Ghufranak',
      'meaning': 'I ask Your forgiveness',
    },
    {
      'title': 'For Parents',
      'arabic': 'رَبِّ ارْحَمْهُمَا كَمَا رَبَّيَانِي صَغِيرًا',
      'transliteration': 'Rabbi irhamhuma kama rabbayani saghira',
      'meaning':
          'My Lord, have mercy upon them as they brought me up [when I was] small',
    },
    {
      'title': 'For Knowledge',
      'arabic': 'رَبِّ زِدْنِي عِلْمًا',
      'transliteration': 'Rabbi zidni \'ilma',
      'meaning': 'My Lord, increase me in knowledge',
    },
    {
      'title': 'For Forgiveness',
      'arabic':
          'رَبَّنَا ظَلَمْنَا أَنفُسَنَا وَإِن لَّمْ تَغْفِرْ لَنَا وَتَرْحَمْنَا لَنَكُونَنَّ مِنَ الْخَاسِرِينَ',
      'transliteration':
          'Rabbana zalamna anfusana wa in lam taghfir lana wa tarhamna lanakunanna minal-khasirin',
      'meaning':
          'Our Lord, we have wronged ourselves, and if You do not forgive us and have mercy upon us, we will surely be among the losers',
    },
  ];

  static final List<Map<String, dynamic>> educationContent = [
    {
      'title': 'Asma Ul Husna',
      'description': 'The 99 Names of Allah',
      'content':
          '1. Ar-Rahman (The Beneficent)\n2. Ar-Rahim (The Merciful)\n3. Al-Malik (The King)\n4. Al-Quddus (The Most Holy)\n5. As-Salam (The Source of Peace)\n6. Al-Mu\'min (The Guardian of Faith)\n7. Al-Muhaymin (The Protector)\n8. Al-Aziz (The Mighty)\n9. Al-Jabbar (The Compeller)\n10. Al-Mutakabbir (The Majestic)\n...',
    },
    {
      'title': 'Ayatul Kursi',
      'description': 'The Verse of the Throne',
      'content':
          'Allahu la ilaha illa Huwal Hayyul Qayyum.\nLa ta\'khudhuhu sinatun wa la nawm.\nLahu ma fis samawati wa ma fil ard.\nMan dhal ladhi yashfa\'u indahu illa bi idhnih.\nYa\'lamu ma bayna aydihim wa ma khalfahum.\nWa la yuhituna bi shay\'im min ilmihi illa bi ma sha\'.\nWasi\'a kursiyyuhus samawati wal ard.\nWa la ya\'uduhu hifzuhuma.\nWa Huwal Aliyyul Azim.',
    },
    {
      'title': 'Shahadah',
      'description': 'The First Pillar of Islam',
      'content':
          'Ash-hadu an la ilaha illa Allah, wa ash-hadu anna Muhammadan rasul Allah.\n\n"I bear witness that there is no god but Allah, and I bear witness that Muhammad is the messenger of Allah."',
    },
    {
      'title': 'Salah',
      'description': 'The Second Pillar of Islam',
      'content':
          'Steps of Prayer:\n1. Niyyah (Intention)\n2. Takbiratul Ihram (Allahu Akbar)\n3. Qiyam (Standing & Reciting Surah Fatiha)\n4. Ruku (Bowing)\n5. I\'tidal (Rising from Ruku)\n6. Sujud (Prostration)\n7. Jalsa (Sitting between Sujud)\n8. Tashahhud (Sitting & Reciting Attahiyat)\n9. Salam (Ending the prayer)',
    },
    {
      'title': 'Sunnah',
      'description': 'Practices of Prophet Muhammad (PBUH)',
      'content':
          '1. Sleeping on the right side\n2. Using Miswak\n3. Saying Bismillah before eating\n4. Entering house with right foot\n5. Smiling at others\n6. Visiting the sick\n7. Giving charity',
    },
    {
      'title': 'Ablution',
      'description': 'Steps of Wudu',
      'content':
          '1. Niyyah (Intention)\n2. Saying Bismillah\n3. Washing hands up to wrists (3 times)\n4. Rinsing mouth (3 times)\n5. Sniffing water into nose (3 times)\n6. Washing face (3 times)\n7. Washing arms up to elbows (3 times)\n8. Wiping head (Masah)\n9. Washing feet up to ankles (3 times)',
    },
    {
      'title': 'Prayer Rakats',
      'description': 'Rakats for 5 Daily Prayers',
      'content':
          'Fajr: 2 Sunnah, 2 Fard\n\nDhuhr: 4 Sunnah, 4 Fard, 2 Sunnah, 2 Nafl\n\nAsr: 4 Sunnah, 4 Fard\n\nMaghrib: 3 Fard, 2 Sunnah, 2 Nafl\n\nIsha: 4 Sunnah, 4 Fard, 2 Sunnah, 2 Nafl, 3 Witr, 2 Nafl',
    },
    {
      'title': 'Printed Quran',
      'description': 'Etiquette of handling Quran',
      'content':
          '1. Being in a state of Wudu\n2. Placing it in a clean, high place\n3. Not putting anything on top of it\n4. Holding it with respect\n5. Reciting properly (Tajweed)',
    },
    {
      'title': 'Zakat',
      'description': 'The Third Pillar of Islam',
      'content':
          'Zakat is mandatory charity given to the poor.\n\nRate: 2.5% of total wealth held for a lunar year.\n\nNisab (Threshold):\n- Gold: 87.48 grams\n- Silver: 612.36 grams',
    },
    {
      'title': 'Hajj',
      'description': 'The Fifth Pillar of Islam',
      'content':
          'Hajj is the pilgrimage to Mecca, mandatory once in a lifetime for those who are able.\n\nKey Rituals:\n1. Ihram\n2. Tawaf (Circling Kaaba)\n3. Sa\'i (Walking between Safa and Marwa)\n4. Staying at Arafat\n5. Stoning the Jamarat\n6. Animal Sacrifice (Qurbani)',
    },
  ];

  static final Map<String, String> ayatulKursiData = {
    'arabic':
        'اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ ۚ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ ۚ لَهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ ۗ مَنْ ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلَّا بِإِذْنِهِ ۚ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ ۖ وَلَا يُحِيطُونَ بِشَيْءٍ مِنْ عِلْمِهِ إِلَّا بِمَا شَاءَ ۚ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ ۖ وَلَا يَئُودُهُ حِفْظُهُمَا ۚ وَهُوَ الْعَلِيُّ الْعَظِيمُ',
    'transliteration':
        'Allahu la ilaha illa Huwal Hayyul Qayyum.\nLa ta\'khudhuhu sinatun wa la nawm.\nLahu ma fis samawati wa ma fil ard.\nMan dhal ladhi yashfa\'u indahu illa bi idhnih.\nYa\'lamu ma bayna aydihim wa ma khalfahum.\nWa la yuhituna bi shay\'im min ilmihi illa bi ma sha\'.\nWasi\'a kursiyyuhus samawati wal ard.\nWa la ya\'uduhu hifzuhuma.\nWa Huwal Aliyyul Azim.',
    'translation':
        'Allah - there is no deity except Him, the Ever-Living, the Sustainer of [all] existence. Neither drowsiness overtakes Him nor sleep. To Him belongs whatever is in the heavens and whatever is on the earth. Who is it that can intercede with Him except by His permission? He knows what is [presently] before them and what will be after them, and they encompass not a thing of His knowledge except for what He wills. His Kursi extends over the heavens and the earth, and their preservation tires Him not. And He is the Most High, the Most Great.',
  };

  static final List<Map<String, String>> asmaUlHusnaList = [
    {
      'number': '1',
      'arabic': 'الرَّحْمَنُ',
      'transliteration': 'Ar-Rahman',
      'meaning': 'The Beneficent',
    },
    {
      'number': '2',
      'arabic': 'الرَّحِيمُ',
      'transliteration': 'Ar-Rahim',
      'meaning': 'The Merciful',
    },
    {
      'number': '3',
      'arabic': 'الْمَلِكُ',
      'transliteration': 'Al-Malik',
      'meaning': 'The King',
    },
    {
      'number': '4',
      'arabic': 'الْقُدُّوسُ',
      'transliteration': 'Al-Quddus',
      'meaning': 'The Most Holy',
    },
    {
      'number': '5',
      'arabic': 'السَّلَامُ',
      'transliteration': 'As-Salam',
      'meaning': 'The Source of Peace',
    },
    {
      'number': '6',
      'arabic': 'الْمُؤْمِنُ',
      'transliteration': 'Al-Mu\'min',
      'meaning': 'The Guardian of Faith',
    },
    {
      'number': '7',
      'arabic': 'الْمُهَيْمِنُ',
      'transliteration': 'Al-Muhaymin',
      'meaning': 'The Protector',
    },
    {
      'number': '8',
      'arabic': 'الْعَزِيزُ',
      'transliteration': 'Al-Aziz',
      'meaning': 'The Mighty',
    },
    {
      'number': '9',
      'arabic': 'الْجَبَّارُ',
      'transliteration': 'Al-Jabbar',
      'meaning': 'The Compeller',
    },
    {
      'number': '10',
      'arabic': 'الْمُتَكَبِّرُ',
      'transliteration': 'Al-Mutakabbir',
      'meaning': 'The Majestic',
    },
    {
      'number': '11',
      'arabic': 'الْخَالِقُ',
      'transliteration': 'Al-Khaliq',
      'meaning': 'The Creator',
    },
    {
      'number': '12',
      'arabic': 'الْبَارِئُ',
      'transliteration': 'Al-Bari',
      'meaning': 'The Evolver',
    },
    {
      'number': '13',
      'arabic': 'الْمُصَوِّرُ',
      'transliteration': 'Al-Musawwir',
      'meaning': 'The Fashioner',
    },
    {
      'number': '14',
      'arabic': 'الْغَفَّارُ',
      'transliteration': 'Al-Ghaffar',
      'meaning': 'The Forgiver',
    },
    {
      'number': '15',
      'arabic': 'الْقَهَّارُ',
      'transliteration': 'Al-Qahhar',
      'meaning': 'The Subduer',
    },
    {
      'number': '16',
      'arabic': 'الْوَهَّابُ',
      'transliteration': 'Al-Wahhab',
      'meaning': 'The Bestower',
    },
    {
      'number': '17',
      'arabic': 'الرَّزَّاقُ',
      'transliteration': 'Ar-Razzaq',
      'meaning': 'The Provider',
    },
    {
      'number': '18',
      'arabic': 'الْفَتَّاحُ',
      'transliteration': 'Al-Fattah',
      'meaning': 'The Opener',
    },
    {
      'number': '19',
      'arabic': 'الْعَلِيمُ',
      'transliteration': 'Al-Alim',
      'meaning': 'The All-Knowing',
    },
    {
      'number': '20',
      'arabic': 'الْقَابِضُ',
      'transliteration': 'Al-Qabid',
      'meaning': 'The Withholder',
    },
    {
      'number': '21',
      'arabic': 'الْبَاسِطُ',
      'transliteration': 'Al-Basit',
      'meaning': 'The Expander',
    },
    {
      'number': '22',
      'arabic': 'الْخَافِضُ',
      'transliteration': 'Al-Khafid',
      'meaning': 'The Abaser',
    },
    {
      'number': '23',
      'arabic': 'الرَّافِعُ',
      'transliteration': 'Ar-Rafi',
      'meaning': 'The Exalter',
    },
    {
      'number': '24',
      'arabic': 'الْمُعِزُّ',
      'transliteration': 'Al-Mu\'izz',
      'meaning': 'The Giver of Honour',
    },
    {
      'number': '25',
      'arabic': 'الْمُذِلُّ',
      'transliteration': 'Al-Mudhill',
      'meaning': 'The Giver of Dishonour',
    },
    {
      'number': '26',
      'arabic': 'السَّمِيعُ',
      'transliteration': 'As-Sami',
      'meaning': 'The All-Hearing',
    },
    {
      'number': '27',
      'arabic': 'الْبَصِيرُ',
      'transliteration': 'Al-Basir',
      'meaning': 'The All-Seeing',
    },
    {
      'number': '28',
      'arabic': 'الْحَكَمُ',
      'transliteration': 'Al-Hakam',
      'meaning': 'The Judge',
    },
    {
      'number': '29',
      'arabic': 'الْعَدْلُ',
      'transliteration': 'Al-Adl',
      'meaning': 'The Just',
    },
    {
      'number': '30',
      'arabic': 'اللَّطِيفُ',
      'transliteration': 'Al-Latif',
      'meaning': 'The Subtle One',
    },
    {
      'number': '31',
      'arabic': 'الْخَبِيرُ',
      'transliteration': 'Al-Khabir',
      'meaning': 'The All-Aware',
    },
    {
      'number': '32',
      'arabic': 'الْحَلِيمُ',
      'transliteration': 'Al-Halim',
      'meaning': 'The Forbearing',
    },
    {
      'number': '33',
      'arabic': 'الْعَظِيمُ',
      'transliteration': 'Al-Azim',
      'meaning': 'The Magnificent',
    },
    {
      'number': '34',
      'arabic': 'الْغَفُورُ',
      'transliteration': 'Al-Ghafur',
      'meaning': 'The Forgiver',
    },
    {
      'number': '35',
      'arabic': 'الشَّكُورُ',
      'transliteration': 'Ash-Shakur',
      'meaning': 'The Appreciative',
    },
    {
      'number': '36',
      'arabic': 'الْعَلِيُّ',
      'transliteration': 'Al-Ali',
      'meaning': 'The Highest',
    },
    {
      'number': '37',
      'arabic': 'الْكَبِيرُ',
      'transliteration': 'Al-Kabir',
      'meaning': 'The Greatest',
    },
    {
      'number': '38',
      'arabic': 'الْحَفِيظُ',
      'transliteration': 'Al-Hafiz',
      'meaning': 'The Preserver',
    },
    {
      'number': '39',
      'arabic': 'الْمُقِيتُ',
      'transliteration': 'Al-Muqit',
      'meaning': 'The Sustainer',
    },
    {
      'number': '40',
      'arabic': 'الْحَسِيبُ',
      'transliteration': 'Al-Hasib',
      'meaning': 'The Reckoner',
    },
    {
      'number': '41',
      'arabic': 'الْجَلِيلُ',
      'transliteration': 'Al-Jalil',
      'meaning': 'The Majestic',
    },
    {
      'number': '42',
      'arabic': 'الْكَرِيمُ',
      'transliteration': 'Al-Karim',
      'meaning': 'The Generous',
    },
    {
      'number': '43',
      'arabic': 'الرَّقِيبُ',
      'transliteration': 'Ar-Raqib',
      'meaning': 'The Watchful',
    },
    {
      'number': '44',
      'arabic': 'الْمُجِيبُ',
      'transliteration': 'Al-Mujib',
      'meaning': 'The Responsive',
    },
    {
      'number': '45',
      'arabic': 'الْوَاسِعُ',
      'transliteration': 'Al-Wasi',
      'meaning': 'The All-Encompassing',
    },
    {
      'number': '46',
      'arabic': 'الْحَكِيمُ',
      'transliteration': 'Al-Hakim',
      'meaning': 'The Wise',
    },
    {
      'number': '47',
      'arabic': 'الْوَدُودُ',
      'transliteration': 'Al-Wadud',
      'meaning': 'The Loving',
    },
    {
      'number': '48',
      'arabic': 'الْمَجِيدُ',
      'transliteration': 'Al-Majid',
      'meaning': 'The Glorious',
    },
    {
      'number': '49',
      'arabic': 'الْبَاعِثُ',
      'transliteration': 'Al-Ba\'ith',
      'meaning': 'The Resurrector',
    },
    {
      'number': '50',
      'arabic': 'الشَّهِيدُ',
      'transliteration': 'Ash-Shahid',
      'meaning': 'The Witness',
    },
    {
      'number': '51',
      'arabic': 'الْحَقُّ',
      'transliteration': 'Al-Haqq',
      'meaning': 'The Truth',
    },
    {
      'number': '52',
      'arabic': 'الْوَكِيلُ',
      'transliteration': 'Al-Wakil',
      'meaning': 'The Trustee',
    },
    {
      'number': '53',
      'arabic': 'الْقَوِيُّ',
      'transliteration': 'Al-Qawiyy',
      'meaning': 'The Strong',
    },
    {
      'number': '54',
      'arabic': 'الْمَتِينُ',
      'transliteration': 'Al-Matin',
      'meaning': 'The Firm',
    },
    {
      'number': '55',
      'arabic': 'الْوَلِيُّ',
      'transliteration': 'Al-Wali',
      'meaning': 'The Protecting Friend',
    },
    {
      'number': '56',
      'arabic': 'الْحَمِيدُ',
      'transliteration': 'Al-Hamid',
      'meaning': 'The Praiseworthy',
    },
    {
      'number': '57',
      'arabic': 'الْمُحْصِي',
      'transliteration': 'Al-Muhsi',
      'meaning': 'The Accounter',
    },
    {
      'number': '58',
      'arabic': 'الْمُبْدِئُ',
      'transliteration': 'Al-Mubdi',
      'meaning': 'The Originator',
    },
    {
      'number': '59',
      'arabic': 'الْمُعِيدُ',
      'transliteration': 'Al-Mu\'id',
      'meaning': 'The Restorer',
    },
    {
      'number': '60',
      'arabic': 'الْمُحْيِي',
      'transliteration': 'Al-Muhyi',
      'meaning': 'The Giver of Life',
    },
    {
      'number': '61',
      'arabic': 'الْمُمِيتُ',
      'transliteration': 'Al-Mumit',
      'meaning': 'The Taker of Life',
    },
    {
      'number': '62',
      'arabic': 'الْحَيُّ',
      'transliteration': 'Al-Hayy',
      'meaning': 'The Ever-Living',
    },
    {
      'number': '63',
      'arabic': 'الْقَيُّومُ',
      'transliteration': 'Al-Qayyum',
      'meaning': 'The Self-Subsisting',
    },
    {
      'number': '64',
      'arabic': 'الْوَاجِدُ',
      'transliteration': 'Al-Wajid',
      'meaning': 'The Finder',
    },
    {
      'number': '65',
      'arabic': 'الْمَاجِدُ',
      'transliteration': 'Al-Majid',
      'meaning': 'The Noble',
    },
    {
      'number': '66',
      'arabic': 'الْوَاحِدُ',
      'transliteration': 'Al-Wahid',
      'meaning': 'The Unique',
    },
    {
      'number': '67',
      'arabic': 'الْأَحَدُ',
      'transliteration': 'Al-Ahad',
      'meaning': 'The One',
    },
    {
      'number': '68',
      'arabic': 'الصَّمَدُ',
      'transliteration': 'As-Samad',
      'meaning': 'The Eternal',
    },
    {
      'number': '69',
      'arabic': 'الْقَادِرُ',
      'transliteration': 'Al-Qadir',
      'meaning': 'The Able',
    },
    {
      'number': '70',
      'arabic': 'الْمُقْتَدِرُ',
      'transliteration': 'Al-Muqtadir',
      'meaning': 'The Powerful',
    },
    {
      'number': '71',
      'arabic': 'الْمُقَدِّمُ',
      'transliteration': 'Al-Muqaddim',
      'meaning': 'The Expediter',
    },
    {
      'number': '72',
      'arabic': 'الْمُؤَخِّرُ',
      'transliteration': 'Al-Mu\'akhkhir',
      'meaning': 'The Delayer',
    },
    {
      'number': '73',
      'arabic': 'الْأَوَّلُ',
      'transliteration': 'Al-Awwal',
      'meaning': 'The First',
    },
    {
      'number': '74',
      'arabic': 'الْآخِرُ',
      'transliteration': 'Al-Akhir',
      'meaning': 'The Last',
    },
    {
      'number': '75',
      'arabic': 'الظَّاهِرُ',
      'transliteration': 'Az-Zahir',
      'meaning': 'The Manifest',
    },
    {
      'number': '76',
      'arabic': 'الْبَاطِنُ',
      'transliteration': 'Al-Batin',
      'meaning': 'The Hidden',
    },
    {
      'number': '77',
      'arabic': 'الْوَالِي',
      'transliteration': 'Al-Wali',
      'meaning': 'The Governor',
    },
    {
      'number': '78',
      'arabic': 'الْمُتَعَالِي',
      'transliteration': 'Al-Muta\'ali',
      'meaning': 'The Most Exalted',
    },
    {
      'number': '79',
      'arabic': 'الْبَرُّ',
      'transliteration': 'Al-Barr',
      'meaning': 'The Source of Goodness',
    },
    {
      'number': '80',
      'arabic': 'التَّوَّابُ',
      'transliteration': 'At-Tawwab',
      'meaning': 'The Acceptor of Repentance',
    },
    {
      'number': '81',
      'arabic': 'الْمُنْتَقِمُ',
      'transliteration': 'Al-Muntaqim',
      'meaning': 'The Avenger',
    },
    {
      'number': '82',
      'arabic': 'الْعَفُوُّ',
      'transliteration': 'Al-Afu',
      'meaning': 'The Pardoner',
    },
    {
      'number': '83',
      'arabic': 'الرَّؤُوفُ',
      'transliteration': 'Ar-Ra\'uf',
      'meaning': 'The Compassionate',
    },
    {
      'number': '84',
      'arabic': 'مَالِكُ الْمُلْكِ',
      'transliteration': 'Malik-ul-Mulk',
      'meaning': 'The Master of Sovereignty',
    },
    {
      'number': '85',
      'arabic': 'ذُو الْجَلَالِ وَالْإِكْرَامِ',
      'transliteration': 'Dhul-Jalal wal-Ikram',
      'meaning': 'The Lord of Majesty and Generosity',
    },
    {
      'number': '86',
      'arabic': 'الْمُقْسِطُ',
      'transliteration': 'Al-Muqsit',
      'meaning': 'The Equitable',
    },
    {
      'number': '87',
      'arabic': 'الْجَامِعُ',
      'transliteration': 'Al-Jami',
      'meaning': 'The Gatherer',
    },
    {
      'number': '88',
      'arabic': 'الْغَنِيُّ',
      'transliteration': 'Al-Ghani',
      'meaning': 'The Self-Sufficient',
    },
    {
      'number': '89',
      'arabic': 'الْمُغْنِي',
      'transliteration': 'Al-Mughni',
      'meaning': 'The Enricher',
    },
    {
      'number': '90',
      'arabic': 'الْمَانِعُ',
      'transliteration': 'Al-Mani',
      'meaning': 'The Withholder',
    },
    {
      'number': '91',
      'arabic': 'الضَّارُّ',
      'transliteration': 'Ad-Darr',
      'meaning': 'The Distresser',
    },
    {
      'number': '92',
      'arabic': 'النَّافِعُ',
      'transliteration': 'An-Nafi',
      'meaning': 'The Propitious',
    },
    {
      'number': '93',
      'arabic': 'النُّورُ',
      'transliteration': 'An-Nur',
      'meaning': 'The Light',
    },
    {
      'number': '94',
      'arabic': 'الْهَادِي',
      'transliteration': 'Al-Hadi',
      'meaning': 'The Guide',
    },
    {
      'number': '95',
      'arabic': 'الْبَدِيعُ',
      'transliteration': 'Al-Badi',
      'meaning': 'The Incomparable',
    },
    {
      'number': '96',
      'arabic': 'الْبَاقِي',
      'transliteration': 'Al-Baqi',
      'meaning': 'The Everlasting',
    },
    {
      'number': '97',
      'arabic': 'الْوَارِثُ',
      'transliteration': 'Al-Warith',
      'meaning': 'The Inheritor',
    },
    {
      'number': '98',
      'arabic': 'الرَّشِيدُ',
      'transliteration': 'Ar-Rashid',
      'meaning': 'The Guide to the Right Path',
    },
    {
      'number': '99',
      'arabic': 'الصَّبُورُ',
      'transliteration': 'As-Sabur',
      'meaning': 'The Patient',
    },
  ];
}
