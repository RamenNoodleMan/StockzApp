import 'package:flutter/material.dart';
import 'package:stockzz_app/pages/portfoliodata.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    child: Text('HOLDINGS', style: TextStyle(color: Colors.black, fontSize: 17)),
                    padding:EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white70, borderRadius: BorderRadius.circular(12),
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

              Expanded(
                child: ListView.builder(
                    itemCount: portList.length,
                    itemBuilder: (context, index){
                      PortfolioList port = portList[index];
                      return Card(
                        child: ListTile(
                          title: Text(port.title, style: TextStyle(fontSize:14,)),
                          subtitle: Text(port.description.toString(), style: TextStyle(fontSize:12,)),
                          isThreeLine: true,
                          trailing: Text(port.stockprice.toString(), style: TextStyle(fontSize:12, color: Colors.green)),


                        ),
                      );


                    }),
              ),
            ],
          ),
        ));
  }
}
