
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/sura_details/sura_details_args.dart';
import 'package:provider/provider.dart';
import '../../providers/settings_provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName='SuraDetailsScreen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses=[];

  @override
  Widget build(BuildContext context) {
    var settingProvider=Provider.of<SettingsProvider>(context);
    //receive args
    // Object? args=ModalRoute.of(context)?.settings.arguments;
    // or dawn casting it to:
    SuraDetailsArgs args=(ModalRoute.of(context)?.settings.arguments) as SuraDetailsArgs;
  if(verses.isEmpty) readFile(args.index+1);//non blocking
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
        title:  Text(args.name),
    ),
        body: Card(
          elevation: 12,
          margin:const EdgeInsets.symmetric(vertical: 44,horizontal: 25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          child: verses.isEmpty?const Center(
            child: CircularProgressIndicator(),
          ):
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(itemBuilder: (_,index){
              return Container(
                padding: const EdgeInsets.all(3.0),
                margin: const EdgeInsets.all(5.0),
                child: Text('${verses[index]} ${[index+1]}',
                  textDirection: TextDirection.rtl,
                  style:Theme.of(context).textTheme.headline6 ,
                textAlign: TextAlign.center,
                ),
              );
            },itemCount: verses.length,separatorBuilder:
            (_,int)=>Container(
              color: Theme.of(context).accentColor,
              height: 1,
              margin:  const EdgeInsets.symmetric(vertical: 0,horizontal: 40),
            )
              ),
          ),
        ),

        )

    );
  }

  Future<void> readFile(int fileIndex) async {
    String fileContent=await rootBundle.loadString('assets/suwr/$fileIndex.txt');//block

    List<String>linse=fileContent.trim().split('\n');
    // print(linse);
    setState(() {
      verses=linse;
    });
  }
}
