import 'package:bytebank3/api/web_client.dart';
import 'package:bytebank3/components/prgress.dart';
import 'package:bytebank3/models/transaction.dart';
import 'package:flutter/material.dart';

class ListaTransacionFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transactions'),
        ),
        body: FutureBuilder(
          future: Future.delayed(Duration(seconds: 2)).then((onValue)=> findAll()),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Progress();
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<Transaction> transactions = snapshot.data;
                return _listView(transactions);
                break;
            }
            return Text('Erro desconhecido');
          },
        ));
  }

  Widget _listView(transactions) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final Transaction transaction = transactions[index];
        return Card(
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text(
              transaction.value.toString(),
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              transaction.contact.accountNumber.toString(),
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        );
      },
      itemCount: transactions.length,
    );
  }
}
