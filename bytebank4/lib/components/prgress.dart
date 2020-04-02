import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final String texto;

  Progress({this.texto = 'Loading...'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          SizedBox(
            height: 20.0,
          ),
          Text(texto),
        ],
      ),
    );
  }
}
