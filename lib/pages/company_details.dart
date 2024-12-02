import 'package:flutter/material.dart';
import 'package:stockzz_app/pages/buy.dart';
import 'package:stockzz_app/pages/chart.dart';
import 'package:stockzz_app/pages/sell.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'marketdata.dart';

class CompanyDetailsScreen extends StatefulWidget {

  final MarkList marke;

  CompanyDetailsScreen(this.marke);

  @override
  State<CompanyDetailsScreen> createState() => _CompanyDetailsScreenState();
}

class _CompanyDetailsScreenState extends State<CompanyDetailsScreen> {





  @override
  Widget build(BuildContext context) {


    return SafeArea(


        child: Scaffold(
          backgroundColor: Colors.white10,

          appBar: AppBar(backgroundColor: Colors.black,
            elevation: 0,
            title: Text(widget.marke.title,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize:24,)),
          ),

          body:
          Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                children: [


                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(width: 15,),
                          SizedBox(
                              width: 250.0,
                              height: 250.0,
                              child: Image.asset(widget.marke.imageUrl, fit: BoxFit.cover)),

                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(widget.marke.details,
                                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('Sector: ', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                                Text(widget.marke.sector.toString(), style: TextStyle(fontWeight: FontWeight.w500,fontSize:15,color: Colors.black ),),


                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('Previous Stock Price: ', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                                Text(widget.marke.prevstockprice, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('Opening Stock Price: ', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                                Text(widget.marke.openstockprice.toString(), style: TextStyle(fontWeight: FontWeight.w500,fontSize:15,color: Colors.black ),),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text('Closing Stock Price: ', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                                Text(widget.marke.closestockprice.toString(), style: TextStyle(fontWeight: FontWeight.w500,fontSize:15,color: Colors.black ),),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height:70,
                                    width: 300,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(

                                        primary: Colors.blueAccent, // background
                                        onPrimary: Colors.white,
                                        shape: StadiumBorder(),
                                        // foreground
                                      ),
                                      onPressed: () {  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Chart()));},
                                      child: Text('VIEW SALES CHART',  style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w400)),

                                    ),
                                  )
                                ],

                              ),
                            ),

                          ),
                          SizedBox(
                            height: 80,
                          ),

                        ],
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white, borderRadius: BorderRadius.circular(12),
                        boxShadow:[
                          BoxShadow(
                            color: Colors.grey.shade500,
                            offset: Offset(1,2),
                            blurRadius: 1,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Colors.white54,
                            offset: Offset(-1,-2),
                            blurRadius: 3,
                            spreadRadius: 1,
                          ),

                        ] ,
                      ),
                    ),
                  ),





                ],

              ),
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 100,
            child: BottomAppBar(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text('Stock Price: ', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500, fontSize: 20)),
                              Text(widget.marke.stockprice, style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500, fontSize: 25)),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                            child: Row(
                              children: [
                                Text('Change: ', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500, fontSize: 25)),
                                Text(widget.marke.description.toString(), style: TextStyle(fontWeight: FontWeight.w500,fontSize:30,color: widget.marke.description < 0 ? Colors.red [700] : Colors.green[800] ),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 17,),



                    Row(
                      children: [
                        SizedBox(width: 93.0,
                          height: 52.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green[500], // background
                              onPrimary: Colors.white,
                              shape: StadiumBorder(),// foreground
                            ),
                            onPressed: () {  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Buy())); },
                            child: Text('BUY',  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400)),

                          ),
                        ),
                        SizedBox(width: 6,),
                        SizedBox(width: 93.0,
                          height: 52.0,
                          child: ElevatedButton(

                            style: ElevatedButton.styleFrom(
                              primary: Colors.red[600], // background
                              onPrimary: Colors.white,
                              shape: StadiumBorder(),
                              // foreground
                            ),
                            onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Sell()));},
                            child: Text('SELL',  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400)),

                          ),
                        ),
                      ],
                    ),


                  ],

                ),
              ),

            ),
          ),



)

    );

  }
}
