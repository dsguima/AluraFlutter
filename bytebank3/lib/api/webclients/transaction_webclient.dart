import 'dart:convert';

import 'package:bytebank3/models/transaction.dart';

import '../web_client.dart';

class TransactionWebClient {

  static const baseUrl = 'http://192.168.15.18:8080/transactions';

  Future<List<Transaction>> findAll() async {
    var response = await client.get(baseUrl).timeout(Duration(seconds: 5));

    List<dynamic> mapResponse = json.decode(response.body);
    List<Transaction> listTransaction = List();
    for (Map<String, dynamic> transactionJson in mapResponse) {
      listTransaction.add(Transaction.fromJon(transactionJson));
    }
    return listTransaction;
  }

  Future<Transaction> save(Transaction obj) async {

    print(obj);
    final Map<String, dynamic> transactionMap = {
      'value': obj.value,
      'contact': {
        'name': obj.contact.name,
        'accountNumber': obj.contact.accountNumber
      }
    };

    final String transactionJson = jsonEncode(transactionMap);

    var response = await client.post(
        baseUrl,
        headers: {'Content-Type': 'application/json', 'password': '1000'},
        body: transactionJson
    ).timeout(Duration(seconds: 5));

    return Transaction.fromJon(json.decode(response.body));
  }


}