import 'package:flutter/cupertino.dart';
import 'package:flutter_app/services/patient_helper.dart';

class PatientComponent {
  static Widget getPatientAvatar(
      BuildContext context, String id, Image patientPicture) {
    return (Hero(
        tag: id,
        child: patientPicture == null
            ? Text(PatientHelper.getAvatarText(id))
            : patientPicture));
  }
}
