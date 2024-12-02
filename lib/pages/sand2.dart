import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Sandy extends StatefulWidget {
  const Sandy({Key? key}) : super(key: key);

  @override
  _SandyState createState() => _SandyState();
}

class _SandyState extends State<Sandy> {
  late double balancee;

  getTheBalance(bal) {
    this.balancee = bal;
  }

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

  Future<void> withdrawAcc() {
    return accbalance
        .doc('bal')
        .update({'AccountBalance': money})
        .then((value) => setState(() {
          Mula = double.parse(control.text);
      money-=Mula;
    })
        )
        .catchError((error) => print("Failed to update balance: $error"));
  }


  TextEditingController control = TextEditingController();

  double balance = 0,
      depo = 0,
      withdr = 0;


  deposit() {
    setState(() {
      depo = double.parse(control.text);
      balance += depo;
    });
  }

  withdrawal() {
    setState(() {
      withdr = double.parse(control.text);

      if (balance > withdr) {
        balance -= withdr;
      } else {
        print('Insufficient Funds!');
      }
    });
  }


  Widget _buildList(QuerySnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.docs.length,
      itemBuilder: (context, index) {
        final doc = snapshot.docs[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 2, 0, 30),
              child: ListTile(
                title: SizedBox(
                  height: 50,
                  width: 50,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Row(
                        children: [
                          Text('WALLET BALANCE: K',
                              style: TextStyle(color: Colors.white)),
                          Text(doc['AccountBalance'].toString(),
                            style: TextStyle(color: Colors.white),),
                          SizedBox(width: 15,),
                          Icon(Icons.account_balance_outlined,
                            color: Colors.white,)
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.redAccent,
                            Colors.orangeAccent,
                            Colors.amberAccent,
                            Colors.purpleAccent,
                            Colors.indigoAccent,
                            Colors.deepOrangeAccent,
                            //add more colors
                          ]), borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade500,
                          offset: Offset(3, 5),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Colors.white54,
                          offset: Offset(-4, -4),
                          blurRadius: 6,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('ACCOUNT',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
        backgroundColor: Colors.black,
        leading: BackButton(
          color: Colors.white,
        ),),

      body: SingleChildScrollView(

        child: Column(
          children: [

            Container(
              child: SizedBox(
                height: 60,
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('accbalance')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return LinearProgressIndicator();
                      return Expanded(
                          child: _buildList(snapshot.requireData)
                      );
                    }
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
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: control,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius
                              .circular(20.0),),
                          labelText: 'Enter Amount ZMW',
                        ),
                        onChanged: (String mon) {
                          getMula(mon);
                        },

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 20, 0),
                      child: Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                updateAcc();
                                control.clear();
                                showDialog(context: context,
                                  builder: (BuildContext dialogContext) {
                                    return AlertDialog(
                                      title: Text(
                                        '', style: TextStyle(fontSize: 12),),
                                      content: Text('TRANSACTION SUCCESSFUL!'),
                                      actions: <Widget>[
                                        FlatButton(
                                          child:
                                          Icon(Icons.check_circle,
                                              color: Colors.black, size: 40),
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
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  onPrimary: Colors.blue,
                                  elevation: 20,
                                  // Elevation
                                  shadowColor: Colors.blue,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(
                                        20.0),
                                    side: BorderSide(color: Colors.white),
                                    // Shadow Color),
                                  ))),
                          SizedBox(width: 20,),
                          ElevatedButton(onPressed: () {
                            withdrawAcc();
                            control.clear();
                            if (Mula <= money) {
                              showDialog<void>(
                                context: context,
                                builder: (BuildContext dialogContext) {
                                  return AlertDialog(
                                    title: Text(
                                      '', style: TextStyle(fontSize: 12),),
                                    content: Text('TRANSACTION SUCCESSFUL!'),
                                    actions: <Widget>[
                                      FlatButton(
                                        child:
                                        Icon(Icons.check_circle,
                                            color: Colors.black, size: 40),
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
                                    title: Text('Transaction Unsuccessful',
                                      style: TextStyle(fontSize: 12),),
                                    content: Text('INSUFFICIENT FUNDS!'),
                                    actions: <Widget>[
                                      FlatButton(
                                        child:
                                        Icon(Icons.cancel, color: Colors.black,
                                          size: 40,),
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

                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                onPrimary: Colors.amber,
                                elevation: 20,
                                // Elevation
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
                    SizedBox(height: 10),
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

}
