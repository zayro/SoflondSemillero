import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  final String title, message, type;
  const Alert({this.title, this.message, this.type});

  @override
  Widget build(BuildContext context) {
    Icon icono;

    switch (this.type) {
      case 'success':
        icono = Icon(Icons.check, size: 50, color: Colors.green);
        break;
      case 'warninig':
        icono = Icon(Icons.warning, size: 50, color: Colors.orange);
        break;
      case 'error':
        icono = Icon(Icons.error, size: 50, color: Colors.red);
        break;
      default:
    }
    return AlertDialog(
      title: Text(this.title),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            icono,
            Center(child: Text(this.message)),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
