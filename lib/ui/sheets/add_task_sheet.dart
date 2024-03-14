import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app_flutter/fire_base/firebase_function.dart';
import 'package:todo_app_flutter/fire_base/model.dart';



class AddTaskSheet extends StatefulWidget {
  static const String routeName = 'addtasksheet';

  AddTaskSheet({super.key});

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  var formKey = GlobalKey<FormState>();
  var selectedDate= DateTime.now();
  var descriptionController = TextEditingController();
  var titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Add new task',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter task';
                } else {
                  return null;
                }
              },
              controller: titleController,
              decoration: InputDecoration(
                label: Text(
                  'enter your task',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter task description';
                } else {
                  return null;
                }
              },
              controller: descriptionController,
              decoration: InputDecoration(
                label: Text(
                  'enter your description',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 26,
            ),
            Text(
              'Select time',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            SizedBox(
              height: 12,
            ),
            Center(
                child: InkWell(
                  onTap: () {
                    selectDate(context);
                  },
                  child: Text(
                    '${selectedDate.toString().substring(0,10)}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                )),
            SizedBox(
              height: 26,
            ),
            Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      TaskModel task = TaskModel(
                          title: titleController.text,
                          description: descriptionController.text,
                          date: DateUtils.dateOnly(selectedDate) .millisecondsSinceEpoch);
                      FireBaseFunctions.addTask(task);
                      Navigator.pop(context);

                    }
                  },
                  child: Text(
                    'add task',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff5D9CEC)),
                )),
          ],
        ),
      ),
    );
  }

  selectDate(BuildContext context) async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if (chosenDate!=null){
      selectedDate = chosenDate;
      setState(() {

      });
    }

  }

}
