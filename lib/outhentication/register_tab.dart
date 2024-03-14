import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_app_flutter/fire_base/firebase_function.dart';
import 'package:todo_app_flutter/ui/home/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'registerScreen';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Map userData = {};
  final _formkey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 28,
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
                  SizedBox(
                    height: 28,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      controller: firstNameController,
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter your first name';
                        }
                        return null;
                      }),
                      decoration: InputDecoration(
                          hintText: 'Enter first Name',
                          labelText: 'first named',
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.green,
                          ),
                          errorStyle: TextStyle(fontSize: 18.0),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0)))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: secondNameController,
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter your last name';
                        }
                        return null;
                      }),

                      decoration: InputDecoration(
                          hintText: 'Enter last Name',
                          labelText: 'Last named',
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          errorStyle: TextStyle(fontSize: 18.0),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0)))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: emailController,
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter your email';
                        }
                        return null;
                      }),

                      decoration: InputDecoration(
                          hintText: 'Email',
                          labelText: 'Email',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.lightBlue,
                          ),
                          errorStyle: TextStyle(fontSize: 18.0),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0)))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: passwordController,
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter your password';
                        }
                        return null;
                      }),

                      decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.lightBlue,
                          ),
                          errorStyle: TextStyle(fontSize: 18.0),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0)))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller:  mobileController,
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter your first Mobile'  ;
                        }
                        return null;
                      }),

                      decoration: InputDecoration(
                          hintText: 'Mobile',
                          labelText: 'Mobile',
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9)))),
                    ),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      // margin: EdgeInsets.fromLTRB(200, 20, 50, 0),
                      child: ElevatedButton(
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            FireBaseFunctions.createAcount(emailController.text,passwordController.text,
                                (){
                              Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
                                },(errorMessage){
                              showDialog(context: context, builder: (context) {
                                return AlertDialog(
                                  title: const Text(
                                    'Error',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  content: Text(errorMessage),
                                  actions: [
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
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },);
                                });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),

                      width: MediaQuery.of(context).size.width,

                      height: 50,
                    ),
                  )),
                ],
              )),
        ));
  }
}
