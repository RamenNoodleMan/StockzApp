import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Sand extends StatefulWidget {
  const Sand({Key? key}) : super(key: key);

  @override
  _SandState createState() => _SandState();
}

class _SandState extends State<Sand> {

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

  update()async{
    DocumentReference documentReference = await FirebaseFirestore.instance.collection('accbalance').doc('rWfX9kcgAgYVNknmWnMD');

    documentReference.update({
      'accbal': deposit(),
      'accnum': accnum
    });
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Madison Broker Alliance';
    return
      Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('GOING FOR BROKE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300), ),
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
                  height:50,

                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30,0,0,3),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(

                        children: [
                          Text('BALANCE: K$balance', style: TextStyle(fontSize: 20, color: Colors.white),),
                          SizedBox(width: 20,),
                          Icon(Icons.account_balance_outlined, color: Colors.white,)
                        ],
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.redAccent,
                            Colors.blueAccent,
                            Colors.purpleAccent
                            //add more colors
                          ]), borderRadius: BorderRadius.circular(12),
                    boxShadow:[
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0,0),
                        blurRadius: 0,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(1,2),
                        blurRadius: 0,
                        spreadRadius: 0,
                      ),
                    ] ,
                  ),
                ),
              ),





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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: controller1,
                          keyboardType: TextInputType.number,

                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),),
                            labelText: 'Enter Amount ZMW',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40,0,20,0),
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: (){

                                deposit();
                                controller1.clear();
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
                              child: Text('DEPOSIT'),
                              style: ElevatedButton.styleFrom(primary: Colors.black,
                                onPrimary: Colors.blue,
                                elevation: 20,  // Elevation
                                shadowColor: Colors.blue,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(color: Colors.white),
                                  // Shadow Color),
                                )) ),
                            SizedBox(width: 20,),
                            ElevatedButton(onPressed: (){
                              withdrawal();
                              controller1.clear();
                              if(balance >= withdr){
                                showDialog<void>(
                                  context: context,
                                  builder: (BuildContext dialogContext) {
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
                                balance -= withdr;
                              } else {
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
                                child: Text('WITHDRAW'),

                                style: ElevatedButton.styleFrom(primary: Colors.black,
                                  onPrimary: Colors.amber,
                                  elevation: 20,  // Elevation
                                  shadowColor: Colors.amber,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(20.0),
                                    side: BorderSide(color: Colors.white),
                                    // Shadow Color),

                                  ),

                                )
                            ),

                          ],
                        ),

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