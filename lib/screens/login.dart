//import 'dart:convert';
import 'package:authentication/models/http_exception.dart';
import 'package:provider/provider.dart';
import 'package:authentication/provider/auth.dart';
//import 'package:authentication/screens/dialog.dart';
import 'package:authentication/screens/register.dart';
//import 'package:authentication/screens/mainpage.dart';
//import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static const routeName = 'Login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  void showSnackBar(String title) {
    final snackBar = SnackBar(
      content: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15.0),
      ),
    );
    // ignore: deprecated_member_use
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('An Error Occured'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Okay'))
        ],
      ),
    );
  }

  Future<void> loginUser() async {
    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) => DialogBox(data: 'Logging You'));
    try {
      await Provider.of<Auth>(context, listen: false)
          .login(emailController.text.trim(), passwordController.text);
      //Navigator.pop(context);
    } on HttpException catch (error) {
      var errorMessage = 'Authentication Failed';
      if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Email not Found';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Password is not valid';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage = 'Could not Authenticate you, Please try again later';
      _showErrorDialog(errorMessage);
    }
    //Navigator.pop(context);
    //Navigator.pushNamed(context, MainPage.routeName);
  }

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                        spreadRadius: 5.0,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                  child: Image(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    image: NetworkImage(
                        'https://image.flaticon.com/icons/png/512/1078/1078454.png'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Login as an URL Saver',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 1.0),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                              spreadRadius: 5.0,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: TextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  fontSize: 14.0, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                              spreadRadius: 5.0,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  fontSize: 14.0, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                GestureDetector(
                  onTap: () {
                    if (!emailController.text.contains('@')) {
                      showSnackBar('Plaese provide an valid Email id');
                      return;
                    }
                    if (passwordController.text.length < 8) {
                      showSnackBar(
                          'please use passwords upto 8 characters long');
                      return;
                    }
                    loginUser();
                  },
                  child: Container(
                    height: 35,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                          spreadRadius: 5.0,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Register.routeName);
                  },
                  child: Text(
                    'Don\'t have an account ! Do Register',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
