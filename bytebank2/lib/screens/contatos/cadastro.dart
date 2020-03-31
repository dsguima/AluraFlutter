import 'package:bytebank2/models/contato.dart';
import 'package:flutter/material.dart';

class CadastroContato extends StatefulWidget {

  @override
  _CadastroContatoState createState() => _CadastroContatoState();
}

class _CadastroContatoState extends State<CadastroContato> {

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _numeroContaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de contato'),
      ),
      body: _formulario(),
    );
  }

  _formulario() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome completo',
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextField(
              controller: _numeroContaController,
              decoration: InputDecoration(
                labelText: 'Número da conta',
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SizedBox(
              width: double.maxFinite,
              child: RaisedButton(
                child: Text('Salvar'),
                onPressed: _salvar,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _salvar() {
    final String nome = _nomeController.text;
    final int numeroConta = int.tryParse(_numeroContaController.text);

    Navigator.pop(context, Contato(nome, numeroConta));
  }
}
