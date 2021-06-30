import 'package:devtodo/screens/resetpassword.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: forgotPassword(),
    );
  }
}

class forgotPassword extends StatefulWidget {
  @override
  _forgotPasswordState createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
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
              'Forgot Password!',
              style: TextStyle(fontSize: 35),
            ),
            Text(
              'Please Enter Your Mail Id to Recieve Your Password Information',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Mail Id!',
              style: TextStyle(fontSize: 25),
            ),
            TextField(
              decoration:
                  InputDecoration(hintText: 'suraj.devops.cse@gmail.com'),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: InkWell(
                onTap: openResetPassword,
                child: Center(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 130, vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color: Colors.redAccent),
                  child: Text(
                    'Send Request',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  void openResetPassword() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResetPassword(),
        ));
  }
}
