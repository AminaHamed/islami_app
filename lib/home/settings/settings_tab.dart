import 'package:flutter/material.dart';
import 'package:islami/providers/settings_provider.dart';

import 'bottom_sheet_language.dart';
import 'bottom_sheet_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var settingProvider=Provider.of<SettingsProvider>(context);
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
              onTap: (){
                showThemeBottonSheet();
              },
            child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      width: 1,
                      color: Theme.of(context).accentColor,
                    )),
                child: Text(
                  settingProvider.isDarkMode()?
                  AppLocalizations.of(context)!.dark:
                  AppLocalizations.of(context)!.light,
                  style: Theme.of(context).textTheme.headline6,
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: (){
             showLanguageBottomSheet();
            },
            child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      width: 1,
                      color: Theme.of(context).accentColor,
                    )),
                child: Text(
                  settingProvider.currentLang=='en'?'English':'العربيه',
                  style: Theme.of(context).textTheme.headline6,
                )),
          ),
        ],
      ),
    );
  }

  void showThemeBottonSheet(){
    showModalBottomSheet(context: context,
        builder: (buildContext){
      return BottomSheetTheme();
        });
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context, builder: (buildcontext){
      return BottomSheetLanguage();
    });
  }
}//class


