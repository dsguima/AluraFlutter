import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthDialog extends StatefulWidget {

  final Function(String password) onConfirm;

  AuthDialog({@required this.onConfirm});

  @override
  _AuthDialogState createState() => _AuthDialogState();
}

class _AuthDialogState extends State<AuthDialog> {

  final TextEditingController _passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Autenticação'),
      content: TextField(
        controller: _passwordControler,
        textAlign: TextAlign.center,
        maxLength: 4,
        obscureText: true,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 64,
          letterSpacing: 16,
        ),
        decoration: InputDecoration(border: OutlineInputBorder()),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('CANCELAR'),
        ),
        FlatButton(
          onPressed: () {
            widget.onConfirm(_passwordControler.text);
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
