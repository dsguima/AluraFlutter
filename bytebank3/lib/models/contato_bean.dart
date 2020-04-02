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

  Contact.fromJson(Map<String, dynamic> map)
      : id = 0,
        name = map["name"],
        accountNumber = map["accountNumber"];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'accountNumber': accountNumber,
      };

  @override
  String toString() {
    return 'Contact{name: $name, accountNumber: $accountNumber}';
  }
}
