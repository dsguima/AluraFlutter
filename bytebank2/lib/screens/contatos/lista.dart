import 'package:bytebank2/screens/contatos/cadastro.dart';
import 'package:flutter/material.dart';

class ListaContatos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: _list(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _cadastrarContato(context),
      ),
    );
  }

  _list() {
    return ListView(
      children: <Widget>[
        Card(
          child: ListTile(
            title: Text('Dani'),
            subtitle: Text('dani'),
          ),
        )
      ],
    );
  }

  _cadastrarContato(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CadastroContato()))
        .then((novoContato) => debugPrint(novoContato.toString()));
  }
}
