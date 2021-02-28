class Doctor{

  String _id;
  String _name;
  String _createdDate;
  String _updatedAt;
  int consultantFee;

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get name => _name;

  String get updatedAt => _updatedAt;

  set updatedAt(String value) {
    _updatedAt = value;
  }

  String get createdDate => _createdDate;

  set createdDate(String value) {
    _createdDate = value;
  }

  set name(String value) {
    _name = value;
  }
}