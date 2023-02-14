import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../providers/settings_provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter=0;
  List<String> words=[
    'سبحان الله',
    'الحمد الله',
    'لا اله الا الله',
    'لا حول ولا قوه الا بالله',
    'الله اكبر'
  ];
  int index=0;
  double angle=0;
  @override
  Widget build(BuildContext context) {
    var settingProvider=Provider.of<SettingsProvider>(context);
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              // color: Colors.red,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(settingProvider.isDarkMode()?

                      'assets/images/head_ sebha_dark.png':
                      'assets/images/head_sebha.png'

                  ),
                  Positioned(
                    bottom: 0,
                      child: Transform.rotate(
                        angle: angle,
                        child: GestureDetector(
                            onTap: (){
                              onSebhaClick();
                            },
                            child: Image.asset(
                                settingProvider.isDarkMode()?
                                'assets/images/body_sebha_dark.png':
                                'assets/images/body_sebha.png'
                            )
                        ),
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context)!.mention_number
                  ,style: Theme.of(context).textTheme.headline4
                  !.copyWith(
                  fontWeight: FontWeight.bold
                ),

                ),
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('$counter',style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white
                    ),)),
                SizedBox(height: 9,),
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('${words[index]}',style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white
                    ),)),
              ],
            ),
          )

        ],
      ),
    );
  }
  void onSebhaClick(){
    counter++;
    if(counter % 3==0){
      index ++;
    }
    if(index ==words.length){
      index=0;
    }
    angle +=360/3;
    setState(() {

    });
  }
}
