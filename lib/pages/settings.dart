import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:stockzz_app/pages/home.dart';
import 'package:stockzz_app/pages/walletaccount.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final controller = TextEditingController();
  final acccontroller = TextEditingController();
  final depcontroller = TextEditingController();
  late final double? dep;
  var accNum;
  late final double? bal;
  var amount;

  

  void main(){
    var account = WalletAccount(balance: 0);
    account.balance=bal!;
    account.deposit(dep!);
  }

  update()async{
    DocumentReference documentReference = await FirebaseFirestore.instance.collection('accbalance').doc('rWfX9kcgAgYVNknmWnMD');

    documentReference.update({
      'AccountBalance': bal,
      'AccountNumber': accNum
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SETTINGS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300), ),
          backgroundColor: Colors.black,
          leading: BackButton(
            color: Colors.white,
          ), ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextField(controller: acccontroller,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: TextInputType.phone,
                decoration:
                InputDecoration(
                  labelText: 'Enter Bank Acc Number Or Phone Number',
                  hintText: 'Account Number/Phone Number',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              TextField(controller: depcontroller,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,  ThousandsFormatter(allowFraction: true)
                ],

                keyboardType: TextInputType.number,

                decoration:
                InputDecoration(
                  labelText: 'Enter Amount',
                  hintText: '0.00',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      depcontroller.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),

              ElevatedButton(onPressed: (){

                bal=depcontroller.text as double?;

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Settings()));
                      },
                      child: AlertDialog(
                      title:MaterialButton(onPressed: () {
                        bal =depcontroller.text as double?;
                        accNum =acccontroller.text;


                        update();
                        controller.clear();
                        acccontroller.clear();

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Success"),

                              content: Text("Transaction Completed Successfully"),
                              actions: [
                                Icon(Icons.check),
                              ],
                            );

                          },
                        );
                      },
                        color: Colors.blue,
                        child: const
                        Text('CONFIRM DEPOSIT', style: TextStyle(color: Colors.white)),

                      ),
                      ),
                    );
                  },
                );
              }, child: Text('DEPOSIT')),


            ],
          ),




        ));




  }
}