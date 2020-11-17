import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'package:test_localization/classes/language.dart';
import 'package:test_localization/localization/localization.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => LanguageProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        const Locale('en', ''),
        const Locale('id', ''),
      ],
      locale: context.watch<LanguageProvider>().language,
      localizationsDelegates: [
        // const MyLocalizationsDelegate(),
        MyLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        for (Locale supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode ||
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyApps(),
    );
  }
}

class MyApps extends StatefulWidget {
  @override
  _MyAppsState createState() => _MyAppsState();

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppsState state = context.findAncestorStateOfType<_MyAppsState>();
    state.setLocale(locale);
  }
}

class _MyAppsState extends State<MyApps> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(MyLocalizations.of(context).trans("hello_there")),
            // Text(MyLocalizations.of(context).trans('hello_there')),
            Text('TESTING'),
            Text(MyLocalizations.of(context).trans('all').toString()),
            Text(MyLocalizations.of(context)
                .trans('voucher_for_you')
                .toString()),
            Text(MyLocalizations.of(context).trans('redeem').toString()),
            Text(MyLocalizations.of(context).trans('service_jhl').toString()),
            Text(MyLocalizations.of(context).trans('new_info').toString()),
            Text(MyLocalizations.of(context).trans('point').toString()),
            RaisedButton(
              onPressed: () {
                context.read<LanguageProvider>().changeLanguage();
                print(MyLocalizations.of(context).trans("all"));
              },
              child: Text('Testing API'),
            ),
          ],
        ),
      ),
    );
  }
}
