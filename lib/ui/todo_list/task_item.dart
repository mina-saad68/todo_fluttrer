import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app_flutter/fire_base/firebase_function.dart';
import 'package:todo_app_flutter/fire_base/model.dart';

import 'edit_task.dart';

class TaskItem extends StatelessWidget {
  static const String routeName = 'taskItem';
  TaskModel model ;

   TaskItem({required this
  .model,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Slidable(
        startActionPane:
            ActionPane(


                extentRatio: 0.5, motion: DrawerMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              FireBaseFunctions.deleteTask(model.id);
            },
            label: 'Delete',
            backgroundColor: Colors.red,
            icon: Icons.delete,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(18),topLeft: Radius.circular(18)),
          ),
          SlidableAction(
            onPressed: (context) {
              Navigator.pushNamed(context, EditTask.routeName,arguments: model);

            },
            label: 'Edit',
            backgroundColor: Color(0xff5D9CEC),
            icon: Icons.edit,
          ),
        ]),
        child: Row(
          children: [
            SizedBox(
              width: 12,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              height: 75,
              width: 3,
              decoration: BoxDecoration(
                color: Color(0xff5D9CEC),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(
              width: 18,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  model.title,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Color(0xff5D9CEC),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  model.description,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Color(0xff5D9CEC),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
              decoration: BoxDecoration(
                  color: Color(0xff5D9CEC),
                  borderRadius: BorderRadius.circular(12)),
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 28,
              ),
            )
          ],
        ),
      ),
    );
  }
}
