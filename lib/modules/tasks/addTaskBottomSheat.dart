import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task.dart';
import 'package:todo/shared/componant/ui_utlis.dart';
import 'package:todo/shared/network/local/firestore_utlis.dart';

import '../../providers/myprovider.dart';

class AddTaskBottomSheat extends StatefulWidget {
  @override
  State<AddTaskBottomSheat> createState() => _AddTaskBottomSheatState();
}

class _AddTaskBottomSheatState extends State<AddTaskBottomSheat> {

var titleControler=TextEditingController();
var descriaptionControler=TextEditingController();
DateTime selectDate=DateTime.now();


  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<Myprovider>(context);
    // var args = ModalRoute.of(context)?.settings.arguments as Tasks;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add New Task',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          SizedBox(
            height: 6,
          ),
          Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  validator: (text) {
                    if (text != null && text.isEmpty) {
                      return 'Please Enter Task Tittle';
                    }
                    return null;
                  },
                  autofocus: true,
                  autocorrect: true,
                  controller:titleControler,
                  decoration: InputDecoration(
                      label: Text('Title'),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              style: BorderStyle.solid,
                              width: 2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              style: BorderStyle.solid,
                              width: 2))),
                ),
                SizedBox(
                  height: 7,
                ),
                TextFormField(
                  validator: (text) {
                    if (text != null && text.isEmpty) {
                      return 'Please Enter Task Description';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text('Descraption'),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            style: BorderStyle.solid,
                            width: 2)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          style: BorderStyle.solid,
                          width: 2),
                    ),
                  ),
                  maxLines: 4,
                  autocorrect: true,
                  controller: descriaptionControler,
                ),
                SizedBox(
                  height: 7,
                ),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Select Date',
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      InkWell(
                        onTap: () {
                          SelectedDate();
                        },
                        child: Text(
                          '${selectDate.year}/${selectDate.month}/${selectDate.day}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            Tasks task = Tasks(
                                title: titleControler.text,
                                description: descriaptionControler.text,
                                date: DateUtils.dateOnly(selectDate)
                                    .millisecondsSinceEpoch);
                            showloding('Loading.....', context);

                            addTaskToFirestore(task).then((value) {
                              // task.id=args.id;
                              // task.title=args.title;
                              // task.description=args.description;
                              // task.date=args.date;
                              // task.isDone=args.isDone;
                              // print('${args.id}\n${args.title}\n${args.description}\n${args.date}\n');
                              print(('**' * 20));
                              print(task.id);
                              hideMassage(context);
                              showMasage(
                                context,
                                'Task is Added',
                                'Ok',
                                () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                              );
                            }).catchError((error) {
                              print(error);
                              hideMassage(context);
                            });
                          }
                        },
                        child: Text('Add'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void SelectedDate() async {
    DateTime? chossenDate = await showDatePicker(
        context: context,
        initialDate: selectDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    print(chossenDate);
    if (chossenDate == null) {
      return;
    }
    selectDate = chossenDate;
    setState(() {});
  }
}
