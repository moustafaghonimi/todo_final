import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'package:todo/modules/update_screen/update_screen.dart';

import '../../models/task.dart';
import '../../providers/myprovider.dart';
import '../../shared/network/local/firestore_utlis.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskItem extends StatelessWidget {
  Tasks task;

  TaskItem(this.task);

  late MyProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Slidable(
        closeOnScroll: false,
        startActionPane: ActionPane(
          extentRatio: 1 / 2,
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                deleteItemFromFireStore(task.id);
              },
              autoClose: true,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: AppLocalizations.of(context)!.delete,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            SlidableAction(
              onPressed: (context) {
                Navigator.pushNamed(context, updateScreen.routeName,
                    arguments: task);
              },
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: AppLocalizations.of(context)!.edit,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(12),

          //margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 3,
                height: 70,
                color: task.isDone ? Colors.green : Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${task.title}',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: task.isDone ? Colors.green : Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${task.description}',
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  print(task.isDone);
                  if (!task.isDone) {
                    task.isDone = true;
                    provider.updateDone(task);
                    print(task.isDone);
                  }
                },
                child: task.isDone
                    ? Text(
                  AppLocalizations.of(context)!.done,
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )
                    : Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
