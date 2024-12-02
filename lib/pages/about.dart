import 'package:flutter/material.dart';
import 'package:stockzz_app/pages/help.dart';
import 'package:stockzz_app/pages/settings.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('ABOUT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 24), ),
    backgroundColor: Colors.black,
    leading: BackButton(
    color: Colors.white,
    ), ),
        backgroundColor: Colors.white,


      body:

        Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Text('HI! WELCOME TO  S T O C K Z', style: TextStyle(color: Colors.white, fontSize: 25)),
                    padding:EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent, borderRadius: BorderRadius.circular(10),
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

            Center(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text('S T O C K Z ', style: TextStyle(height: 1, fontSize: 35, fontWeight: FontWeight.w300),),
                  Text('IS AN ONLINE TRADING APPLICATION', style: TextStyle(height: 2,fontSize: 20),),

                  Text('DEVELOPED BY' , style: TextStyle(height: 2, fontSize: 20),),
                  Text(' RAMEEZ SERNIABAT 201801357' , style: TextStyle(height: 2, fontSize: 20),),
                  Text('FOR THE ICT432 CAPSTONE PROJECT' , style: TextStyle(height: 2, fontSize: 20),),
                ],
              ),

            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  child: Text('STOCK TRADING MADE EASIER!', style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 23)),
                  padding:EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.orange, borderRadius: BorderRadius.circular(12),
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

            Center(
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  children: [
                    SizedBox(
                      height:60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green, // background
                          onPrimary: Colors.white, // foreground
                        ),
                        onPressed: () {  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Help()));},
                        child: Text('CLICK HERE FOR HELP',  style: TextStyle(color: Colors.white, fontSize: 25)),

                      ),
                    )
                  ],
                ),
              ),

            ),


          ],
        ),



    );




  }
}