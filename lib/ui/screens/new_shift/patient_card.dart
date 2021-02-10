import 'package:flutter/material.dart';
import 'package:flutter_app/bussiness_logic/models/patient.dart';
import 'package:flutter_app/ui/screens/new_shift/patient_item.dart';
import 'package:flutter_app/ui/screens/patients/patientPage.dart';

class PatientCard extends StatelessWidget {
  PatientItem item;

  PatientCard(this.item);

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
                    builder: (context) => PatientPage(
                        patient: Patient('NRN 3', 'Mati Caspi',
                            'https://www.maariv.co.il/HttpHandlers/ShowImage.ashx?id=322703&w=500&h=380')),
                  ));
            },
            title: item.buildTitle(context),
            subtitle: item.buildSubtitle(context),
            //value: false,
            leading: CircleAvatar(
              backgroundColor: Colors.brown.shade800,
              child: item.buildLeftImage(context),
            ),
            trailing: Switch(
              value: false,
            ),
          )),
    );
  }
}
