import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/services/patient_helper.dart';

class PatientComponent {
  static Widget getPatientAvatar(
      BuildContext context, String id, Image patientPicture, bool alertOn) {
    return (Hero(
        tag: id,
        child: alertOn == true ?
            Icon (Icons.add_alert, color: Colors.red,) :
            (patientPicture == null
            ? Text(PatientHelper.getAvatarText(id))
            : patientPicture)));
  }
}
