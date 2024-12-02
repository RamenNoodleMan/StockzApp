import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Sell extends StatefulWidget {
  const Sell({Key? key}) : super(key: key);

  @override
  _SellState createState() => _SellState();
}




class _SellState extends State<Sell> {

  TextEditingController control = TextEditingController();
  double money=0;
  late double Mula;
  late double depo;
  getMula(mon) {
    this.Mula = double.parse(mon);
  }

  getMul(dep) {
    this.depo = double.parse(dep);
  }

  CollectionReference accbalance = FirebaseFirestore.instance.collection(
      'accbalance');

  Future<void> updateAcc()async {
    return accbalance
        .doc('bal')
        .update({'AccountBalance': balance})
        .whenComplete(() {
      setState(() {
        deposit();

      });
    })
        .catchError((error) => print("Failed to update balance: $error"));
  }

  TextEditingController controller1 = TextEditingController();
  double balance=0,withdr=0;

  deposit(){
    setState(() {
      depo=double.parse(control.text);
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('SELL SHARE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 24), ),
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

                    Text('Price Per Stock: K14', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight:FontWeight.w300 ),),
                    SizedBox(height:5),

                    Text('Broker Fees: K0.13', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight:FontWeight.w300 ),),
                    SizedBox(height:5),

                    Text('LUSE Fees: K0.13', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight:FontWeight.w300 ),),

                    SizedBox(height:20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        cursorColor: Colors.red,
                        controller: control,
                        keyboardType: TextInputType.number,
                        onChanged: (String dep) {
                          getMul(dep);
                        },

                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 2.0),
                          ),
                          labelText: 'Enter Number Of Shares',


                          labelStyle: TextStyle(fontSize: 20,
                              color: myFocusNode.hasFocus ? Colors.red : Colors.grey
                          ),

                        ),
                      ),
                    ),

                    Row(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SizedBox(
                              height: 70,
                              width: 200,
                              child: ElevatedButton(
                                  onPressed: (){

                                    updateAcc();
                                    control.clear();
                                    showDialog(context: context, builder: (BuildContext dialogContext) {
                                      return AlertDialog(
                                        title: Text('', style: TextStyle(fontSize: 12),),
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
                                  },
                                  child: Text('SELL STOCK', style: TextStyle(fontSize: 20),),
                                  style: ElevatedButton.styleFrom(primary: Colors.white,
                                      onPrimary: Colors.red,
                                      elevation: 20,  // Elevation
                                      shadowColor: Colors.red,
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(20.0),
                                        side: BorderSide(color: Colors.white),
                                        // Shadow Color),
                                      )) ),
                            ),
                          ),
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
  }}
