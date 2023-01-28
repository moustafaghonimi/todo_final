import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/myprovider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    var provider = Provider.of<MyProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [
        InkWell(
          onTap: () {
            provider.changeTheme(ThemeMode.light);

            Navigator.pop(context);
          },
          child: Container(

            width: w * .70,
            height: h * 0.06,
            color: Theme.of(context).colorScheme.onPrimary,
            child: Text(
              AppLocalizations.of(context)!.light,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: Colors.blue,fontSize: 23),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            provider.changeTheme(ThemeMode.dark);
            Navigator.pop(context);
          },
          child: Container(
            width: w * .70,
            height: h * 0.06,
            color: Theme.of(context).colorScheme.onPrimary,
            child: Text(
              AppLocalizations.of(context)!.dark,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: Colors.blue,fontSize: 23),
            ),
          ),
        ),
      ],
    );
  }
}
