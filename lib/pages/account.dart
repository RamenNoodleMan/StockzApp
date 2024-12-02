import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final user = FirebaseAuth.instance.currentUser!;

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  double balance=36,depo=0,withdr=0;
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



  String dropdownValue = 'Madison Stock Broking Services';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ACCOUNT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 25), ),
          backgroundColor: Colors.black,
          leading: BackButton(
            color: Colors.white,
          ), ),
      backgroundColor: Colors.white,
      body:SingleChildScrollView(

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Logged in as: '+ user.email!, style: TextStyle(fontSize: 20),),
            ),

            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height:70,

                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30,0,0,3),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(

                      children: [
                        Text('BALANCE: K$balance', style: TextStyle(fontSize: 30, color: Colors.white),),
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
                          Colors.orangeAccent,
                          Colors.amberAccent,
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
              padding: const EdgeInsets.all(10.0),
              child: Text('You Can Withdraw or Deposit From Your Account Below', style: TextStyle(fontSize: 23, color: Colors.orange)),
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
                    SizedBox(height:1),
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
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: controller2,
                        keyboardType: TextInputType.number,


                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),),
                          labelText: 'Enter Account Or Mobile Number',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40,0,20,0),
                      child: Row(
                        children: [
                          SizedBox(width: 140.0,
                            height: 62.0,
                            child: ElevatedButton(
                                onPressed: (){
                                  deposit();
                                  controller1.clear();
                                  controller2.clear();
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
                                child: Text('DEPOSIT', style: TextStyle(fontSize: 25),),
                                style: ElevatedButton.styleFrom(primary: Colors.black,
                                    onPrimary: Colors.blue,
                                    elevation: 20,  // Elevation
                                    shadowColor: Colors.blue,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.white),
                                      // Shadow Color),
                                    )) ),
                          ),
                          SizedBox(width: 10,),
                          SizedBox(width: 170.0,
                            height: 62.0,
                            child: ElevatedButton(onPressed: (){
                              withdrawal();
                              controller2.clear();
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

                              } else {(balance <= withdr);
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
                                child: Text('WITHDRAW', style: TextStyle(fontSize: 24)),

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text('SELECT YOUR BROKER', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400)),
                  SizedBox(height: 5,),

                  SizedBox(height: 80,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.redAccent,
                                    Colors.blueAccent,
                                    Colors.purpleAccent
                                    //add more colors
                                  ]),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                                    blurRadius: 5) //blur radius of shadow
                              ]
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(left:30, right:30),
                              child:Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: DropdownButton(
                                  value: dropdownValue,
                                  items:<String>['Madison Stock Broking Services', 'Longhorn Associates Limited', 'Autus Securities', 'Equity Capital Resources Plc']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),


                                  onChanged: ( String? newValue){
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });


                                  },

                                  isExpanded: true, //make true to take width of parent widget
                                  underline: Container(), //empty line
                                  style: TextStyle(fontSize: 20, color: Colors.white),
                                  dropdownColor: Colors.deepOrangeAccent,
                                  iconEnabledColor: Colors.white, //Icon color
                                ),
                              )
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                ],
              ),
            ),

          ],
        ),
      ),



    );




  }
}