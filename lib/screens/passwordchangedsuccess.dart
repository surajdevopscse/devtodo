import 'package:devtodo/main.dart';
import 'package:devtodo/screens/homepage.dart';
import 'package:devtodo/screens/loginpage.dart';
import 'package:flutter/material.dart';

class PasswordChangedSuccess extends StatelessWidget {
  const PasswordChangedSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: passwordChangedSuccess(),
    );
  }
}

class passwordChangedSuccess extends StatefulWidget {
  @override
  _passwordChangedSuccessState createState() => _passwordChangedSuccessState();
}

class _passwordChangedSuccessState extends State<passwordChangedSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/passwordchange.png'))),
          ),
          SizedBox(
            height: 70,
          ),
          Center(
            child: InkWell(
              onTap: openHomePage,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  color: Colors.redAccent,
                ),
                child: Text(
                  'Continue...',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void openHomePage() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
  }
}
