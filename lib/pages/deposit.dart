import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:stockzz_app/pages/walletaccount.dart';

class Deposit extends StatefulWidget {
  const Deposit({Key? key}) : super(key: key);

  @override
  _DepositState createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
final controller = TextEditingController();
final acccontroller = TextEditingController();
var dep;
var accNum;
var bal;
var amount;


void bank(){
  var account = WalletAccount(balance: 0);
 account.balance=bal;
  account.deposit(dep);
}




update()async{
  DocumentReference documentReference = await FirebaseFirestore.instance.collection('accbalance').doc('rWfX9kcgAgYVNknmWnMD');

  documentReference.update({
    'AccountBalance': dep,
    'AccountNumber': accNum
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor:  Colors.black,
      appBar: AppBar(
        title: Text('DEPOSIT',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
        backgroundColor: Colors.black,
        leading: BackButton(
          color: Colors.white,
        ),),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Container(
          height: 300,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(20.0),
            color: Colors.white,
          ),
          child: Padding(

            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
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
                  TextField(controller: controller,
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
                          controller.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                  MaterialButton(onPressed: () {
                    dep =controller.text;
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

                  )
                ],
              ),

            ),
          ),
        ),
      ),
    );
  }}

