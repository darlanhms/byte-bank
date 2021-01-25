class Contact {
  final int id;
  final String name;
  final int accountNumber;

  Contact({
    this.id,
    this.name,
    this.accountNumber,
  });

  @override
  String toString() {
    return "Contact{ id: $id, name: $name, accountNumber: $accountNumber }";
  }

  static Contact fromJSON(Map<String, dynamic> json, [bool isDb]) {
    return Contact(
      id: json['id'],
      name: json['name'],
      accountNumber: isDb ? json['account_number'] : json['accountNumber'],
    );
  }

  Map<String, dynamic> toJSON([bool isDb]) {
    final Map<String, dynamic> contactMap = Map();

    contactMap['id'] = id;
    contactMap['name'] = name;

    if (isDb) {
      contactMap['account_number'] = accountNumber;
    } else {
      contactMap['accountNumber'] = accountNumber;
    }

    return contactMap;
  }
}
