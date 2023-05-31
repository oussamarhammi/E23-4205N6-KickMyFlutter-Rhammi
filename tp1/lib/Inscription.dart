import 'package:flutter/material.dart';
import 'package:tp1/Accueil.dart';

class Inscription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controllerusername= TextEditingController();
    final _controllerpassword= TextEditingController();
    String name= "";
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
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
          Container(
            child: TextField(
              controller: _controllerpassword,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
            ),
            padding: EdgeInsets.fromLTRB(32,1, 32, 20),
          ),
          Container(
            child: TextField(
              controller: _controllerpassword,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                hintText: 'Enter your Confirmed password',
              ),
            ),
            padding: EdgeInsets.fromLTRB(32,1, 32, 20),
          ),
          Container(
            width: double.infinity,
            child:TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                foregroundColor:  MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text("Connexion "),
              onPressed:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Accueil()),
                );

              },
            ),
            padding: EdgeInsets.fromLTRB(32,0, 32,150),
          ),
        ],

      ),
    );
  }
}