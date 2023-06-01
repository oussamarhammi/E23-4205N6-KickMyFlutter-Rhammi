import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tp1/Accueil.dart';
import 'package:tp1/transfer.dart';

import 'lib_http.dart';



class Inscription extends StatelessWidget {
  const Inscription({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Inscription(),
    );
  }
}
class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({Key? key}) : super(key: key);

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  final _controllerusername= TextEditingController();
  final _controllerpassword= TextEditingController();
  SignupResponse signupresponse = SignupResponse();
  String name= "";
  String password = "";
  void postSignuprequest() async {
    try{
      SignupRequest req = SignupRequest();
      req.username = name;
      req.password = password;
      var response = await signup(req);
      print(response);
      setState(() {});
    }on DioError catch(e){
      print(e);
      String message = e.response!.data;
      if(message == "BadCredentialsException") {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('login deja utilisé'),
            ));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('erreurserveur'),
            ));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    final _controllerusername= TextEditingController();
    final _controllerpassword= TextEditingController();
    String name= "";
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscription'),
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
            padding: EdgeInsets.fromLTRB(32,0, 32,150),
            child:TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                foregroundColor:  MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text("Connexion "),
              onPressed:() async {
                postSignuprequest();
              },
            ),
          ),
        ],

      ),
    );
  }
}