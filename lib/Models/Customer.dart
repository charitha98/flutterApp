class Customer {
  int _id;
  String _account_No;
  String _email;
  String _phoneNumber;
  String _name;
  String _createdDate;
  String _updatedAt;
  String _clientID;

  @override
  String toString() {
    return 'Customer{_id: $_id, _account_id: $_account_No, _email: $_email, _phoneNumber: $_phoneNumber, _name: $_name, _createdDate: $_createdDate, _updatedAt: $_updatedAt, _clientID: $_clientID}';
  }

  set id(int value) {
    _id = value;
  }

  int get id => _id;

  String get clientID => _clientID;

  String get updatedAt => _updatedAt;

  String get createdDate => _createdDate;

  String get name => _name;

  String get phoneNumber => _phoneNumber;

  String get email => _email;

  String get account_No => _account_No;

  set account_No(String value) {
    _account_No = value;
  }

  set clientID(String value) {
    _clientID = value;
  }

  set updatedAt(String value) {
    _updatedAt = value;
  }

  set createdDate(String value) {
    _createdDate = value;
  }

  set name(String value) {
    _name = value;
  }

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  set email(String value) {
    _email = value;
  }
}
