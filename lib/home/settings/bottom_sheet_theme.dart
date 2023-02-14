import 'package:flutter/material.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class BottomSheetTheme extends StatefulWidget {

  @override
  State<BottomSheetTheme> createState() => _BottomSheetThemeState();
}

class _BottomSheetThemeState extends State<BottomSheetTheme> {
  @override
  Widget build(BuildContext context) {
    var settingProvider=Provider.of<SettingsProvider>(context);
    return Container(
      padding:const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            InkWell(onTap: (){
              settingProvider.changeTheme(ThemeMode.dark);
            },

                child: settingProvider.isDarkMode()?
                getSelectedItem('Dark'):
                getUnselectedItem('Dark')

            ),

          const SizedBox(height: 15,),
           InkWell(onTap: (){
             settingProvider.changeTheme(ThemeMode.light);
           },

               child:settingProvider.isDarkMode()?
               getUnselectedItem('Light'):getSelectedItem('Light')


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
