import 'package:flutter/material.dart';
import 'package:todo_app_flutter/ui/home/home_screen.dart';
import 'package:todo_app_flutter/ui/settings_tab/settings_tab.dart';
import 'package:todo_app_flutter/ui/splash/splash.dart';
import 'package:todo_app_flutter/ui/theme/themes.dart';
import 'package:todo_app_flutter/ui/todo_list_tab/todo_tab.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
 @override
  Widget build(BuildContext context) {
    return MaterialApp(


      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName : (context) => SplashScreen(),
        HomeScreen.routeName : (context) => HomeScreen(),
        ToDoScreen.routeName : (context) => ToDoScreen(),
        SettingScreen.routeName : (context) => SettingScreen(),
      },
    );
  }
}