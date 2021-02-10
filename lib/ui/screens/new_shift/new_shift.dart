import 'package:flutter_app/bussiness_logic/models/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/screens/new_shift/patient_card.dart';
import 'package:flutter_app/ui/screens/new_shift/patient_item.dart';

class NewShift extends StatelessWidget {
  List<Patient> items;

  //MyApp({Key key, @required this.items}) : super(key: key);
  NewShift({Key key}) : super(key: key) {
    this.items = LoadPatients();
  }

  @override
  Widget build(BuildContext context) {
    final title = 'New Shift';
    //var route = ModalRoute.of(context).settings.name;
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: items.length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = PatientItem(items[index]);

            return PatientCard(item);
          },
        ),
      );
  }

  List<Patient> LoadPatients() {
    List<Patient> PatientList = List<Patient>();
    PatientList.add(Patient('NRN 1', 'John Smith', ''));
    PatientList.add(Patient('NRN 2', 'Moshe Yacov', ''));
    PatientList.add(Patient('NRN 3', 'Mati Caspi',
        'https://www.maariv.co.il/HttpHandlers/ShowImage.ashx?id=322703&w=500&h=380'));

    return PatientList;
  }
}
