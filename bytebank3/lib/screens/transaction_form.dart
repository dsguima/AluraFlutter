import 'package:bytebank3/api/web_client.dart';
import 'package:bytebank3/models/contato_bean.dart';
import 'package:bytebank3/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final Contact _contact;
  var _formkey = GlobalKey<FormState>();
  FormFieldValidator<String> validator;

  final _valueControler = TextEditingController();

  TransactionForm(this._contact);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('New transaction')),
      body: _body(context),
    );
  }

  _body(context) {
    return Builder(builder: (BuildContext context) {
      return Form(
        key: _formkey,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              Text(
                _contact.name,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                _contact.accountNumber.toString(),
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _valueControler,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Campo obrigatório!";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Value',
                    hintText: 'Digite o valor',
                    labelStyle: TextStyle(fontSize: 20.0)),
              ),
              SizedBox(
                height: 16.0,
              ),
              RaisedButton(
                child: Text('Transfer'),
                onPressed: () => _save(_valueControler, context),
              ),
            ],
          ),
        ),
      );
    });
  }

  _save(TextEditingController valueControler, context) async {
    if (_formkey.currentState.validate()) {
      Transaction novo = Transaction(double.tryParse(_valueControler.text), _contact);
      final saved = await save(novo);

      if(saved!=null){
        Navigator.pop(context);
      } else{
        Scaffold.of(context) .showSnackBar(SnackBar(content: Text('Ocorreu um erro!')));
      }
    }
    return;
  }
}
