import 'package:flutter/material.dart';

import '../hadeth_details/hadeth_details_screen.dart';
import 'hadeth_model.dart';

class HadethWidget extends StatelessWidget {
Hadeth hadeth;
HadethWidget(this.hadeth);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,
        arguments: hadeth
        );
      },
      child: Container(
          padding:  const EdgeInsets.symmetric(vertical: 4.0,horizontal: 2),
          alignment: Alignment.center,
          child: Text(hadeth.title,style:Theme.of(context).textTheme.headline4)),

    //  Text(hadeth.title,style:Theme.of(context).textTheme.headline6)
    );
  }
}
