import 'package:flutter/material.dart';
import 'package:flutter_app/bussiness_logic/models/patient.dart';
import 'package:flutter_app/services/patient_helper.dart';
import 'package:flutter_app/ui/components/IListItem.dart';
import 'package:flutter_app/ui/components/patientComponent.dart';

class PatientItem implements IListItem {
  final Patient patient;

  //final String body;

  PatientItem(this.patient) {}

  Widget buildTitle(BuildContext context) =>
      Text(patient.MRNumber + "          "+ "Nurse: " + patient.nurseId);

  Widget buildSubtitle(BuildContext context) => Text(patient.FullName);

  Widget buildLeftImage(BuildContext context) =>
      PatientComponent.getPatientAvatar(
          context, patient.FullName, patient.Picture);
}
