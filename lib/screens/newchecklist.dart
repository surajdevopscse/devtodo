import 'package:devtodo/screens/homepage.dart';
import 'package:flutter/material.dart';

class NewCheckList extends StatelessWidget {
  const NewCheckList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: newCheckList(),
    );
  }
}

class newCheckList extends StatefulWidget {
  @override
  _newCheckListState createState() => _newCheckListState();
}

class _newCheckListState extends State<newCheckList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 0,
        title: Text('Cheklist'),
        leading: IconButton(
          onPressed: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ))
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
