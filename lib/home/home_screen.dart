import 'package:flutter/material.dart';
import 'package:islami/home/hadeth/hadeth_tab.dart';
import 'package:islami/home/quran/quran_tab.dart';
import 'package:provider/provider.dart';
import '../providers/settings_provider.dart';
import 'radio/radio_tab.dart';
import 'sebha/sebha_tab.dart';
import 'settings/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
static const String routeName='HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    var settingProvider=Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              settingProvider.getBackgroundImage()
          ),fit: BoxFit.fill
        ),
      ),
      child: Scaffold(
      appBar: AppBar(
        title:  Text(AppLocalizations.of(context)!.app_title),
      ),
        bottomNavigationBar: BottomNavigationBar(items: [
           BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
               icon:const ImageIcon(
            AssetImage('assets/images/ic_radio.png')
          ), label: AppLocalizations.of(context)!.radio),
         BottomNavigationBarItem(icon:const ImageIcon(AssetImage('assets/images/ic_sebha.png'),),
         label: AppLocalizations.of(context)!.mention,
           backgroundColor: Theme.of(context).primaryColor,
         ),
         BottomNavigationBarItem(icon: const ImageIcon(AssetImage('assets/images/ic_hadeth.png'),),
         label: AppLocalizations.of(context)!.hadeth,
           backgroundColor: Theme.of(context).primaryColor,
         ),

          BottomNavigationBarItem(icon:const ImageIcon(AssetImage('assets/images/ic_quran.png'),),
              label: AppLocalizations.of(context)!.quran,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: AppLocalizations.of(context)!.settings,
          backgroundColor: Theme.of(context).primaryColor,
          )
        ],
        onTap: (index){
          setState(() {
            selectedIndex=index;
          });

        },
        currentIndex:selectedIndex ,
        ),
        body:tabs[selectedIndex],
      ),
    );
  }
  List<Widget> tabs=[RadioTab(),SebhaTab(),HadethTab(),QuranTab(),SettingsTab()];
}
