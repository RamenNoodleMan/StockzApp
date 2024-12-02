import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stockzz_app/pages/marketItems.dart';
import 'package:stockzz_app/pages/watch.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return
      Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: showToast,
                    child: Container(
                      child: Text('WELCOME TO  S T O C K Z', style: TextStyle(color: Colors.white, fontSize: 25)),
                      padding:EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent, borderRadius: BorderRadius.circular(12),
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
              SizedBox(
                height: 1,
              ),

              Center(
                child: Text('Buying Shares Is Now Easier!' ,
                    style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.black54,
                    )),
              ),



                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 350.0,

                        aspectRatio: 16/9,
                        viewportFraction: 0.8,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 2),
                        autoPlayAnimationDuration: Duration(milliseconds: 400),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,

                        scrollDirection: Axis.horizontal,

                      ),
                      items: ['assets/bata.webp','assets/cec.png','assets/zaffico.png','assets/Shoprite.png','assets/zamsugar.webp'].map((i) {
                        return Builder(
                            builder: (BuildContext context) {
                              return FittedBox(
                                child: Container(

                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,

                                  margin: EdgeInsets.symmetric(horizontal: 1.0),

                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Column(
                                      children: [
                                        Image.asset(i),
                                        SizedBox(height: 3,),


                                      ],
                                    ),
                                  ),

                                ),
                              );
                            }
                        );
                      }) .toList(),
              ),
                  ),
              SizedBox(
                height: 12
              ),

              Center(
                child: Text('Invest In Your Favourite Companies' ,
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.black54,
                    )),
              ),




              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Center(
                  child: Padding(

                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: Text('SELECT THE MARKETS TAB BELOW TO CHECK OUT THE CURRENT STOCK MARKET PRICES', style: TextStyle(color: Colors.black, fontSize: 16,)),
                      padding:EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300, borderRadius: BorderRadius.circular(12),
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

              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      child: Text('FEEL FREE TO CHECK YOUR ACCOUNT BALANCE IN YOUR WALLET AT ANY TIME', style: TextStyle(color: Colors.white, fontSize: 18,)),
                      padding:EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.green, borderRadius: BorderRadius.circular(12),
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

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: SizedBox(
                      width: 600,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(12),
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
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('WATCHLIST', style: TextStyle(fontSize: 30), textAlign: TextAlign.left,),
                            ),
                            SizedBox(height: 5,),

                            Container(
                              decoration: BoxDecoration(

                                //border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.deepOrange, // background
                                  onPrimary: Colors.white, // foreground
                                ),
                                onPressed: () {  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Watch()));},
                                child: SizedBox(
                                  height: 60,
                                  width: 350,
                                  child: Container(
                                      decoration: BoxDecoration(

                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(child: Text('CLICK HERE TO VIEW WATCHLIST',  style: TextStyle(color: Colors.white, fontSize: 22)))),
                                ),

                              ),
                            ),

                            SizedBox(height: 20,),

                            Center(child: Text('Get A Slice Of Your Shares With STOCKZ!',
                              style: TextStyle(color: Colors.black45, fontSize: 22, fontStyle: FontStyle.italic), )),
                            SizedBox(height: 20,),


                            SizedBox(
                              height: 260,
                              width: 290,
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Image.asset('assets/pie2.png')),
                            ),

                            SizedBox(height:20,),

                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Center(child: Text('Monitor The Markets Frequently To Be Up To Date With The Latest Stock Price Trends',
                                style: TextStyle(color: Colors.black45, fontSize: 22, fontStyle: FontStyle.italic), textAlign: TextAlign.justify,)),
                            ),

                            SizedBox(
                              height: 240,
                              width: 370,
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Image.asset('assets/feat.jpg')),
                            ),

                            SizedBox(height:20,),

                          ],
                        ),
                      ),
                    ),
                  ),

                ),
              ),


            ],
          ),
        ),
      );

  }


  void showToast()=> Fluttertoast.showToast(
      msg: 'Hi You Have A Free K50 To Get You Started',
  fontSize: 18,
  gravity: ToastGravity.CENTER);
  void cancelToast(){}
}
