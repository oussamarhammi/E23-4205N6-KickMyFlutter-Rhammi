


import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp1/drawer.dart';
import 'package:tp1/lib_http.dart';
import 'package:tp1/transfer.dart';
import 'package:tp1/username.dart';

import 'accueil.dart';
import 'Inscription.dart';

class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  State<Connexion> createState() => _Connexion();
}
class _Connexion extends State<Connexion> {
  final _controllerusername= TextEditingController();
  final _controllerpassword= TextEditingController();
  String name= "";
  String password = "";
  SigninResponse signupresponse = SigninResponse();
  final dio = Dio();
  void postSigninrequest() async {
    try {
      SigninRequest req = SigninRequest();
      req.username = _controllerusername.text;
      req.password = _controllerpassword.text;
      var response = await signin(req);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Accueil()),
      );
      print(response);
      setState(() {});
    } on Exception catch (e) {
      print(e);

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()),
          ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: TextField(
              controller: _controllerusername,
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Enter your username',
              ),
            ),
            padding: EdgeInsets.all(32),
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
            padding: EdgeInsets.all(32),
          ),
          Container(
            width: double.infinity,
            child:TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                foregroundColor:  MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text("Connexion "),
              onPressed:() async{
                postSigninrequest ();
                usernamebonbon = _controllerusername.text;
                MyDrawer(nomUtilisateur: usernamebonbon);
                setState(() {});
              },
            ),
            padding: EdgeInsets.all(32),
          ),
          Container(
            width: double.infinity,
            child:TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                foregroundColor:  MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text("Inscription "),
              onPressed:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Inscription()),
                );
              },
            ),
            padding: EdgeInsets.fromLTRB(32,0, 32, 0),
          ),
        ],

      ),
    );
  }
}
