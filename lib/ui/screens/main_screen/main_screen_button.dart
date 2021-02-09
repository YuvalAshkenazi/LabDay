import 'package:flutter/material.dart';

class MainScreenButton extends StatefulWidget {
  MainScreenButton(
      {@required this.text, @required this.iconData, this.onPressed});

  final IconData iconData;
  final String text;
  Function onPressed;

  @override
  _MainScreenButtonState createState() => _MainScreenButtonState();

  void _OnClick() {
    if (onPressed == null) return;
    onPressed();
  }
}

class _MainScreenButtonState extends State<MainScreenButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: RawMaterialButton(
            elevation: 0.0,
            child: Icon(
              widget.iconData,
              size: 50,
              color: Colors.white,
              semanticLabel: widget.text,
            ),
            onPressed: widget.onPressed,
            constraints: BoxConstraints.tightFor(
              width: 150.0,
              height: 150.0,
            ),
            shape: CircleBorder(),
            fillColor: widget.onPressed == null ? Colors.grey : Colors.blue,
            enableFeedback: widget.onPressed == null,
          ),
        ),
        Text(widget.text,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black))
      ],
    );
  }
}
