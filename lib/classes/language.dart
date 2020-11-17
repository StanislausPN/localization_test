import 'package:flutter/widgets.dart';

class Language {
  final int id;
  final String name;
  final String languageCode;

  Language(this.id, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, 'English', 'ENG'),
      Language(2, 'Indonesia', 'ID'),
    ];
  }
}

class LanguageProvider with ChangeNotifier {
  Locale _currentLanguage = Locale('id');
  Locale get language => _currentLanguage;

  void changeLanguage() {
    _currentLanguage =
        _currentLanguage == Locale('en') ? Locale('id') : Locale('en');
    notifyListeners();
  }
}
