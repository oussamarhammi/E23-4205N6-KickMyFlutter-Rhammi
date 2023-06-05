import 'package:flutter/material.dart';
import 'package:tp1/CreationTache.dart';

class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controllerusername= TextEditingController();
    final _controllerpassword= TextEditingController();
    String name= "";
    return Scaffold(
      drawer:Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('add task'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Deconnexion'),
              onTap: () {
                // Update the state of the app.
                // ...
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
          Text(name),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(32,0, 32,150),
            child:TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                foregroundColor:  MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text("Cree Tache "),
              onPressed:() async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreationTache()),
                );
              },
            ),
          ),
        ]
      )
    );
  }
}