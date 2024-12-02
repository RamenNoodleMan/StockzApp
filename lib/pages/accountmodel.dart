class Acc{
  double? balance;
  double? depo;
  double? withdr;

  Acc();

  Map<String, dynamic> toJson()=> {'accbal': balance};

  Acc.fromSnapshot(snapshot)
  : balance = snapshot.data()['accbal'];
}