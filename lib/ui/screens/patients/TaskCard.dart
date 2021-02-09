import 'package:flutter/material.dart';
import 'package:flutter_app/bussiness_logic/models/INurseTask.dart';
import 'package:flutter_app/ui/components/IListItem.dart';

class TaskCard extends StatelessWidget {
  TaskCard({
    Key key,
    this.listItem,
  }) : super(key: key);

  IListItem listItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Card(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: ListTile(
            title: listItem.buildTitle(context),
            subtitle: listItem.buildSubtitle(context),
            leading: CircleAvatar(
              backgroundColor: Colors.brown.shade800,
              child: listItem.buildLeftImage(context),
            ),
          )),
      /*child: Row(children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                nurseTask.getTaskHeader(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20),
              ), //Text

              const Padding(padding: EdgeInsets.only(bottom: 2.0)),

              Text(
                nurseTask.getTaskDetails(),
                maxLines: 1,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                    fontSize: 15),
              ),

              Text(
                nurseTask.isDone().toString(),
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).primaryColor,
                    fontSize: 15),
              ), //Text
            ],
          ), //Column
        ),
      ]),*/
    );
  } //build()

}
