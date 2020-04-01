import 'dart:convert';

import 'package:bytebank3/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LogginInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print(data);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print(data.statusCode);
    print(data.body);
    return data;
  }
}

final Client client = HttpClientWithInterceptor.build(interceptors: [
  LogginInterceptor(),
]);

const baseUrl = 'http://192.168.15.18:8080/transactions';

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
