import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami10/ui/hadeth/HadethTitleWidget.dart';
import 'Hadeth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  @override
  Widget build(BuildContext context) {
   if (AllHadeth.isEmpty)
    loadHadethFile();
    return Column(
      children: [
        Expanded(
          flex: 1,
            child: Image.asset("assets/images/hadeth_logo.png")),
        Container(
            padding: EdgeInsets.all(12),
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(
                        color: Theme.of(context).colorScheme.secondary, width: 2))),
            child: Text(
              AppLocalizations.of(context)!.hadeth,
              style: TextStyle(fontSize: 24 ,fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.onPrimary , fontFamily: "JF Flat regular"),
            )),
        Expanded(
          flex: 3,
          child: AllHadeth.isEmpty ? Center(child: CircularProgressIndicator()) :
          ListView.separated(itemBuilder: (context, index) {
            return HadethTitleWidget(AllHadeth[index]);

          },
              separatorBuilder: (context, index)=>
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 65),
                    color: Color(0xFFB7935F),
                    width: double.infinity,
                    height: 2,
                  ),
              itemCount: AllHadeth.length),
        )
      ],
    );
  }

  List<Hadeth> AllHadeth = [];

  void loadHadethFile() async {
    String fileContent =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> HadethList = fileContent.trim().split("#");
    for (int i = 0; i < HadethList.length; i++) {
      String singlehadeth = HadethList[i];
      List<String> hadethlines = singlehadeth.trim().split("\n");
      String title = hadethlines[0];
      hadethlines.remove(0);
      String content = hadethlines.join("\n");
      Hadeth hadeth = Hadeth(title, content);
      AllHadeth.add(hadeth);

    }
    setState(() {

    });
  }
}
