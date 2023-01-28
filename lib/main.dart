
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/myprovider.dart';
import 'package:todo/shared/styles/my_them.dart';

import 'Layout/home_layout.dart';
import 'firebase_options.dart';
import 'modules/update_screen/update_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MyProvider(),),
    ],
    child: MyApp(),
  ),);
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);

    return
      MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''), // English, no country code
          Locale('ar', ''),
        ],
        locale: Locale(provider.languageCode),
        debugShowCheckedModeBanner: false,
        initialRoute:HomeLayout.routename ,
        routes:{
          HomeLayout.routename:(c)=> HomeLayout(),
          updateScreen.routeName:(context) => updateScreen(),

      },
        theme: MyThemeData.lightTheme,
        darkTheme: MyThemeData.darkTheme,
        themeMode: provider.themeMode,
      );
  }
}
