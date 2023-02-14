import 'package:flutter/material.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class BottomSheetLanguage extends StatefulWidget {

  @override
  State<BottomSheetLanguage> createState() => _BottomSheetLanguageState();
}

class _BottomSheetLanguageState extends State<BottomSheetLanguage> {
  @override
  Widget build(BuildContext context) {
    var settingProvider=Provider.of<SettingsProvider>(context);
    return Container(
      padding:const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            InkWell(onTap: (){
              settingProvider.changelocal('ar');
            },

                child: settingProvider.currentLang=='ar'?
              getSelectedItem('العربيه'):
                    getUnselectedItem('العربيه')

            ),

          const SizedBox(height: 15,),
           InkWell(onTap: (){
             settingProvider.changelocal('en');
           },

               child:settingProvider.currentLang=='en'?
             getSelectedItem('English'):
             getUnselectedItem('English'),
           ),

        ],
      ),
    );
  }

  Widget getSelectedItem(String title){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: Theme.of(context).textTheme.headline4?.copyWith(
            color: Theme.of(context).accentColor
        )
          ,),
        Icon(Icons.check,size: 30,color: Theme.of(context).accentColor,)
      ],
    );
  }

  Widget getUnselectedItem(String title){
    return   Text(title,style: Theme.of(context).textTheme.headline4,);
  }
}
