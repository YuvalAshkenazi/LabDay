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

  Patient.overloadedConstructor(DocumentSnapshot doc)
  {

    _id = doc.id;
    _MRNumber =doc.data()['MRN'];
    _fullName=doc.data()['Name'];
    _nurseId=doc.data()['Nurse'];


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
