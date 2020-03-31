import 'package:bytebank2/screens/contatos/lista.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //Image.network('');
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/bytebank_logo.png'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            color: Theme.of(context).primaryColor,
            child: InkWell(
              onTap: () => _navigatorListContatos(context),
              child: Container(
                padding: EdgeInsets.all(8.0),
                width: 150,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.people, color: Colors.white, size: 32.0,),
                    Text('Contatos', style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  _navigatorListContatos(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListaContatos()));
  }
}
