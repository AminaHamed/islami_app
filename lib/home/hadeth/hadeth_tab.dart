import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'hadeth_model.dart';
import 'hadeth_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> allHadeth=[];
  @override
  void initState() {
    super.initState();
    loadAhadeth();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 2,
            child: Image.asset('assets/images/hadeth_pic.png')),

        Container(

          color: Theme.of(context).accentColor,
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(AppLocalizations.of(context)!.hadeth_number,style:
          Theme.of(context).textTheme.headline4,
          ),
        ),
        Container(
          color: Theme.of(context).accentColor,
          height: 2,
        ),

        Expanded(
          flex: 5,
          child:allHadeth.isEmpty?Center(
            child: CircularProgressIndicator(),
          ):
          ListView.separated(itemBuilder: (_,index) {
             return HadethWidget(allHadeth[index]);
          },itemCount: allHadeth.length,separatorBuilder: (_,__){
    return Container(
    color: Theme.of(context).accentColor,
    height: 1,
    width: double.infinity,
    margin:const EdgeInsets.symmetric(horizontal: 60),
    );
    },
            ),
        ),
      ],
    );
  }

  Future<void> loadAhadeth() async {
    List<Hadeth> hadethList=[];
   String allAhadeth =await rootBundle.loadString('assets/ahadethFile/ahadeth .txt');
   // print(allAhadeth.length);
  List<String> ahadethContent=allAhadeth.split('\#');

  for(int i=0;i<ahadethContent.length;i++){
    String singleHadeth=ahadethContent[i].trim();
    int indexOfFirstLine=singleHadeth.indexOf('\n');
    String hadethTitle=singleHadeth.substring(0,indexOfFirstLine);
    String hadethContent=singleHadeth.substring(indexOfFirstLine);
    // print(hadethTitle);
    // print(hadethContent);
    Hadeth h=new Hadeth(hadethTitle,hadethContent);
    hadethList.add(h);
  }

  setState(() {
    allHadeth=hadethList;
  });
  }
}
