import 'package:flutter/material.dart';
import 'package:tp1/CreationTache.dart';
import 'package:tp1/transfer.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tp1/username.dart';

import 'Consultation.dart';
import 'connexion.dart';
import 'drawer.dart';
import 'lib_http.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {

  List<HomeItemResponse> listtaches = [];

  bool Loading =false;

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
    return Scaffold(
       drawer: MyDrawer(nomUtilisateur:usernamebonbon),
        appBar: AppBar(
          title: Text('Accueil'),
        ),
        body:ListView.separated(
          itemCount: listtaches.length,
          itemBuilder: ( BuildContext context,int index) {
            return Container(
              color: index.isEven ? Colors.green : Colors.blue,
              child:
                ListTile(
                  trailing: Icon(Icons.info),
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(listtaches[index].id.toString()),
                      SizedBox(width: 10),
                       Text(listtaches[index].name),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LinearPercentIndicator(
                        width: 300.0,
                        lineHeight: 14.0,
                        percent:double.parse((listtaches[index].percentageDone/100).toString()),
                        center:Text(listtaches[index].percentageDone.toString(),
                          style: new TextStyle(fontSize: 12.0),
                        ),
                        barRadius: const Radius.circular(16),
                        backgroundColor: Colors.grey,
                        progressColor: Colors.orange,
                      ),
                      Row(
                        children: [
                          Text(listtaches[index].deadline.toString(),
                            style: new TextStyle(fontSize: 15.0)),
                          SizedBox(width:50),
                          Text(listtaches[index].percentageTimeSpent.toString() + " jours"),
                        ],
                      )

                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Consultation(id: int.parse(listtaches[index].id.toString()))),
                    );
                  },

                ),


            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        )
    );
  }
}