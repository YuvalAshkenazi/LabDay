import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


final dummySnapshot = [
  {"Name": "Moshe", "MRN": "MRN 1", "Alert":true},
  {"Name": "Yossi", "MRN": "MRN 2", "Alert":false},
  /*{"name": "Abraham", "votes": 14},
  {"name": "Richard", "votes": 11},
  {"name": "Ike", "votes": 10},
  {"name": "Justin", "votes": 1},*/
];


class MyFirebasePage extends StatefulWidget {
  @override
  _MyFirebasePageState createState() {
    return _MyFirebasePageState();
  }
}

class _MyFirebasePageState extends State<MyFirebasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Patient alert')),
      body: _buildBody(context),
    );
  }


  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Patients').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.docs);
      },
    );
  }

  /*Widget _buildBody(BuildContext context) {
    // TODO: get actual snapshot from Cloud Firestore
    return _buildList(context, dummySnapshot);
  }*/

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

 /* Widget _buildListItem(BuildContext context, Map data) {
    final record = Record.fromMap(data);*/
  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
      final record = Record.fromSnapshot(data);
    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.MRN + '-' + record.name),
          trailing: Text(record.isAlert.toString()),
          tileColor:   record.isAlert  ? Colors.red: Colors.white,

          onTap: () => print(record),
        ),
      ),
    );
  }
}

class Record {
  final String name;
  final String MRN;
  bool _isAlert = false;
  //final int votes;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['Name'] != null),
        assert(map['MRN'] != null),
        name = map['Name'],
        MRN = map['MRN'],
        _isAlert=map['Alert'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  get  isAlert
  {
    if (_isAlert !=null)
      return _isAlert;
    else
      return false;
  }
  @override
  String toString() => "Record<$MRN-$name:$isAlert>";
}