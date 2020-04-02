import 'contato_bean.dart';

class Transaction {
  final double value;
  final Contact contact;

  Transaction(this.value,
      this.contact,);

  Transaction.fromJson(Map<String, dynamic> map):
       value = map["value"],
       contact = Contact.fromJson(map['contact']);

  Map<String, dynamic> toJson() =>
      {
        'value': value,
        'contact': contact.toJson(),
      };

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }
}
