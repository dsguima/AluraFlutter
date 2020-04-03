import 'dart:convert';

import 'package:bytebank4/models/transaction.dart';

import '../web_client.dart';

class TransactionWebClient {
  static const baseUrl = 'http://192.168.15.18:8080/transactions';

  Future<List<Transaction>> findAll() async {
    var response = await client.get(baseUrl);

    List<dynamic> mapResponse = json.decode(response.body);
    List<Transaction> listTransaction = List();
    for (Map<String, dynamic> transactionJson in mapResponse) {
      listTransaction.add(Transaction.fromJson(transactionJson));
    }
    return listTransaction;
  }

  Future<Transaction> save(Transaction obj, String password) async {
    final String transactionJson = jsonEncode(obj.toJson());

    var response = await client
        .post(baseUrl,
            headers: {'Content-Type': 'application/json', 'password': password},
            body: transactionJson);

    if (response.statusCode == 400) {
      throw Exception('erro 400');
    }

    if (response.statusCode == 401) {
      throw Exception('erro 401');
    }

    return Transaction.fromJson(json.decode(response.body));
  }
}
