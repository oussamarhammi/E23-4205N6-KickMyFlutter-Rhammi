
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp1/transfer.dart';

import 'Accueil.dart';
import 'CreationTache.dart';
import 'connexion.dart';
import 'lib_http.dart';

class Consultation extends StatefulWidget {
  const Consultation({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<Consultation> createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {

  TaskDetailResponse taskDetailResponse = TaskDetailResponse();
  void postSignOUt() async{
    var response = await signout();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Connexion()),
    );
    print(response);
    setState(() {});
  }
  void getdetail() async {
    try{
      var response = await detail(widget.id.toString()) ;
      print(response);
      setState(() {});
    }
    catch(e){
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur reseau'),
          ));
    }
  }
  @override
  void initState(){
    getdetail();
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
            child: Text("Nom: "+ taskDetailResponse.name)
              ),
          Container(
              child: Text("date d'échéance: " + taskDetailResponse.deadline.toString())
          ),
          Container(
              child: Text("Avancement: "+ taskDetailResponse.percentageDone.toString())
          ),
          Container(
              child: Text("temps écoulé: "+ taskDetailResponse.percentageTimeSpent.toString())
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
