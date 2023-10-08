import 'package:flutter/material.dart';
import 'package:islami10/providers/SettingsProvider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                provider.changeLanguage('en');
                Navigator.pop(context);
              },
              child: provider.currentLocale == 'en'
                  ? getSelectedItem("English")
                  : getUnselectedItem("English")),
          InkWell(
              onTap: () {
                provider.changeLanguage('ar');
                Navigator.pop(context);
              },
              child: provider.currentLocale == 'ar'
                  ? getSelectedItem("العربية")
                  : getUnselectedItem("العربية"))
        ],
      ),
    );
  }

  Widget getSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 18, color: Theme.of(context).colorScheme.secondary),
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).colorScheme.secondary,
        )
      ],
    );
  }

  Widget getUnselectedItem(String text) {
    return Row(
      children: [
        Text(text,
            style: TextStyle(
                fontSize: 18, color: Theme.of(context).colorScheme.onPrimary)),
      ],
    );
  }
}
