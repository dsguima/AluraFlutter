
import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Should display the main image when the Dashboard is opened',
          (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(home: Dashboard()));
        final mainImage = find.byType(Image);
        expect(mainImage, findsOneWidget);
      });

  bool featureItemMatcher(Widget widget, String name, IconData icon) {
    if(widget is FeatureItem) {
      return widget.name ==  name && widget.icon == icon;
    }
    return false;
  }
  testWidgets('Should display the transfer feature when the Dashboard is opened',
          (tester) async {
        await tester.pumpWidget(MaterialApp(home: Dashboard()));
        final transferFeatureItem = find.byWidgetPredicate((widget) => featureItemMatcher(widget, 'Transfer', Icons.monetization_on));
        expect(transferFeatureItem, findsOneWidget);
      });

  testWidgets('Should display the transaction feed feature when the Dashboard is opened',
          (tester) async {
        await tester.pumpWidget(MaterialApp(home: Dashboard()));
        final transactionFeedFeatureItem = find.byWidgetPredicate((widget) => featureItemMatcher(widget, 'Transaction Feed', Icons.description));
      });
}