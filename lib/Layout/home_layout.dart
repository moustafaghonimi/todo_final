import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/modules/settings/settings.dart';
import 'package:todo/modules/tasks/task_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/providers/myprovider.dart';
import 'package:todo/shared/styles/colors.dart';

import '../modules/tasks/addTaskBottomSheat.dart';

class HomeLayout extends StatefulWidget {
  static const String routename = 'home';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(currentIndex==0?AppLocalizations.of(context)!.titleappBarHome:AppLocalizations.of(context)!.settings,
            textAlign: TextAlign.center),
      ),
      body: tabs[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
            side: BorderSide(
          color: Theme.of(context).colorScheme.onPrimary,
          width: 3,
        )),
        onPressed: () {
          showAddTasskBottomScheat();
        },
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;

            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor: provider.themeMode == ThemeMode.light
                    ? colorWhite
                    : colorBlack,
                icon: Icon(
                  Icons.list,
                  size: 30,
                ),
                label: AppLocalizations.of(context)!.list),
            BottomNavigationBarItem(
                backgroundColor: provider.themeMode == ThemeMode.light
                    ? colorWhite
                    : colorBlack,
                icon: Icon(
                  Icons.settings,
                  size: 30,
                ),
                label: AppLocalizations.of(context)!.settings),
          ],
        ),
      ),
    );
  }

  void showAddTasskBottomScheat() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        isScrollControlled: true,
        builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[AddTaskBottomSheat()]),
            )));
  }

  List<Widget> tabs = [
    TaskList(),
    Setting(),
  ];
}
