import 'package:flutter/material.dart';

class Patient {
  String _MRNumber = '';
  String _fullName;
  DateTime _birthDate;
  Image _picture;
  final String _pictureURL;
  String nurseId = "";

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

  String get MRNumber => _MRNumber;

  String get FullName => _fullName;

  DateTime get BirthDate => _birthDate;

  Image get Picture => _picture;
}
