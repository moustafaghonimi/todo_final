import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/modules/settings/them_BottomSheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../providers/myprovider.dart';
import 'language_bottomSheat.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(

                    fontSize: 30,
                  )),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: InkWell(
            onTap: () {
              ShowButtomLangButtonScheat(context);
            },
            child: Container(
              padding: EdgeInsets.all(12),
               color: Theme.of(context).colorScheme.onPrimary,
              width: MediaQuery.of(context).size.width * .85,
              height: 50,
              child: Text(
                provider.languageCode == 'en'
                    ? AppLocalizations.of(context)!.english
                    : AppLocalizations.of(context)!.arabic,
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Text(AppLocalizations.of(context)!.them,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(

                    fontSize: 30,
                  )),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: InkWell(
            onTap: () {
              ShowButtomThemeButtonScheat(context);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              color: Theme.of(context).colorScheme.onPrimary,
              width: MediaQuery.of(context).size.width * .85,
              height: 50,
              child: Text(
                provider.themeMode == ThemeMode.light
                    ? AppLocalizations.of(context)!.light
                    : AppLocalizations.of(context)!.dark,
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w500,),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void ShowButtomLangButtonScheat(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        context: context,
        builder: (context) {
          return LangBottomSheet();
        });
  }

  void ShowButtomThemeButtonScheat(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        context: context,
        builder: (context) {
          return ThemBottomSheet();
        });
  }
}
