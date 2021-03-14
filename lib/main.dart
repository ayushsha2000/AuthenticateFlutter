import 'package:authentication/provider/auth.dart';
import 'package:authentication/screens/login.dart';
//import 'package:authentication/screens/mainpage.dart';
import 'package:authentication/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Authentication',
          // theme: ThemeData(
          //   primarySwatch: Colors.black,
          // ),
          home: Register(),
          routes: {
            Register.routeName: (context) => Register(),
            Login.routeName: (context) => Login(),
            //MainPage.routeName: (context) => MainPage(),
          }),
    );
  }
}
