import 'dart:async';

import 'package:devtodo/screens/loginpage.dart';
import 'package:devtodo/widgets/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          backgroundColor: Colors.red,
        ),
        home: MyHomePage(),
        //initialRoute: MyHomePage.routeName,
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          OnBoarding.routeName: (context) => OnBoarding(),
          LoginPage.routeName: (context) => LoginPage(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  // static final String routeName = '/homePage';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), openOnBoard);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
        ),
      ),
    );
  }

  void openOnBoard() {
    Navigator.pushNamed(context, OnBoarding.routeName);
  }
}
