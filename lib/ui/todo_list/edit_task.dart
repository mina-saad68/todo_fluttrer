import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app_flutter/fire_base/firebase_function.dart';
import 'package:todo_app_flutter/fire_base/model.dart';
import 'package:intl/intl.dart';



class EditTask extends StatefulWidget {
  static const String routeName = 'EditTask';

  const EditTask({super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  var formKey = GlobalKey<FormState>();
  var selectedDate = DateTime.now();

  var descriptionController = TextEditingController();
  var titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TaskModel model = ModalRoute.of(context)!.settings.arguments as TaskModel;
    DateUtils.dateOnly(selectedDate)
        .millisecondsSinceEpoch;
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Stack(children: [
        Column(
          children: [
            SizedBox(
              height: 65,
              child: Container(
                color: Color(0xff5D9CEC),
              ),
            ),
            Expanded(
              child: Container(
                color: Color(0xffDFECDB),
              ),
            )
          ],
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 16, bottom: 85, right: 18, left: 18),
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Edit Task',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 22,
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
                        model.title,
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 22,
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
                        model.description,
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 36,
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

                      '${model.date.toString().substring(0,10)}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                  'Do You Want To Save Changes',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 16),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    child: const Text(
                                      'Ok',
                                      style: TextStyle(
                                          color: Color(0xFF5D9CEC),
                                          fontSize: 16),
                                    ),
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        model.title = titleController.text;
                                        model.description =
                                            descriptionController.text;
                                        model.date =
                                            DateUtils.dateOnly(selectedDate)
                                                .millisecondsSinceEpoch;
                                        FireBaseFunctions.updateTask(
                                            model.id, model);
                                      }
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          'Save Changes',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff5D9CEC)),
                      )
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

  selectDate(BuildContext context) async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate ,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));


    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }

}
