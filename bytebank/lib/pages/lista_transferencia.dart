import 'package:bytebank/model/transferencia.dart';
import 'package:bytebank/pages/formulario_transferencia.dart';
import 'package:flutter/material.dart';

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferências"),
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed: () => _novaTransferencia(context)),
    );
  }

  void _novaTransferencia(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FormularioTransferencia();
    })).then((transferenciaRecebida) {
      debugPrint('Transferencia realizada: $transferenciaRecebida');
    });
  }

  _body() {
    return Column(
      children: <Widget>[
        ItemTransferencia(Transferencia(200.0, 2334)),
        ItemTransferencia(Transferencia(200.0, 2334)),
        ItemTransferencia(Transferencia(200.0, 2334)),
        ItemTransferencia(Transferencia(200.0, 2334)),
      ],
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}
