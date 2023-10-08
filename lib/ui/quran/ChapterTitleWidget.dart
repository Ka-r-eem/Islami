import 'package:flutter/material.dart';
import 'package:islami10/ui/ChapterDetails/ChapterDetailsScreen.dart';

class ChapterTitleWidget extends StatelessWidget {
  String title;
  int index ;
  ChapterTitleWidget(this.title , this.index) {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ChapterDetailsScreen.routeName,
            arguments: ChapterDetailsArgs(title, index));
      },
      child: Container(
          padding: EdgeInsets.all(4),
          alignment: Alignment.center,
          child: Text(
            "$title",
            style: TextStyle(fontSize: 25 , color: Theme.of(context).colorScheme.onPrimary),
          )),
    );
  }
}
