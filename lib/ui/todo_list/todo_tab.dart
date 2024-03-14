import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_flutter/fire_base/firebase_function.dart';
import 'package:todo_app_flutter/fire_base/model.dart';
import 'package:todo_app_flutter/ui/todo_list/task_item.dart';

class ToDoScreen extends StatefulWidget {
  static const String routeName = 'ToDoScreen';
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  var selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
          child: Container(
            color: Color(0xff5D9CEC),
          ),
        ),
        Stack(
          children: [
            Container(
              height: 40,
              decoration:BoxDecoration(
                color: Color(0xff5D9CEC),

              ),
            ),
            DatePicker(
              height: 82,
              DateTime.now(),
              initialSelectedDate: selectedDate,
              selectionColor: Color(0xff5D9CEC),
              selectedTextColor: Color(0xff5D9CEC),
              daysCount: 365,
              onDateChange: (date) {
                selectedDate=date;
                setState(() {

                });
              },
            ),

          ],
        ),
        SizedBox(
          height: 22,

        ),

        Expanded(
          child: StreamBuilder(
            stream: FireBaseFunctions.getTasks(selectedDate),
            builder: (context, snapshot) {
            if (snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError){
              return Column(
                children: [
                  Text('Something went wrong')
                ],
              );
            }
            List<TaskModel>tasksList =
                snapshot.data?.docs.map((e) => e.data()).toList()??[];
            if (tasksList.isEmpty){
              return Center(child: Text('No Tasks',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)));
            }
            return ListView.separated(itemBuilder: (context, index) {
              return TaskItem(model : tasksList[index]);
            }, separatorBuilder: (context, index) {
              return SizedBox(
                height: 18,
              );
            }, itemCount: tasksList.length);
          },
          ),
        )

      ],
    );;
  }
}
