import 'package:flutter/material.dart';

class Editor extends StatelessWidget {

  final TextEditingController _controler;
  final String _label;
  final String _hint;
  final IconData icon;

  Editor(this._controler, this._label, this._hint, {IconData this.icon=null});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controler,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 16.0,
        ),
        decoration: InputDecoration(
            icon: icon != null? Icon(icon): null,
            labelText: _label,
            hintText: _hint),
      ),
    );
  }
}
