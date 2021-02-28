class Drug {
  int id;
  String drugName;
  String drugDosage;
  String drugPerTake;
  int drugTakeStatus;

  Drug(this.id, this.drugName, this.drugDosage, this.drugPerTake, this.drugTakeStatus);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'drugName': drugName,
      'drugDosage': drugDosage,
      'drugPerTake': drugPerTake,
      'drugTakeStatus': drugTakeStatus,
    };
    return map;
  }

  Drug.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    drugName = map['drugName'];
    drugDosage = map['drugDosage'];
    drugPerTake = map['drugPerTake'];
    drugTakeStatus = map['drugTakeStatus'];
  }
}