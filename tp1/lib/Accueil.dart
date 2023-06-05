import 'package:flutter/material.dart';
import 'package:tp1/CreationTache.dart';
import 'package:tp1/transfer.dart';

import 'lib_http.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {

  List<HomeItemResponse> listtaches = [];
  Future<void> liste() async {
    var result = await home();
    if(result!= null)
    {
      listtaches =result;
    }
    setState(() { });

  }
  @override
  void initState(){
    liste();
  }

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
              ListView(
                padding: const EdgeInsets.all(8),
                children:<Widget> [

                ],
              ),
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