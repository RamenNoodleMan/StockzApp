class BankAccount {
  double _balance;

  BankAccount({required double balance}) : _balance = balance;

  double get balance => _balance;

  set balance(double amount)=> _balance = amount;

  void deposit(double amount) => _balance += amount;

void withDraw(double amount){
  if(_balance > amount){
    _balance -= amount;
  } else {
    print('Insufficient Funds!');
  }
}
}