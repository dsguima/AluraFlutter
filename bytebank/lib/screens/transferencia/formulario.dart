import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _titleAppBar = "Criando Transferência";
const _labelValor = 'Valor';
const _hintValor = 'Digite o valor';
const _labelConta = 'Número da conta';
const _hintConta = 'Digite o número da conta';
const _btnConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  _FormularioTransferenciaState createState() =>
      _FormularioTransferenciaState();
}

class _FormularioTransferenciaState extends State<FormularioTransferencia> {
  final _numeroContaControlador = TextEditingController();
  final _valorControlador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(_numeroContaControlador, _labelConta,
                  _hintConta),
              Editor(_valorControlador, _labelValor, _hintValor,
                  icon: Icons.monetization_on),
              RaisedButton(
                child: Text(
                  _btnConfirmar,
                ),
                onPressed: () => _criarTransferencia(context),
              ),
            ],
          ),
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
