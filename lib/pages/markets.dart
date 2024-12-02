import 'package:flutter/material.dart';
import 'package:stockzz_app/pages/marketdata.dart';


import 'company_details.dart';

class Markets extends StatefulWidget {
  const Markets({Key? key}) : super(key: key);

  @override
  _MarketsState createState() => _MarketsState();
}

class _MarketsState extends State<Markets> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
      body: Scrollbar(
        child: ListView.builder(

            itemCount: marketList.length,
            itemBuilder: (context, index){
              MarkList marke = marketList[index];



              return Card(

                child: ListTile(


                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>CompanyDetailsScreen(marke)));
                  },
                  title: Text(marke.title, style: TextStyle(fontSize:18,)),
                  subtitle: Text(marke.stockprice.toString(), style: TextStyle(fontSize:16,)),
                  isThreeLine: true,





                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 40,
                      minHeight: 40,
                      maxWidth: 60,
                      maxHeight: 60,
                    ),
                    child: Image.asset(marke.imageUrl, fit: BoxFit.cover),


                  ),


                  trailing: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white70,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow:[
                          BoxShadow(
                            color: Colors.grey.shade400,
                            offset: Offset(1,2),
                            blurRadius: 0,
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(-1,-2),
                            blurRadius: 6,
                            spreadRadius: 0,
                          ),
                        ] ,
                      ),
                      child: Center(child: Text(marke.description.toString(),  style: TextStyle(fontSize:16,color: marke.description < 0 ? Colors.red [700] : Colors.green[800] ),))
                  ),


                ),
              );


            }
            ),
      )
    );
  }
}
