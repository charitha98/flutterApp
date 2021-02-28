
class Pharmacy {

  int _id;
  int _dangerlevel;
  String _productCode;
  int _productId;
  double _price;
  String _name;
  String _category;
  String _manufacturer;

  String toString() {
    return 'Pharmacy{_id: $_id, _price: $_price, _name: $_name, _category: $_category, _manufacturer: $_manufacturer, _productId: $_productId, _productCode: $_productCode, _dangerlevel: $_dangerlevel}';
  }

  set id(int value) {
    _id = value;
  }
  set dangerlevel(int value) {
    _dangerlevel = value;
  }

  int get id => _id;

  int get dangerlevel => _dangerlevel;

  int get productId => _productId;

  String get productCode => _productCode;

  double get price => _price;

  String get name => _name;

  String get category => _category;

  String get manufacturer => _manufacturer;

  set productCode(String value) {
    _productCode = value;
  }

  set productId(int value) {
    _productId = value;
  }

  set price(double value) {
    _price = value;
  }

  set name(String value) {
    _name = value;
  }

  set category(String value) {
    _category = value;
  }

  set manufacturer(String value) {
    _manufacturer = value;
  }

}