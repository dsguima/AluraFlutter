import 'package:bytebank/pages/formulario_transferencia.dart';
import 'package:flutter/material.dart';

import 'pages/lista_transferencia.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: ListaTransferencia(),
    );
  }
}


