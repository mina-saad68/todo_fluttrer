import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_flutter/outhentication/login_tab.dart';
import 'package:todo_app_flutter/outhentication/register_tab.dart';
import 'package:todo_app_flutter/ui/home/home_screen.dart';
import 'package:todo_app_flutter/ui/settings/settings_tab.dart';
import 'package:todo_app_flutter/ui/splash/splash.dart';
import 'package:todo_app_flutter/ui/todo_list/edit_task.dart';
import 'package:todo_app_flutter/ui/todo_list/todo_tab.dart';

import 'firebase_options.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
 @override
  Widget build(BuildContext context) {
    return MaterialApp(


      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xff5D9CEC),
          titleTextStyle: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            unselectedIconTheme: IconThemeData(
                color: Colors.grey,
                size: 28
            ),
            selectedIconTheme: IconThemeData(
                color: Color(0xff5D9CEC),
                size: 30
            ),
            showSelectedLabels: false,
            showUnselectedLabels: false
        ),

      ),


      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName : (context) => SplashScreen(),
        HomeScreen.routeName : (context) => HomeScreen(),
        ToDoScreen.routeName : (context) => ToDoScreen(),
        SettingsScreen.routeName : (context) => SettingsScreen(),
        EditTask.routeName : (context) => EditTask(),
        LoginScreen.routeName : (context) => LoginScreen(),
        RegisterScreen.routeName : (context) => RegisterScreen(),
      },
    );
  }
}