import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp1/drawer.dart';
import 'package:tp1/transfer.dart';
import 'package:tp1/username.dart';

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
  double _value = 0;
  TaskDetailResponse taskDetailResponse = TaskDetailResponse();

  void postSignOUt() async {
    var response = await signout();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Connexion()),
    );
    print(response);
    setState(() {});
  }

  void getdetail() async {
    try {
      taskDetailResponse = await detail(widget.id.toString());
      print(taskDetailResponse);
      setState(() {});
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erreur reseau'),
      ));
    }
  }

  @override
  void initState() {
    getdetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:MyDrawer(nomUtilisateur: usernamebonbon),
      appBar: AppBar(
        title: Text('Consultation'),
      ),
      body:
      Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Column(
                  children: [
                    Container(child: Text("Nom: " + taskDetailResponse.name,style: TextStyle(fontWeight: FontWeight.bold))),
                    Container(
                        child: Text("date d'échéance: " +
                            taskDetailResponse.deadline.toString(),style:TextStyle(fontWeight: FontWeight.bold)),
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    ),
                    Container(
                        child: Text("Avancement: " + taskDetailResponse.percentageDone.toString()+ " %",
                            style:TextStyle(fontWeight: FontWeight.bold)),
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    ),
                    Container(
                        child: Text("temps écoulé: " + taskDetailResponse.percentageTimeSpent.toString()+ " jours"
                            ,style:TextStyle(fontWeight: FontWeight.bold))
                        ,padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    ),
                    Container(
                        child: Column(
                          children: [
                            Slider(
                              min: 0.0,
                              max: 100.0,
                              value: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                            ),
                            Text(_value.toStringAsFixed(0))
                          ],
                        )),
                    Container(
                      width: double.infinity,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: Text("Modifier "),
                        onPressed: () {
                          progress(widget.id, _value.toInt());
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Accueil()),
                          );
                          setState(() {});
                        },
                      ),
                      padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                    ),
                  ],
                ),
                padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.blue,
                    width: 4,
                  ),
                ),
              ),
            ],
          ),
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        ),
    );
  }
}
