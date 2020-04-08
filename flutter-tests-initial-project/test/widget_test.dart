// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bytebank/models/transaction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return the value when create a transaction', () {
    final transaction = Transaction(null, 200, null);
    expect(transaction.value, 200);
  });
  test('Should show error when create transaction with value less than zero',
      () {
    expect(() => (Transaction(null, 0, null)), throwsAssertionError);
  });
}
