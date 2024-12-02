import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stockzz_app/pages/forgotpass.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  Future signIn() async {
    //loading

    showDialog(
        context: context,
        builder: (context){
      return Center(child:
      SpinKitCubeGrid(
        size:140,
        
        color: Colors.blueAccent,
      ));
    },);

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passController.text.trim());

    //pop the loading circle
    Navigator.of(context).pop();

  }

  @override
  void dispose(){
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100,),

                Text('S T O C K Z', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 60,color: Colors.white),),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone_android_sharp,size: 70,color: Colors.white,),
                    Icon(Icons.trending_up_sharp,size: 70,color: Colors.white,),
                  ],
                ),
                SizedBox(height: 10,),
                Text('Hello There! Welcome To  S T O C K Z', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 22,fontStyle: FontStyle.italic,color: Colors.white ),),
                SizedBox(height: 10,),
                Text('Stock Trading Is Now Easier', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25,fontStyle: FontStyle.italic,color: Colors.white),),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: SizedBox(
                        height: 60,
                        width: 350,
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                              hintStyle: TextStyle(fontSize: 25)
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: SizedBox(
                        height: 60,
                        width: 350,
                        child: TextField(
                          controller: _passController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(fontSize: 25)
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap:(){
                          Navigator.push(context,MaterialPageRoute(builder: (context){
                            return ForgotPass();
                          },
                          ),
                          );
                },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(120,0,0,0),
                            child: Text('Forgot Password?', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: SizedBox(
                      height: 70,
                      width: 380,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black,
                            border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(13)
                        ),
                        child: Center(
                            child: Text('Sign In', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30,))),
                      ),
                    ),
                  ),
                ),




                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Do Not Have An Account?', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize: 20 ),),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text(
                        ' Register Now', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
