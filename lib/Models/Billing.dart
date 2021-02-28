class Billing{

  String _invoicenumber;
  String _date;
  double _amount;
  String _doctorname;
  bool _paidstatus;
  String _description;


  String get description => _description;

  set description(String value) {
    _description = value;
  }

  bool get paidstatus => _paidstatus;

  set paidstatus(bool value) {
    _paidstatus = value;
  }

  String get doctorname => _doctorname;

  set doctorname(String value) {
    _doctorname = value;
  }

  String get invoicenumber => _invoicenumber;

  set invoicenumber(String value) {
    _invoicenumber = value;
  }

  String get date => _date;

  double get amount => _amount;

  set amount(double value) {
    _amount = value;
  }

  set date(String value) {
    _date = value;
  }
}