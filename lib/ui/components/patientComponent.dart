import 'package:flutter/cupertino.dart';
import 'package:flutter_app/services/patient_helper.dart';

class PatientComponent {
  static Widget getPatientAvatar(
      BuildContext context, String fullName, Image patientPicture) {
    return (Hero(
        tag: fullName,
        child: patientPicture == null
            ? Text(PatientHelper.getAvatarText(fullName))
            : patientPicture));
  }
}
