import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tp1/accueil.dart';
import 'package:tp1/drawer.dart';
import 'package:tp1/transfer.dart';
import 'package:tp1/username.dart';

import 'lib_http.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  State<Inscription> createState() => _Inscription();
}

class _Inscription extends State<Inscription> {
  final _controllerusername= TextEditingController();
  final _controllerpassword= TextEditingController();
  final _controllerconfirmedpassword= TextEditingController();
  SigninResponse signinresponse = SigninResponse();
  String name= "";
  String password = "";
  void postSignuprequest() async {
    try{
      SignupRequest req = SignupRequest();
      req.username = _controllerusername.text;
      req.password = _controllerpassword.text;
      if(req.password != _controllerconfirmedpassword.text){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('mot de passe non identique'),
            ));
      }else{
      var response = await signup(req);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Accueil()),
      );
      print(response);
      setState(() {});
      }
    } on Exception catch(e) {
      print(e);

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()),
          ));

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
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
                    padding: EdgeInsets.all(15),
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
                    padding: EdgeInsets.all(15),
                  ),
                  Container(
                    child: TextField(
                      controller: _controllerconfirmedpassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        hintText: 'Enter your password',
                      ),
                    ),
                    padding: EdgeInsets.all(15),
                  ),
                  Container(
                    width: double.infinity,
                    child:TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        foregroundColor:  MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      child: Text("Inscription "),
                      onPressed:() async{
                        postSignuprequest ();
                        usernamebonbon = _controllerusername.text;
                        MyDrawer(nomUtilisateur: usernamebonbon);
                        setState(() {});
                      },
                    ),
                    padding:EdgeInsets.fromLTRB(30,5, 30,5),
                  ),
                ],
              ),
              padding: EdgeInsets.fromLTRB(32,0, 32, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.blue,
                    width: 4,
                  )
              ),
            ),
          ],
        ),
        padding:EdgeInsets.fromLTRB(30,0, 30,0),
      ),
    );
  }
}