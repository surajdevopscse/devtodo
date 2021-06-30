import 'package:devtodo/screens/passwordchangedsuccess.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: resetPassword(),
    );
  }
}

class resetPassword extends StatefulWidget {
  @override
  _resetPasswordState createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Reset Password',
              style: TextStyle(fontSize: 35),
            ),
            Text(
              'Reset Code was sent to Your Mail Id.Please Enter the Code and Create a new Password',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Reset Code',
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            TextField(
              decoration: InputDecoration(hintText: '00000'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Password',
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Enter New Password '),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Confirm Password',
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Re-Enter Password'),
            ),
            Expanded(
              child: Center(
                child: InkWell(
                  onTap: passwordChanged,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color: Colors.redAccent,
                    ),
                    child: Text(
                      'Change Password',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void passwordChanged() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PasswordChangedSuccess()),
    );
  }
}
