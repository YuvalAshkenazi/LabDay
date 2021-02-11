import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Patient {
  String _id;
  String _MRNumber = '';
  String _fullName;
  DateTime _birthDate;
  Image _picture;
  String _pictureURL;
  String _nurseId = "";
  bool alertOn =false;
  DocumentReference reference;

  Patient(this._MRNumber, this._fullName, this._pictureURL) {
    if (_pictureURL.length > 0)
      try {
        //_picture = Image.network(_pictureURL);
        if (_fullName == 'Mati Caspi')
          _picture = Image(image: AssetImage('assets/matiCaspi.png'));
      } catch (e) {
        print(e);
      }
  }

  Patient.fromSnapshot(DocumentSnapshot doc)
  {

    _id = doc.id;
    _MRNumber =doc.data()['MRN'];
    _fullName=doc.data()['Name'];
    _nurseId=doc.data()['Nurse'];
    reference = doc.reference;

    if (_fullName == 'Mati Caspi') {
      _picture = Image(image: AssetImage('assets/matiCaspi.png'));
      print('Mati caspi picture');
    }
    if (doc.data()['Alert'] != null)
      alertOn = doc.data()['Alert'];

    print("Patient.overloadedConstructor $_MRNumber alert: $alertOn");

    /*CollectionReference tasks = doc.data()['Tasks'];
    if (doc.data()['Tasks'] != null) {
      print("patients $_fullName has tasks");
      CollectionReference tasks = doc.data()['Tasks'];
    }*/

  }


  String get MRNumber => _MRNumber;

  String get FullName => _fullName;

  DateTime get BirthDate => _birthDate;

  Image get Picture => _picture;
  String get Id =>_id;
  void set  Nurseid (String nurseName)
  {
    print(nurseName);
    print(_id);
    DocumentReference record = FirebaseFirestore.instance.collection('Patients').doc(_id);
    record.update({'Nurse': nurseName})
    .then((value) => _nurseId = nurseName)
    .catchError( (error) => print("Failed to update user: $error"));
    
  }
  String get Nurseid => _nurseId;
}
