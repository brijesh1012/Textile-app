import 'package:flutter/material.dart';
class Person extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Need of Job'),
      ),
      body: Container(child: Center(child: Text('Person in Need of Job',style: TextStyle(fontSize: 20,color: Colors.blueGrey),))),

    );
  }
}
