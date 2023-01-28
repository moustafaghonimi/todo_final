import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/shared/network/local/firestore_utlis.dart';

class MyProvider extends ChangeNotifier {
  DateTime selectedDateprovid=DateTime.now();
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(ThemeMode them ) {
themeMode=them;
    notifyListeners();
  }

  String languageCode = 'en';

  void changeLanguage(String lang) {
    languageCode = lang;
    notifyListeners();
  }

  void updateTaskToFirestore(Tasks task) {
    FirebaseFirestore.instance.collection('Tasks').doc(task.id).update({
      'id': task.id,
      'title': task.title,
      'description': task.description,
      'date': task.date,
      'isDone': task.isDone,
    }).timeout(Duration(milliseconds: 500), onTimeout: () {
      getTaskCollection();
      notifyListeners();
    });
  }

  void updateDone(Tasks task) {
    FirebaseFirestore.instance.collection('Tasks').doc(task.id).update({
      'isDone': true,
    }).timeout(Duration(milliseconds: 500), onTimeout: () {
      getTaskCollection();
      notifyListeners();
    });
  }
}
