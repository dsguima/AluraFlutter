import 'package:bytebank/components/editor.dart';
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
            Editor(_numeroContaControlador, 'Número da conta', 'Digite o número da conta'),
            Editor(_valorControlador, 'Valor', 'Digite o valor', icon: Icons.monetization_on),
            RaisedButton(
              color: Colors.green,
              child: Text(
                'Confirmar',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => _criarTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criarTransferencia(BuildContext context) {
    double valor = double.tryParse(_valorControlador.text);
    int conta = int.tryParse(_numeroContaControlador.text);
    if (valor != null && conta != null) {
      final transferenciaOK = Transferencia(valor, conta);
      debugPrint('Iniciando Transferencia: $transferenciaOK');
      Navigator.pop(context, transferenciaOK);
    }
  }
}
