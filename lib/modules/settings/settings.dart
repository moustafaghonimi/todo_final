import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(padding: EdgeInsets.all(20),
          child: Text('Language',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: Colors.black,
                    fontSize: 30,
                  )),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: InkWell(
            onTap: () {
              // ShowButtomLangButtonScheat(context);

            },
            child: Container (
padding: EdgeInsets.all(12),
              color: Colors.white,
              width: MediaQuery.of(context).size.width*.85,
              height: 50,
              child: Text(
                'English',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Text ('Theme',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: Colors.black,
                    fontSize: 30,
                  )),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: InkWell(
            onTap: () {
                // ShowButtomThemeButtonScheat(context);

            },
            child: Container (
              padding: EdgeInsets.all(12),

              color: Colors.white,
              width: MediaQuery.of(context).size.width*.85,
              height: 50,
              child: Text(
                'Light',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // void ShowButtomLangButtonScheat(BuildContext context){
  //   showModalBottomSheet(backgroundColor: Theme.of(context).colorScheme.secondary,context: context, builder: (context){
  //
  //     return LangBottomSheet();
  //   });
  // }
  // void ShowButtomThemeButtonScheat(BuildContext context){
  //   showModalBottomSheet(backgroundColor: Theme.of(context).colorScheme.secondary,context: context, builder: (context){
  //
  //     return ThemBottomSheet();
  //   });
  // }
}
