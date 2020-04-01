
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

Future<List<Transaction>> findAll() async{

  final Client client = HttpClientWithInterceptor.build(interceptors: [
    LogginInterceptor(),
  ]);

  var response = await client.get('http://192.168.15.18:8080/transactions');

  List<dynamic> mapResponse = json.decode(response.body);
  List<Transaction> listTransaction = List();
  for(Map<String, dynamic> transactionJson in mapResponse){
    listTransaction.add(Transaction.fromJon(transactionJson));
  }
  return listTransaction;
}