

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tp1/transfer.dart';
import 'Accueil.dart';
import 'lib_http.dart';
class CreationTache extends StatefulWidget {
  const CreationTache({Key? key}) : super(key: key);

  @override
  State<CreationTache> createState() => _CreationTache();
}

class _CreationTache extends State<CreationTache> {
  final _controllertache = TextEditingController();
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day,DateTime focusedDay){
    setState(() {
      today = day;
    });
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
      appBar: AppBar(
        title: Text('Creation tache'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: TextField(
              controller: _controllertache,
              decoration: InputDecoration(
                labelText: 'Tache',
                hintText: 'nom de la tache',
              ),
            ),
            padding: EdgeInsets.fromLTRB(32, 1, 32, 20),
          ),
          Container(
            child: TableCalendar(
              locale: "en_US",
              rowHeight: 43,
              headerStyle:
              HeaderStyle(formatButtonVisible: false, titleCentered: true),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day)=> isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2010,09,20),
              lastDay: DateTime.utc(2030,3,14),
              onDaySelected: _onDaySelected,
            ),
          ),
          Container(
              child: Text("Selected day = "+today.toString().split(" ",)[0]),
            padding: const EdgeInsets.all(20.0) ,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(32,0, 32,150),
            child:TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                foregroundColor:  MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text("Ajouter"),
              onPressed:() async {
                postAddTaskRequest();

              },
            ),
          ),


        ],

      ),
    );
  }
}