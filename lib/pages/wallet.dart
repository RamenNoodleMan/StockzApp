import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:stockzz_app/pages/deposit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {

  Widget _buildList(QuerySnapshot snapshot){
    return ListView.builder(
        itemCount: snapshot.docs.length,
        itemBuilder: (context, index){
      final doc = snapshot.docs[index];
      return Padding(
        padding: const EdgeInsets.fromLTRB(0,5,0,30),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,2,0,30),
            child: ListTile(
              title: SizedBox(
                height: 50,
                width: 50,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30,0,0,0),
                    child: Row(
                      children: [
                        Text('WALLET BALANCE: K',style: TextStyle(color: Colors.white, fontSize: 22)),
                        Text(doc['AccountBalance'].toString(), style: TextStyle(color: Colors.white, fontSize: 22),),
                        SizedBox(width: 25,),
                        Icon(Icons.account_balance_outlined, color: Colors.white,)
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
                    boxShadow:[
                      BoxShadow(
                        color: Colors.grey.shade500,
                        offset: Offset(3,5),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.white54,
                        offset: Offset(-4,-4),
                        blurRadius: 6,
                        spreadRadius: 0,
                      ),
                    ] ,
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

      body: Container(
        child: Column(
          children: [


            Container(
              child: SizedBox(
                height: 80,
                child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('accbalance').snapshots(),
    builder: (context, snapshot) {
    if(!snapshot.hasData) return LinearProgressIndicator();
    return Expanded(
    child: _buildList(snapshot.requireData)
    );

    }
    ),
              ),
            ),







            Center(
                child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Text('THE FOLLOWING BANK AND MOBILE MONEY SERVICES BELOW ARE SUPPORTED BY THIS PLATFORM FOR PAYMENT', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600,fontStyle: FontStyle.italic,)),
            )),

            Expanded(
              child: GestureDetector(
                onTap: () {

                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Deposit()));
                },
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 50,
                        width: 50,

                        child: Image.asset('assets/MTN_Logo.svg.png', fit: BoxFit.cover),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 4,
                              offset: Offset(4, 7), // Shadow position
                            ),
                          ],
                        ),
                      )
                    ),
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Image.asset('assets/Airtel-logo.png', fit: BoxFit.cover),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4,
                                offset: Offset(4, 7), // Shadow position
                              ),],),)),
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Image.asset('assets/zamtel.png', fit: BoxFit.cover),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4,
                                offset: Offset(4, 7), // Shadow position
                              ),],),)),
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Image.asset('assets/zanaco.png', fit: BoxFit.cover),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4,
                                offset: Offset(4, 7), // Shadow position
                              ),],),)),
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Image.asset('assets/fnb.webp', fit: BoxFit.cover),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4,
                                offset: Offset(4, 7), // Shadow position
                              ),],),)),
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Image.asset('assets/stanchart.jpg', fit: BoxFit.cover),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4,
                                offset: Offset(4, 7), // Shadow position
                              ),],),)),

                  ],
                ),

              ),
            ),


          ]),
      ),

    );

  }
}


