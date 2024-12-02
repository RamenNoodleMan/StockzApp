import 'package:flutter/material.dart';
import 'package:stockzz_app/pages/news_details.dart';
import 'package:stockzz_app/pages/newsdata.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stockzz_app/pages/panel_widget.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {

  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height*0.2;
    final panelHeightOpen = MediaQuery.of(context).size.height*0.9;

    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('BUSINESS NEWS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 25), ),
          backgroundColor: Colors.black,
          leading: BackButton(
            color: Colors.white,
          ),
        ),
        body: SlidingUpPanel(
          maxHeight: panelHeightOpen,
          minHeight: panelHeightClosed,

          panelBuilder: (controller)=> PanelWidget(
            controller: controller,
          ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
        body: Scrollbar(
          child: ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index){
                NewsList news = newsList[index];
                return Card(
                  child: SizedBox(
                    height: 120,
                    child: ListTile(
                      title: Text(news.title, style: TextStyle(fontSize: 25)),
                      //subtitle: Text(news.headlines.toString()),
                      leading: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: 44,
                          minHeight: 44,
                          maxWidth: 64,
                          maxHeight: 64,
                        ),
                        child: Image.asset(news.image, fit: BoxFit.cover),
                      ),


                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsDetails(news)));

                },
                ),
                ));


              }),
        ),

        ),
    );
  }
}