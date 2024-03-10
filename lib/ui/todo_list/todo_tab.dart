import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_flutter/ui/todo_list/task_item.dart';

class ToDoScreen extends StatelessWidget {
  static const String routeName = 'ToDoScreen';
  const ToDoScreen({super.key});

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
              initialSelectedDate: DateTime.now(),
              selectionColor: Color(0xff5D9CEC),
              selectedTextColor: Color(0xff5D9CEC),
              daysCount: 365,
              onDateChange: (date) {

              },
            ),

          ],
        ),
        SizedBox(
          height: 22,

        ),

        Expanded(
          child: ListView.separated(itemBuilder: (context, index) {
            return TaskItem();
          },itemCount: 9,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 18,
              );
            },),
        )

      ],
    );;
  }
}
