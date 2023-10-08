import 'package:flutter/material.dart';
import 'package:islami10/providers/SettingsProvider.dart';
import 'package:islami10/ui/settings/LanguageBottomSheet.dart';
import 'package:islami10/ui/settings/ThemeBottomSheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 64, horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.theme,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary, fontSize: 20),
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
                padding: EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 2)),
                child: Text(
                  provider.isDarkEnabled()
                      ? AppLocalizations.of(context)!.dark
                      : AppLocalizations.of(context)!.light,
                  style: TextStyle(fontSize: 20  , color: Theme.of(context).colorScheme.onPrimary),
                )),
          ),
          SizedBox(
            height: 18,
          ),
          Text(AppLocalizations.of(context)!.language,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 20)),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
                padding: EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 2)),
                child: Text(
                  provider.currentLocale == 'en' ? "English" : "العربية",
                  style: TextStyle(fontSize: 20 , color: Theme.of(context).colorScheme.onPrimary),
                )),
          ),
        ],
      ),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ThemeBottomSheet();
      },
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return LanguageBottomSheet();
      },
    );
  }
}
