
import 'package:flutter/material.dart';
class Localshops extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Local Shops'),
        ),
        body: Container(child: Center(child: Text('Local Shops',style: TextStyle(fontSize: 20,color: Colors.blueGrey),))),

    );
  }
}
