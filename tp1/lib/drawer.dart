
import 'package:flutter/material.dart';

import 'Accueil.dart';
import 'CreationTache.dart';
import 'connexion.dart';
import 'lib_http.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key, required this.nomUtilisateur}) : super(key: key);
  final String? nomUtilisateur;
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {


  void postSignOUt() async{
    var response = await signout();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Connexion()),
    );
    print(response);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: widget.nomUtilisateur == null ?

      Container(
        color: const Color(0xAFFF0000),
        child: Padding(
          padding: const EdgeInsets.all(58.0),
          child: Text('non connecte'),
        ),
      )
          :

      ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text("welcome back "+ widget.nomUtilisateur!,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Accueil()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.add_box_rounded,
            ),
            title: const Text('add task'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreationTache()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
            ),
            title: const Text('Deconnexion'),
            onTap: () {
              // Update the state of the app.
              postSignOUt();
            },
          ),
        ],
      ),
    );
  }
}