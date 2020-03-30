import 'dart:ffi';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferências"),
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }

  _body() {
    return Column(
      children: <Widget>[
        Card(
          child: ListTile(
            leading: Icon(
              Icons.monetization_on
            ),
            title: Text("100.0"),
            subtitle: Text("1000"),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.monetization_on
            ),
            title: Text("200.0"),
            subtitle: Text("1000"),
          ),
        ),
      ],
    );
  }
}
