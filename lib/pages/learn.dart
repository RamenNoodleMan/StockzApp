import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Learn extends StatefulWidget {
  const Learn({Key? key}) : super(key: key);

  @override
  _LearnState createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  var linkText = TextStyle(color: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BUYING STOCKS ONLINE', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w300), ),
          backgroundColor: Colors.red[800],
          leading: BackButton(
            color: Colors.white,
          ), ),
        backgroundColor: Colors.white,
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text('HOW TO BUY STOCKS ONLINE!', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, height: 2)),
                ),
                Center(
                  child: Text('1. Select an online stockbroker', style: TextStyle(height: 2, fontWeight: FontWeight.w700)),
                ),
                Center(
                  child: Text('The easiest way to buy stocks is through an online stockbroker. After opening and funding your account, you can buy stocks through the broker’s website in a matter of minutes. Other options include using a full-service stockbroker, or buying stock directly from the company.'),
                ),
                SizedBox(height: 12),
                Center(
                  child: Text('2. Research the stocks you want to buy', style: TextStyle(height: 2, fontWeight: FontWeight.w700)),
                ),
                SizedBox(height: 4),
                Center(
                  child: Text('Once you’ve set up and funded your brokerage account, it’s time to dive into the business of picking stocks. '),
                ),
                Center(
                  child: Text('A good place to start is by researching companies you already know from your experiences as a consumer.'),
                ),
                SizedBox(height: 12),
                Center(
                  child: Text('3. Decide how many shares to buy',style: TextStyle(height: 2, fontWeight: FontWeight.w700)),
                ),
                SizedBox(height: 6),
                Center(
                  child: Text('You should feel absolutely no pressure to buy a certain number of shares or fill your entire portfolio with a stock all at once.'),
                ),
                SizedBox(height: 6),
                Center(
                  child: Text('If you are ready to put real money down, you can start small - really small. You could purchase just a single share to get a feel for what it’s like to own individual stocks and whether you have the fortitude to ride through the rough patches with minimal sleep loss. You can add to your position over time as you master the shareholder swagger.'),
                ),
                SizedBox(height: 12),
                Center(
                  child: Text('4. Choose your stock order type',style: TextStyle(height: 2, fontWeight: FontWeight.w700)),
                ),
                SizedBox(height: 6),
                Center(
                  child: Text('Market orders: With a market order, you’re indicating that you’ll buy or sell the stock at the best available current market price.'),
                ),
                SizedBox(height: 6),
                Center(
                  child: Text('Limit orders; A limit order gives you more control over the price at which your trade is executed.'),
                ),

                Center(
                  child: Text('On the selling side, a limit order tells your broker to part with the shares once the bid rises to the level you set.Limit orders are a good tool for investors buying and selling smaller company stocks, which tend to experience wider spreads, depending on investor activity.'),
                ),

                SizedBox(height: 12),
                Center(
                  child: Text('5. Optimize your stock portfolio',style: TextStyle(height: 2, fontWeight: FontWeight.w700)),
                ),
                SizedBox(height: 6),
                Center(
                  child: Text('Once you are familiar with the stock purchasing process, take the time to dig into other areas of the investment world. '),
                ),
                SizedBox(height: 12),

                Center(
                  child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                style: linkText,
                                text: 'From nerdwallet',
                                recognizer: TapGestureRecognizer ()..onTap = () async {
                                  var url = "https://www.nerdwallet.com/article/investing/how-to-buy-stocks#:~:text=The%20easiest%20way%20to%20buy,stock%20directly%20from%20the%20company.";
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
