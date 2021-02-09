import 'package:flutter/material.dart';
import 'package:flutter_app/bussiness_logic/models/patient.dart';
import 'package:flutter_app/services/patient_helper.dart';
import 'package:flutter_app/ui/components/IListItem.dart';
import 'package:flutter_app/ui/components/patientComponent.dart';

class PatientItem implements IListItem {
  final Patient _patient;

  //final String body;

  PatientItem(this._patient);

  Widget buildTitle(BuildContext context) => Text(_patient.MRNumber);

  Widget buildSubtitle(BuildContext context) => Text(_patient.FullName);

  Widget buildLeftImage(BuildContext context) =>
      PatientComponent.getPatientAvatar(
          context, _patient.FullName, _patient.Picture);
}
