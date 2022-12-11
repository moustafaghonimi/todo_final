
import 'package:flutter/material.dart';

import 'Layout/home_layout.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:HomeLayout.routename ,
        routes:{
          HomeLayout.routename:(c)=> HomeLayout(),

      },
      );
  }
}
