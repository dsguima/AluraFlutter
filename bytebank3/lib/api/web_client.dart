import 'dart:convert';

import 'package:bytebank3/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/logging_interceptor.dart';



final Client client = HttpClientWithInterceptor.build(interceptors: [
  LogginInterceptor(),
]);

