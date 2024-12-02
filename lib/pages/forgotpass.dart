import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {

  final _emailController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());

      showDialog(context: context, builder: (context)
      {
        return AlertDialog(
          content: Text('Password Reset Link Sent! Check Your Email'),
        );
      });
    } on FirebaseAuthException catch (e){
      print(e);
      showDialog(context: context, builder: (context)
      {
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(

        backgroundColor: Colors.black,
        elevation: 0,
        leading: GestureDetector(
          child: Icon( Icons.arrow_back_ios, color: Colors.white,  ),
          onTap: () {
            Navigator.pop(context);
          } ,
        ) ,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 70,),


            Text('S T O C K Z', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 60,color: Colors.white),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone_android_sharp,size: 80,color: Colors.white,),
                Icon(Icons.trending_up_sharp,size: 80,color: Colors.white,),
              ],
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text('Enter Your E-mail and we will send you a password reset link',
                style: TextStyle(color: Colors.white,fontSize: 20),
              textAlign: TextAlign.center,),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SizedBox(
                height: 60,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:20.0),
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
            SizedBox(height: 20,),
            SizedBox(
              height: 60,
              width: 380,
              child: MaterialButton(onPressed: passwordReset,
              child: Text('Reset Password', style: TextStyle(color:Colors.white, fontSize: 25)),
              color: Colors.blue,),
            )
          ],
        ),
      )
    );
  }
}
