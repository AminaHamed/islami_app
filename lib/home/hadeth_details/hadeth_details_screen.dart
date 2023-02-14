import 'package:flutter/material.dart';
import 'package:islami/home/hadeth/hadeth_model.dart';
import 'package:provider/provider.dart';
import '../../providers/settings_provider.dart';
class HadethDetailsScreen extends StatefulWidget {
  static const String routeName='HadethDetailsScreen';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  List<String> lines=[];
  @override
  Widget build(BuildContext context) {
    var settingProvider=Provider.of<SettingsProvider>(context);
   Hadeth args= ModalRoute.of(context)?.settings.arguments as Hadeth;

    return  Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  settingProvider.getBackgroundImage()
              ),fit: BoxFit.fill
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title:  Text(args.title),
          ),
          body: Card(
            elevation: 12,
            // color: Theme.of(context).primaryColor,
            margin:const EdgeInsets.symmetric(vertical: 44,horizontal: 25),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            child:
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10.0),
              child: SingleChildScrollView(
                child: Text(args.content,
                      textDirection: TextDirection.rtl,
                      style:Theme.of(context).textTheme.headline6 ,
                      textAlign: TextAlign.center,
                    ),
              ),
                )
              ,
              ),
            ),

    );
  }
}
