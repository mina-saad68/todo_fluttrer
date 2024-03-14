import 'package:flutter/material.dart';
import 'package:todo_app_flutter/outhentication/register_tab.dart';
import 'package:todo_app_flutter/ui/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'loginscreen';

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'To Do',
                    style: TextStyle(
                        color: Color(0xFF5D9CEC),
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 35),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Color(0xFF5D9CEC),
                  ),
                ),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, HomeScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff5D9CEC)),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF5D9CEC),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterScreen.routeName);
                    },
                  )
                ],
              ),
            ],
          )),
    );
  }
}
