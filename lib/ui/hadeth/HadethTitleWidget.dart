import 'package:flutter/material.dart';
import 'package:islami10/ui/HadethDetails/HadethDetailsScreen.dart';
import 'package:islami10/ui/hadeth/Hadeth.dart';

class HadethTitleWidget extends StatelessWidget {

  Hadeth hadeth;

  HadethTitleWidget(this.hadeth) {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(HadethDetailsScreen.routeName ,
        arguments:hadeth
        );

      },
      child: Container(
          padding: EdgeInsets.all(4),
          alignment: Alignment.center,
          child: Text(
            hadeth.title,
            style: TextStyle(fontSize: 25 , fontWeight: FontWeight.w500 , color: Theme.of(context).colorScheme.onPrimary),
          )),
    );
  }
}
