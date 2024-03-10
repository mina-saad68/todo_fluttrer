import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditTask extends StatefulWidget {
  static const String routeName = 'EditTask';

  const EditTask({super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {

  var formKey = GlobalKey<FormState>();

  var selectedDate= DateTime.now();
  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.symmetric(vertical: 24,horizontal: 12),
          height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child:  Form(
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
                    decoration: InputDecoration(
                      label: Text(
                        'edit your task',
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
                    decoration: InputDecoration(
                      label: Text(
                        'edit your description',
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
                          '${selectedDate.toString().substring(0,10)}',
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
                          if (formKey.currentState!.validate()) {}
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
                      )),
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
