
class Service {

  int _id;
  double _price;
  String _name;
  String _serviceType;

  String toString() {
    return 'Service{_id: $_id, _price: $_price, _name: $_name, _serviceType: $_serviceType}';
  }

  set id(int value) {
    _id = value;
  }

  int get id => _id;

  double get price => _price;

  String get name => _name;

  String get serviceType => _serviceType;

  set serviceType(String value) {
    _serviceType = value;
  }

  set price(double value) {
    _price = value;
  }

  set name(String value) {
    _name = value;
  }

}