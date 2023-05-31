import 'package:flutter/material.dart';

class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controllerusername= TextEditingController();
    final _controllerpassword= TextEditingController();
    String name= "";
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(name),
          Container(
            child: TextField(
              controller: _controllerusername,
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Enter your username',
              ),
            ),
            padding: EdgeInsets.fromLTRB(32,1, 32, 20),
          ),
        ]
      )
    );
  }
}