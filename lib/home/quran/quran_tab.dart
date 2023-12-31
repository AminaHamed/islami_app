import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'surs_title_widget.dart';

class QuranTab extends StatelessWidget {
 List <String> names=["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
  ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
  ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
  ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
  ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
  ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
  ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
  ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
  ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
  "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 2,child: Image.asset('assets/images/quranHomeImg.png')),
        Container(
          color: Theme.of(context).accentColor,
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(AppLocalizations.of(context)!.chapter_name,style:
          Theme.of(context).textTheme.headline4
          ),
        ),
        Container(
          color: Theme.of(context).accentColor,
          height: 2,
        ),
        Expanded(
          flex: 5,
          child: ListView.separated(itemBuilder: (_,index){
            return SuraTitleWidget(names[index],index);
          },itemCount: names.length,
          separatorBuilder: (_,__){
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
}
