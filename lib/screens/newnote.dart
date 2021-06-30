import 'package:devtodo/screens/homepage.dart';
import 'package:flutter/material.dart';

class NewNote extends StatelessWidget {
  const NewNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: newNote(),
    );
  }
}

class newNote extends StatefulWidget {
  @override
  _newNoteState createState() => _newNoteState();
}

class _newNoteState extends State<newNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 0,
        title: Text('New Note'),
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
