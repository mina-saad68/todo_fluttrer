import 'package:flutter/material.dart';


import '../settings/settings_tab.dart';
import '../sheets/add_task_sheet.dart';
import '../todo_list/todo_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Homescreen';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDFECDB),
      appBar: AppBar(
        title: index==0?Text('To Do List'):Text('Settings'),

      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        padding: EdgeInsets.zero,
        height: 65,
        child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,

            currentIndex: index,
            onTap: (value) {
              index=value;
              setState(() {
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: '',),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
              isScrollControlled: true,
              context: context, builder: (context) {
            return Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskSheet());
          });
        },
        child: Icon(Icons.add,color: Colors.white,size: 30,),
        backgroundColor: Color(0xff5D9CEC),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),side: BorderSide(color: Colors.white,width: 3)
        ),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[index],
    );
  }

  List<Widget> tabs = [
    ToDoScreen(),
    SettingsScreen(),
  ];
}
