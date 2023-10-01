import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami10/ui/ChapterDetails/VerseWidget.dart';

class ChapterDetailsScreen extends StatefulWidget {
  static const String routeName = "ChapterDetails";

  @override
  State<ChapterDetailsScreen> createState() => _ChapterDetailsScreenState();
}

class _ChapterDetailsScreenState extends State<ChapterDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    ChapterDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as ChapterDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/main_background.png"),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.title),
          ),
          body: verses.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Card(
                  elevation: 30,
                  margin: EdgeInsets.symmetric(vertical: 50, horizontal: 24),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return VerseWidget(verses[index], index);
                    },
                    itemCount: verses.length,
                  ),
                ),
        ));
  }

  List<String> verses = [];

  void loadFile(int index) async {
    String Chapter_Content =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    verses = Chapter_Content.split("\n");
    setState(() {});
  }
}

class ChapterDetailsArgs {
  String title;
  int index;

  ChapterDetailsArgs(this.title, this.index) {}
}
