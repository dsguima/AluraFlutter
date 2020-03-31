class Contact {

  final int id;
  final String name;
  final int accountNumber;

  Contact(this.name, this.accountNumber, {this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'account_number': accountNumber,
    };
  }

  @override
  String toString() {
    return 'Contact{name: $name, accountNumber: $accountNumber}';
  }

}
