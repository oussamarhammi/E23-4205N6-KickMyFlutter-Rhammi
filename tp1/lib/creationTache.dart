

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tp1/drawer.dart';
import 'package:tp1/transfer.dart';
import 'package:tp1/username.dart';
import 'accueil.dart';
import 'connexion.dart';
import 'lib_http.dart';
class CreationTache extends StatefulWidget {
  const CreationTache({Key? key}) : super(key: key);

  @override
  State<CreationTache> createState() => _CreationTache();
}




class _CreationTache extends State<CreationTache> {


  String _selectedDate = 'choisi la date';
  final _controllertache = TextEditingController();
  DateTime today = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2010), lastDate: DateTime(2030),);
    if (d != null)
      setState(() {
        _selectedDate = d.toLocal().toString();
        today = d;
      });
  }

  void postSignOUt() async{
    var response = await signout();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Connexion()),
    );
    print(response);
    setState(() {});
  }

  void postAddTaskRequest() async {
    try{
      AddTaskRequest req = AddTaskRequest();
      req.name = _controllertache.text;
      req.deadline = today;
        var response = await addtask(req);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Accueil()),
        );
        print(response);
        setState(() {});
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
      drawer:MyDrawer(nomUtilisateur: usernamebonbon),
      appBar: AppBar(
        title: Text('Creation tache'),
      ),
      body:
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: TextField(
                          controller: _controllertache,
                          decoration: InputDecoration(
                            labelText: 'Tache',
                            hintText: 'nom de la tache',
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(30,0, 62,32),
                      ),
                      Container(
                        child:Row(
                          children: <Widget>[
                            Text(_selectedDate
                            ),
                            IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () {
                                _selectDate(context);
                              },
                            ),
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(30,0, 62,10),

                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(62,0, 62,0),
                        child:TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                            foregroundColor:  MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          child: Text("Ajouter"),
                          onPressed:() async {
                            postAddTaskRequest();
                          },
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.blue,
                        width: 4,
                      )),
                ),
              ],
            ),
            padding: EdgeInsets.fromLTRB(30,0, 30,0),
          ),
    );
  }
}