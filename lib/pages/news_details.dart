import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stockzz_app/pages/newsdata.dart';

class NewsDetails extends StatelessWidget {
  final NewsList news;
  NewsDetails(this.news);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('BUSINESS NEWS DETAILS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 18), ),
        backgroundColor: Colors.black,
        leading: BackButton(
          color: Colors.white,
        ),
      ),

      body: Scrollbar( 
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(news.image),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    news.title.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17.0, fontStyle: FontStyle.italic)
                  )
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Date: 1st June 2022',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white,fontSize: 18.0, fontStyle: FontStyle.italic)
                    )
                ),
                SizedBox(height: 5,),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        news.headlines.toString(),
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.white,fontSize: 22.0, fontStyle: FontStyle.italic)
                    )
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
