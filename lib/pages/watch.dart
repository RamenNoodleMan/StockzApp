import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stockzz_app/pages/marketItems.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Watch extends StatefulWidget {
  const Watch({Key? key}) : super(key: key);

  @override
  _WatchState createState() => _WatchState();
}

class _WatchState extends State<Watch> {
  @override
  Widget build(BuildContext context) {
    List<MarketItems> items = List.of(allMarkets);
    return Scaffold(
      appBar: AppBar(
        title: Text('WATCHLIST',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 25),),
        backgroundColor: Colors.black,
        leading: BackButton(
          color: Colors.white,
        ),),

      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return
              GestureDetector(
                onTap: (){
                  print(items.length);
                },
                child: Dismissible(
                  background: Container(
                    padding: const EdgeInsets.only(right: 50),
                    child:Icon(Icons.close_sharp, color: Colors.white,),
                    alignment: Alignment.centerRight,
                    color: Colors.red,
                  ),
                  key: ValueKey(items[index]),
                  onDismissed: (direction){
                    items.removeAt(index);
                  },
                  child: buildListTile(item),
                ),
              );
          }
          ),
    );

  }


  Widget buildListTile(MarketItems item)=> ListTile(
    contentPadding: EdgeInsets.symmetric(
      horizontal: 16,
      vertical:16,
    ),
    leading: ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 40,
        minHeight: 40,
        maxWidth: 60,
        maxHeight: 60,
      ),
      child: Image.asset(item.imageUrl, fit: BoxFit.cover),
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
        child: Center(child: Text(item.description.toString(),  style: TextStyle(fontSize:16,color: item.description < 0 ? Colors.red [700] : Colors.green[800] ),))
    ),

    title: Text(item.title
      ,style: TextStyle(fontSize:20),
    ),
    onTap: (){},
  );

}
