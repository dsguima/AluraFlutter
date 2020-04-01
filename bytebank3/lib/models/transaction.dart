import 'contato_bean.dart';

class Transaction {
  final double value;
  final Contact contact;

  Transaction(this.value,
      this.contact,);

  Transaction.fromJon(Map<String, dynamic> map):
       value = map["value"],
       contact = Contact.fromJon(map['contact']);

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }
}
