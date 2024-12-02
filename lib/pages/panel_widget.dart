import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  const PanelWidget({
    Key? key, required this.controller}) : super(key: key);


  @override
  Widget build(BuildContext context)=> Container(
    color: Colors.black,
    child: ListView(

      controller: controller,
      padding: EdgeInsets.zero,
      children: <Widget>[
        SizedBox(height: 10,),
        buildDragHandle(),
        SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text('BUSINESS ARTICLES',style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25, color: Colors.white),)),
        ),


        Icon(Icons.article_sharp,
            size: 30,
            color: Colors.white
        ),
        SizedBox(height: 25,),

        buildAboutText(),
        SizedBox(height: 20,),
        SizedBox(
          height: 260,
          width: 250,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
               ),
              child: Image.asset('assets/aet.webp')),
        ),
        SizedBox(height: 20,),
        Center(child: Text('Stock Trading Has Never Been Easier', style: TextStyle(color: Colors.white, fontSize: 25, fontStyle: FontStyle.italic), )),
        SizedBox(height: 20,),
        SizedBox(
          height: 260,
          width: 290,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Image.asset('assets/artic.jpg')),
        ),
        SizedBox(height: 20,),
        Center(child: Text('Build Your Portfolio & Become A Veteran Investor',
          style: TextStyle(color: Colors.white, fontSize: 22, fontStyle: FontStyle.italic), )),

        SizedBox(height: 20,),
        SizedBox(
          height: 260,
          width: 290,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Image.asset('assets/4t.webp')),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(child: Text('Shares can be bought from the tip of your fingers with online stock trading. Trading stocks has now become easy & more efficient. Many brokers now recommend online stock trading as it is easy & super convenient. Learn Online Trading Today & become an investor.',
            style: TextStyle(color: Colors.white, fontSize: 22, fontStyle: FontStyle.italic), textAlign: TextAlign.justify, )),
        ),



      ],
    ),
  ) ;

  Widget buildDragHandle()=> Center(
    child: Container(
      width: 30,
      height: 5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
    ),
  );

  Widget buildAboutText()=> Container(
    padding: EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Welcome to S T O C K Z business articles. Here you will useful articles to help your investments.', style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 25),),
        )
      ],
    ),
  );
}
