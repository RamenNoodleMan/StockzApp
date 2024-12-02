import 'package:flutter/material.dart';

class Dummy extends StatefulWidget {
  const Dummy({Key? key}) : super(key: key);

  @override
  _DummyState createState() => _DummyState();
}

class _DummyState extends State<Dummy> {
  @override
  Widget build(BuildContext context) {
    return
      Container(color: Colors.white,
        child: Center(

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone_android_sharp,size: 150,color: Colors.black,),
              Icon(Icons.trending_up_sharp,size: 150,color: Colors.black,),
            ],
          ),
        ),
      );

  }
}