import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/modules/tasks/task_item.dart';
import 'package:todo/shared/network/local/firestore_utlis.dart';

class TaskList extends StatefulWidget {
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
      CalendarTimeline(
      initialDate: date,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
      onDateSelected: (datetime){
        print(date);
        date = datetime;
        setState(() {});
      },
      leftMargin: 20,
      monthColor: Colors.black,
      dayColor: Colors.black,
      activeDayColor: Colors.white,
      activeBackgroundDayColor: Colors.blue,
      selectableDayPredicate: (day) => true,
      dotsColor: Colors.white,
      locale: 'en',
    ),

        Expanded(
            child: StreamBuilder<QuerySnapshot<Tasks>>(
          stream: getDataFromFirestore(date),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text('Samthing Was Error');
            }
            var tasks = snapshot.data?.docs.map((e) => e.data()).toList() ?? [];

            return ListView.builder(
              itemBuilder: (context, index) {
                return TaskItems(tasks[index]);
              },
              itemCount: tasks.length,
            );
          },
        ))
      ],
    );
  }
}
