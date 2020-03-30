import 'package:bytebank/model/transferencia.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatelessWidget {
  final _numeroContaControlador = TextEditingController();
  final _valorControlador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando Transferência"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _numeroContaControlador,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 16.0,
                ),
                decoration: InputDecoration(
                    labelText: 'Número da conta',
                    hintText: 'Digite o número da conta'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _valorControlador,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 16.0,
                ),
                decoration: InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    labelText: 'Valor',
                    hintText: 'Digite o valor'),
              ),
            ),
            RaisedButton(
              color: Colors.green,
              child: Text(
                'Confirmar',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: _onClickConfirmar,
            ),
          ],
        ),
      ),
    );
  }

  void _onClickConfirmar() {
    double valor = double.tryParse(_valorControlador.text);
    int conta = int.tryParse(_numeroContaControlador.text);
    if (valor != null && conta != null) {
      final transferenciaOK = Transferencia(valor, conta);
      debugPrint('Transferencia ok: $transferenciaOK');
    }
  }
}
