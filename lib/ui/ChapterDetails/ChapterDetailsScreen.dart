import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami10/providers/SettingsProvider.dart';
import 'package:islami10/ui/ChapterDetails/VerseWidget.dart';
import 'package:islami10/ui/MyThemeData.dart';
import 'package:provider/provider.dart';

class ChapterDetailsScreen extends StatefulWidget {
  static const String routeName = "ChapterDetails";

  @override
  State<ChapterDetailsScreen> createState() => _ChapterDetailsScreenState();
}

class _ChapterDetailsScreenState extends State<ChapterDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    ChapterDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as ChapterDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                settingsProvider.getBackgroundImage()
              ),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.title,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
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
