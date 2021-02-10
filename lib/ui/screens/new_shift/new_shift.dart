import 'package:flutter_app/bussiness_logic/models/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/screens/new_shift/patient_card.dart';
import 'package:flutter_app/ui/screens/new_shift/patient_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewShift extends StatelessWidget {
   //MyApp({Key key, @required this.items}) : super(key: key);
  NewShift({Key key}) : super(key: key) {
    }

  @override
  Widget build(BuildContext context) {
    final title = 'New Shift';
    //var route = ModalRoute.of(context).settings.name;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body:PatientInformation(),
    );
  }

}


class PatientInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference patient = FirebaseFirestore.instance.collection('Patients');

    return StreamBuilder<QuerySnapshot>(
      stream: patient.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return LinearProgressIndicator(backgroundColor: Colors.yellow,);
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return PatientStateCard( PatientItem(Patient.overloadedConstructor(document)));
          }).toList()
        );
      },
    );
  }
}

