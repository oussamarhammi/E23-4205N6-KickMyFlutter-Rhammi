
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Accueil.dart';
import 'CreationTache.dart';
import 'connexion.dart';
import 'lib_http.dart';

class Consultation extends StatefulWidget {
  const Consultation({Key? key}) : super(key: key);

  @override
  State<Consultation> createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
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
    return Scaffold(
      drawer:Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text("welcome back"),
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
      ),
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text("Nom: ")
              ),
          Container(
              child: Text("date d'échéance: ")
          ),
          Container(
              child: Text("Avancement: ")
          ),
          Container(
              child: Text("temps écoulé: ")
          ),
          Container(
            width: double.infinity,
            child:TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                foregroundColor:  MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text("Modifier "),
              onPressed:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreationTache()),
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
