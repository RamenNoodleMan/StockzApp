import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:stockzz_app/pages/learn.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  var linkText = TextStyle(color: Colors.blue, fontSize: 25);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HELP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 25), ),
          backgroundColor: Colors.green,
          leading: BackButton(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.white,
        body: Scrollbar(
          showTrackOnHover: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('LEARN MORE ABOUT STOCK TRADING ONLINE!', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, height: 1, fontSize: 25, ), textAlign: TextAlign.center,),
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: Text('What Are Stocks?', style: TextStyle(height: 1, fontSize: 25)),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text('A stock is a financial instrument that represents ownership in a company or corporation and represents a proportionate claim on its assets (what it owns) and earnings (what it generates in profits). Stocks are also called shares or company equity.', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400,  fontSize: 20, ), textAlign: TextAlign.justify,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text('Stocks represent ownership equity in the firm and give shareholders voting rights as well as a residual claim on corporate earnings in the form of capital gains and dividends.', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400,  fontSize: 20, ), textAlign: TextAlign.justify,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text('Individual and institutional investors come together on stock exchanges to buy and sell shares in a public venue. These days this can be done online!', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400,  fontSize: 20, ), textAlign: TextAlign.justify,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text('Stock ownership implies that the shareholder owns a slice of the company equal to the number of shares held as a proportion of the companys total outstanding shares. For instance, an individual or entity that owns 100,000 shares of a company with one million outstanding shares would have a 10% ownership stake in it.', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400,  fontSize: 20, ), textAlign: TextAlign.justify,),
                  ),
                ),
                SizedBox(height: 9),


                Center(
                  child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                            style: linkText,
                            text: 'From Investopedia',
                            recognizer: TapGestureRecognizer ()..onTap = () async {
                              var url = "https://www.investopedia.com/articles/investing/082614/how-stock-market-works.asp#toc-why-companies-issue-shares";
                              if(await canLaunch(url)){
                                await launch(url);
                              } else{
                                throw "Sorry Cannot Reach Link";
                              }
                              }
                          )
                        ]
                    )
                  ),
                ),
                SizedBox(height: 1),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height:60,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.lightGreen, // background
                                onPrimary: Colors.white, // foreground
                              ),
                              onPressed: () {  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Learn()));},
                              child: Text('CLICK HERE TO LEARN MORE',  style: TextStyle(color: Colors.white, fontSize: 25)),

                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                ),


                Center(
                  child: Text(''),
                ),
                Center(
                  child: Text(''),
                ),
              ],
            ),
          ),
        ));




  }
}
