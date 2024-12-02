import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';
import 'package:stockzz_app/pages/marketdata.dart';

class Buy extends StatefulWidget {



  const Buy( {Key? key,}) : super(key: key);

  @override
  _BuyState createState() => _BuyState();
}

class _BuyState extends State<Buy> {
  TextEditingController control = TextEditingController();
  String? _ref;

  String txref = '2344566';
  void setRef(){
    Random rand = Random();
    int number = rand.nextInt(2000);
    if(Platform.isAndroid){
      setState(() {
        _ref = 'AndroidRef123435$number';
      });
    }
    else{
      setState(() {
        _ref = 'IOSRef134589$number';
      });
    }
  }

  @override
  void initState(){
    setRef();
    super.initState();
  }

  double buyme=0;
  double multi=0;

  buying(){
    setState(() {
      multi=double.parse(_amount.text);
      buyme*multi;

    });
  }

  TextEditingController _amount = TextEditingController();

  double money = 0;
  late double Mula;

  getMula(mon) {
    this.Mula = double.parse(mon);
  }


  CollectionReference accbalance = FirebaseFirestore.instance.collection(
      'accbalance');

  Future<void> updateAcc()async {
    return accbalance
        .doc('bal')
        .update({'AccountBalance': money})
        .whenComplete(() {
      setState(() {

        money-=Mula;
      });
    })
        .catchError((error) => print("Failed to update balance: $error"));
  }

  TextEditingController controller1 = TextEditingController();
  double balance=0,depo=0,withdr=0;
  var accnum;


  deposit(){
    setState(() {
      depo=double.parse(controller1.text);
      balance +=depo;


    });
  }

  withdrawal(){
    setState(() {
      withdr=double.parse(controller1.text);

      if(balance > withdr){
        balance -= withdr;
      } else {
        print('Insufficient Funds!');
      }

    });
  }
  FocusNode myFocusNode = new FocusNode();


  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Madison Broker Alliance';
    return
      Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('BUY SHARE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 24), ),
          backgroundColor: Colors.black,
          leading: BackButton(
            color: Colors.white,
          ), ),

        body:SingleChildScrollView(

          child: Column(
            children: [
              SizedBox(height: 10,),






              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),

                  ),

                  child: Column(

                    children: [
                      SizedBox(height:20),

                      Text('Price Per Stock: K14', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight:FontWeight.w300 )),
                      SizedBox(height:5),

                      Text('Broker Fees: K0.17', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight:FontWeight.w300 ),),
                      SizedBox(height:5),

                      Text('LUSE Fees: K0.12', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight:FontWeight.w300 ),),

                      SizedBox(height:20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller : _amount,
                          cursorColor: Colors.green,

                          keyboardType: TextInputType.number,

                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green, width: 2.0),
                            ),
                            labelText: 'Enter Number Of Shares',
                              labelStyle: TextStyle(fontSize: 20,
                                  color: myFocusNode.hasFocus ? Colors.green : Colors.grey
                              ),

                          ),
                        ),
                      ),

                      Row(
                        children: [
                          SizedBox(height: 30,),
                          Column(
                            children: [
                              Center(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SizedBox(
                                height: 80,
                                width: 200,
                                child: ElevatedButton(
                                    onPressed: (){
                                      buying();
                                      //updateAcc();
                                      _amount.clear();

                                      if(multi<=2){
                                        showDialog<void>(
                                          context: context,
                                          builder: (BuildContext dialogContext) {
                                            return AlertDialog(
                                              title: Text('', style: TextStyle(fontSize: 22),),
                                              content: Text('TRANSACTION SUCCESSFUL!'),
                                              actions: <Widget>[
                                                FlatButton(
                                                  child:
                                                  Icon(Icons.check_circle, color: Colors.black,size:40),
                                                  onPressed: () {

                                                    Navigator.of(dialogContext)
                                                        .pop(); // Dismiss alert dialog
                                                  },
                                                ),
                                              ],
                                            );
                                          },);

                                      } else {(multi >= 20 );
                                      showDialog<void>(
                                        context: context,

                                        builder: (BuildContext dialogContext) {
                                          return AlertDialog(
                                            title: Text('Transaction Unsuccessful', style: TextStyle(fontSize: 12),),
                                            content: Text('INSUFFICIENT FUNDS!'),
                                            actions: <Widget>[
                                              FlatButton(
                                                child:
                                                Icon(Icons.cancel, color: Colors.black, size: 40,),
                                                onPressed: () {

                                                  Navigator.of(dialogContext)
                                                      .pop(); // Dismiss alert dialog
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      }
                                    },
                                    child: Text('PAY USING WALLET', style: TextStyle(fontSize: 20),),
                                    style: ElevatedButton.styleFrom(primary: Colors.white,
                                        onPrimary: Colors.green,
                                        elevation: 20,  // Elevation
                                        shadowColor: Colors.green,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(20.0),
                                          side: BorderSide(color: Colors.white),
                                          // Shadow Color),
                                        )) ),
                              ),
                            ),
                          ),
                          SizedBox(width: 50,),

                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: SizedBox(
                                    height: 80,
                                    width: 200,
                                    child: ElevatedButton(
                                        onPressed: (){
                                        final amount = _amount.text;
                                        if (amount.isEmpty){
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Field is empty')));
                                        }else{
                                          //FlutterWave
                                          _makePayment(context, amount.trim());


                                        }
                                        },
                                        child: Text('PAY USING OTHER SERVICE', style: TextStyle(fontSize: 20),),
                                        style: ElevatedButton.styleFrom(primary: Colors.white,
                                            onPrimary: Colors.green,
                                            elevation: 20,  // Elevation
                                            shadowColor: Colors.green,
                                            shape: new RoundedRectangleBorder(
                                              borderRadius: new BorderRadius.circular(20.0),
                                              side: BorderSide(color: Colors.white),
                                              // Shadow Color),
                                            )) ),
                                  ),
                                ),
                              ),


                            ],
                          ),


                          SizedBox(width: 50,),



                        ],
                      ),
                      SizedBox(height:10),
                    ],
                  ),

                ),

              ),

              SizedBox(height: 5,),

            ],
          ),
        ),



      );
  }


  void _makePayment(BuildContext context, String amount) async {
    try {

      Flutterwave flutterwave = Flutterwave.forUIPayment(
          context: this.context,

          encryptionKey: "FLWSECK_TEST2e94a6782c41",
          publicKey: "FLWPUBK_TEST-698edb2f6afd5cf263eb476497e45026-X",
          currency: FlutterwaveCurrency.ZMW,
          amount: amount,
          email: "valid@email.com",
          fullName: "Valid Full Name",
          txRef: txref,
          isDebugMode: false,
          phoneNumber: "********",
          acceptCardPayment: true,
          acceptUSSDPayment: false,
          acceptAccountPayment: false,
          acceptFrancophoneMobileMoney: false,
          acceptGhanaPayment: false,
          acceptMpesaPayment: false,
          acceptRwandaMoneyPayment: false,
          acceptUgandaPayment: false,
          acceptZambiaPayment: false);

      final ChargeResponse response = await flutterwave.initializeForUiPayments();

      if(response == null){
        print('Transaction Failed');
      }else{
        if(response.status == 'success'){
          print(response.data);
          print(response.message);
        }else{

        print(response.status);}
      }
    } catch(error) {
      print(error);
    }

  }

}