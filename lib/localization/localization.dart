import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MyLocalizations {
  MyLocalizations(this.locale);

  final Locale locale;

  static MyLocalizations of(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations);
  }

  static const LocalizationsDelegate<MyLocalizations> delegate =
      _MyLocalizationsDelegate();

  Map<String, String> _sentances;

  Future<bool> load() async {
    String token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZGMyNmM1MjJhNTg5ZTc5NDBhNDM5NGVhYjcxMTM3ZjA5NzNiNTlmYWZkMTAyYWI3Njc4MDI1Zjk5OWQ5NTczZjM1MzNlNWIxMjI3MzQxYTUiLCJpYXQiOjE2MDI2NzIyNTIsIm5iZiI6MTYwMjY3MjI1MiwiZXhwIjoxNjM0MjA4MjUyLCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.NF0QgOEO4HEkzbgRzzTgdITmufc6SlneteNg26HZ960AjkRULTq9DTFuPGVIBNnugSSTAG8NaMIBzDciBWHaGTEoeied5IdGinrbYBSKEMs6fj0t0arMm5K_9wtyaV1gK1tV_nTHcmOmWKQmoIuHlCPD_3fpFKL22cGwVu6uVFDt45_kGfFkcKxAVM3dcVYAtEhj_n-3er_gIeafjBJqFmrFo2XjWx5F6M0HtgFjp33g2eIBFcQjhOOZd4mPOCI81K6xj42Op4PHcJIv9nt6sGd3gdhnLBZSF2UKKNqwyjYb_RuHh75Emu33iYiyq0TxwTGqAWYmmyVJoLAEC2UIZ1Qv_L3SmnVHaVqCvnuFZfSJNxfOw_MGG9Bn3yPxgwuklr7z23l2gsIvE2nC4n_niu00yQGLbfirDQgEJ1--sbvkLcc5mKtNw_Hxyj4xpREPsP6qH2PnL2g4ZIqh2gDeNZKICMq7Lxba30MwSrGSY8U3hmwGneW9aHby26g4_J5GSL0s4Z_CAqMo7Jb-ckEjNTCXP7e5Mr2zMKE5Wn4yRQeQv0AMKZS9xuYalDv9r6iXgZL-6JldtsYDs3JhPHYv9hJ0O8m1RbrPFLUYbgVLlk5qq5RmJb00rnx9P4xg6dDO9nis1HkvWJWXp_pzTFXzjKEEyco66So4nAUhQIEPNr0';
    final response = await http.get(
      'https://api-myjhl.bisabanget.online/api/v1/lite-cms/translation?group_id=2&language_code=${this.locale.languageCode}',
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + token
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> _result = jsonDecode(response.body);
      if (_result['error'] == 0) {
        print('INI DATA ROOTBUNDLE : ${_result['data']}');
        this._sentances = new Map();
        _result['data'].forEach((key, value) {
          this._sentances[key] = value.toString();
        });
        return true;
      } else {
        print('DATA TIDAK DITEMUKAN');
      }
    } else {
      return null;
    }
  }

  String trans(String key) {
    return this._sentances[key];
  }
}

class _MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  const _MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'id'].contains(locale.languageCode);
  }

  @override
  Future<MyLocalizations> load(Locale locale) async {
    MyLocalizations localizations = new MyLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<MyLocalizations> old) {
    return false;
  }
}
