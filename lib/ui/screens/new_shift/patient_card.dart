import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/screens/new_shift/patient_item.dart';
import 'package:flutter_app/ui/screens/patients/patientPage.dart';

class PatientStateCard extends StatefulWidget {
  PatientItem item;

  PatientStateCard(this.item);

  @override
  PatientCard createState() => PatientCard(item);
}

class PatientCard extends State<PatientStateCard> {
  PatientItem item;
  bool _isSelectedPatient = false;

  PatientCard(this.item)
  {
    if (item.patient.Nurseid == 'Itai') {
      print('Turn on the switch');
      _isSelectedPatient = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.0),
      child: Card(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PatientPage(
                              patient: item.patient,
                            )));
              },

              title: item.buildTitle(context),
              subtitle: item.buildSubtitle(context),
              //value: false,
              leading: CircleAvatar(
                backgroundColor: Colors.brown.shade700,
                child: item.buildLeftImage(context),
              ),
              trailing: Switch(
                autofocus: true,

                  value: _isSelectedPatient,
                  onChanged: (value) {
                    setState(() {
                      _isSelectedPatient = !_isSelectedPatient;
                      if (_isSelectedPatient)
                        item.patient.Nurseid = "Itai";
                      else
                        item.patient.Nurseid = "";

                    });
                  },
                  activeColor: Colors.green,
                ),
              )),
    );
  }
}
