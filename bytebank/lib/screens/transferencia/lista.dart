import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/models/transferencia.dart';

const _titleAppBar = "Transferências";

class ListaTransferencia extends StatefulWidget {
  @override
  _ListaTransferenciaState createState() => _ListaTransferenciaState();
}

class _ListaTransferenciaState extends State<ListaTransferencia> {
  final List<Transferencia> _transferencias = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed: () => _novaTransferencia(context)),
    );
  }

  void _novaTransferencia(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FormularioTransferencia();
    })).then((transferenciaRecebida) => _atualiza(transferenciaRecebida));
  }

  void _atualiza(transferenciaRecebida) {
    //Future.delayed(Duration(seconds: 2), (){
    if(transferenciaRecebida!=null){
      debugPrint('Transferencia realizada: $transferenciaRecebida');
      setState(() {
        _transferencias.add(transferenciaRecebida);
      });
    }
    //});
  }

  _body() {
    return ListView.builder(
      itemCount: _transferencias.length,
      itemBuilder: (context, indice) {
        return ItemTransferencia(_transferencias[indice]);
      },
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
