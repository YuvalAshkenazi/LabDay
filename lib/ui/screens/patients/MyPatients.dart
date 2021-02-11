import 'package:flutter_app/bussiness_logic/models/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/screens/new_shift/patient_card.dart';
import 'package:flutter_app/ui/screens/new_shift/patient_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyPatients extends StatelessWidget {
  //MyApp({Key key, @required this.items}) : super(key: key);
  MyPatients({Key key}) : super(key: key) {
  }

  @override
  Widget build(BuildContext context) {
    final title = 'My Patients';
    //var route = ModalRoute.of(context).settings.name;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body:MyPatientInformation(),
    );
  }

}

class MyPatientInformation extends StatefulWidget {
  @override
  _MyPatientInformationState createState() => _MyPatientInformationState();
}

class _MyPatientInformationState extends State<MyPatientInformation> {
  //Patient _patient;
  @override
  Widget build(BuildContext context) {
    CollectionReference patient = FirebaseFirestore.instance.collection('Patients');

    return StreamBuilder<QuerySnapshot>(
      stream: patient.snapshots(),
      builder: ( context,  snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return LinearProgressIndicator(backgroundColor: Colors.yellow,);
        }

        return _BuildListView(context,snapshot.data.docs);
      },
    );
  }

  ListView _BuildListView(BuildContext context,List<DocumentSnapshot> snapshot) {
    return ListView(
        children: snapshot.where((element) => element.data()['Nurse']=='Itai').map((DocumentSnapshot document) {
          return _BuildItem(context,document);
        }).toList()
    );
  }

  PatientStateCard _BuildItem(BuildContext context,DocumentSnapshot document) {

    final _patient = Patient.fromSnapshot(document);
    return PatientStateCard( PatientItem(_patient));
  }
}

