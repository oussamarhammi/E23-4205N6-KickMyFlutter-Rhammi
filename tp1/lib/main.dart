import 'package:flutter/material.dart';
import 'package:tp1/Accueil.dart';

import 'Inscription.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TextFieldScreen(),
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
  String name= "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                  foregroundColor:  MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text("Connexion "),
               onPressed:(){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Accueil()),
                 );
                setState(() {
                  name =_controllerusername.text;
                });
               },
              ),
              padding: EdgeInsets.all(32),
            ),
          Container(
            width: double.infinity,
            child:TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                foregroundColor:  MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text("Inscription "),
              onPressed:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Inscription()),
                );
                setState(() {
                  name =_controllerusername.text;
                });
              },
            ),
            padding: EdgeInsets.fromLTRB(32,0, 32, 0),
          ),
        ],

      ),
    );
  }
}
