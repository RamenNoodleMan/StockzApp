import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:stockzz_app/pages/about.dart';
import 'package:stockzz_app/pages/account.dart';
import 'package:stockzz_app/pages/dummy.dart';


import 'package:stockzz_app/pages/home.dart';
import 'package:stockzz_app/pages/markets.dart';
import 'package:stockzz_app/pages/news.dart';
import 'package:stockzz_app/pages/portfolio.dart';
import 'package:stockzz_app/pages/sand2.dart';

import 'package:stockzz_app/pages/wallet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  int _selectedIndex = 0;
  late final Color? hoverColor;


  final List<Widget> _pages =[
    const Home(),
    const Markets(),
    const Portfolio(),
    const Wallet(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: Builder(
        builder: (context) => IconButton(
      icon: Icon(Icons.menu, size: 35,),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    ),),
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('S T O C K Z', style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 25),),
          actions: [
      IconButton(
      icon: const Icon(Icons.newspaper_rounded, size: 35,) ,
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const News()));
      },
    ),
  ]
    ),

      drawer: Container(
        width: 280,
        child: Drawer(
          child: Container(

            color: Colors.black,
            child: ListView(

              children: [
                const DrawerHeader(
                  child: Center(child: Text(' S T O C K Z',
                    style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.w300),

                  )),

                ),
                const SizedBox(
                  height: 40,
                ),
                ListTile(
                  hoverColor: Colors.grey,

                  leading: const Icon(Icons.account_circle, color :Colors.white, size: 35),
                  title: const Text(
                      'Account', style: const TextStyle(fontSize: 30, color: Colors.white),

                  ),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Account()));
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ListTile(
                  hoverColor: Colors.grey,
                  leading: const Icon(Icons.info_sharp,color :Colors.white, size: 35),
                  title: const Text(
                    'About', style: const TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const About()));
                  },
                ),
                const SizedBox(
                  height: 30,
                ),

                ListTile(
                  hoverColor: Colors.grey,
                  leading: const Icon(Icons.settings,color :Colors.white, size: 35),
                  title: const Text(
                    'Settings', style: const TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Dummy()));
                  },
                ),

                const SizedBox(
                  height: 20,
                ),



                const SizedBox(
                  height: 60,
                ),


                ListTile(
                  hoverColor: Colors.grey,
                  leading: const Icon(Icons.logout,color :Colors.white, size: 35),
                  title: const Text(
                    'Logout', style: const TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  onTap: (){
                    FirebaseAuth.instance.signOut();
                  },
                ),


              ],
            ),
          ),
        ),
      ),


      body:

      _pages[_selectedIndex],

      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
          child: GNav(


            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.white,
            textSize: 40,
            iconSize: 40,
            gap: 8,

            padding: const EdgeInsets.all(10),
            tabs: const [
              GButton(
                  icon: Icons.dashboard_rounded,
                text: 'Home',
              ),
              GButton(icon: Icons.trending_up_sharp,
                text: 'Markets',),
              GButton(icon: Icons.article_rounded,
                text: 'Portfolio',),
              GButton(icon: Icons.account_balance_wallet_rounded,
                text: 'Wallet',),


            ],

    selectedIndex: _selectedIndex,
    onTabChange: (index) {
    setState(() {
    _selectedIndex = index;
    });
    },
          ),
        ),
      ),
    );
  }
}
