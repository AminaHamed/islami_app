import 'package:flutter/material.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:islami/sura_details/sura_details_screen.dart';
import 'home/hadeth_details/hadeth_details_screen.dart';
import 'home/home_screen.dart';
import 'my_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';




void main() {
  runApp(  ChangeNotifierProvider(
      create: (buildContext)=>SettingsProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingProvider=Provider.of<SettingsProvider>(context);
    return MaterialApp(
      theme:MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: settingProvider.currentTheme,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales:AppLocalizations.supportedLocales,
      // [
      //   Locale('en',''), // English
      //   Locale('ar',''), // arabic
      // ],
      locale: Locale(settingProvider.currentLang),
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
        SuraDetailsScreen.routeName:(_)=>SuraDetailsScreen(),
        HadethDetailsScreen.routeName:(_)=>HadethDetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
    ) ;
  }
}
