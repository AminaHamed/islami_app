import 'package:flutter/material.dart';

import '../../sura_details/sura_details_args.dart';
import '../../sura_details/sura_details_screen.dart';

class SuraTitleWidget extends StatelessWidget {
  String name;
  int index;
  SuraTitleWidget(this.name,this.index);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
        arguments: SuraDetailsArgs(name:name,index: index),
        );
      },
      child: Container(
        padding:const EdgeInsets.all(8),
        child: Text(name,textAlign: TextAlign.center,
            style:Theme.of(context).textTheme.headline4
          ,),
      ),
    );
  }
}
