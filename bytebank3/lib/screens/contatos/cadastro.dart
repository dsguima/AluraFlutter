import 'package:bytebank3/database/dao/contato_dao.dart';
import 'package:bytebank3/models/contato_bean.dart';
import 'package:flutter/material.dart';

class CadastroContact extends StatefulWidget {
  @override
  _CadastroContactState createState() => _CadastroContactState();
}

class _CadastroContactState extends State<CadastroContact> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _numeroContaController = TextEditingController();

  final ContatoDao _dao = ContatoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Contact'),
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
    _dao.save(Contact(nome, numeroConta)).then((id) => Navigator.pop(context));
  }
}
