import 'dart:convert';

import 'package:bytebank4/models/transaction.dart';

import '../web_client.dart';

class TransactionWebClient {

  static const baseUrl = 'http://192.168.15.18:8080/transactions';

  Future<List<Transaction>> findAll() async {
    var response = await client.get(baseUrl).timeout(Duration(seconds: 5));

    List<dynamic> mapResponse = json.decode(response.body);
    List<Transaction> listTransaction = List();
    for (Map<String, dynamic> transactionJson in mapResponse) {
      listTransaction.add(Transaction.fromJson(transactionJson));
    }
    return listTransaction;
  }

  Future<Transaction> save(Transaction obj) async {

    final String transactionJson = jsonEncode(obj.toJson());

    var response = await client.post(
        baseUrl,
        headers: {'Content-Type': 'application/json', 'password': '1000'},
        body: transactionJson
    ).timeout(Duration(seconds: 5));

    return Transaction.fromJson(json.decode(response.body));
  }


}