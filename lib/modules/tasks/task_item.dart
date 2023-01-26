import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task.dart';
import 'package:todo/modules/update_screen/update_screen.dart';
import 'package:todo/providers/myprovider.dart';

import '../../shared/network/local/firestore_utlis.dart';

class TaskItems extends StatelessWidget {
  Tasks tasks;

  TaskItems(this.tasks);

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Slidable(
      closeOnScroll: false,
      startActionPane: ActionPane(
        extentRatio: 1/2,
        // A motion is a widget used to control how the pane animates.
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              deleteItemFromFireStore(tasks.id);
            },
            icon: Icons.delete,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            label: 'Delete',
            autoClose: true,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(12),
                topRight: Radius.circular(12)),
          ),
          SlidableAction(
              onPressed: (context) {
                Navigator.pushNamed(context, updateScreen.routeName,arguments:tasks );
              },
              icon: Icons.update,
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              label: 'Update',
              autoClose: true,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12))),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(left: 0,right: 10,top: 10,bottom: 8),
        child: Row(
          children: [
            SizedBox(
              width: 8,
            ),
            Container(
              height: 80,
              width: 3,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tasks.title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(tasks.description),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primary),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.done,
                    size: 30,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
