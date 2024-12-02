import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _nrcController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passController.dispose();
    _confirmpasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _nrcController.dispose();
    super.dispose();
  }

  Future signUp () async {
    if (passwordConfirmed()){
      //create user
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passController.text.trim(),
    );
    //add user details
      addUserDetails(
        _firstNameController.text.trim(),
          _lastNameController.text.trim(),
        _emailController.text.trim(),
          int.parse(_nrcController.text.trim()),

          );
  }}

  Future addUserDetails(String firstName, String lastName, String email, int nrc) async{
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'NRC Number':nrc,

    });
  }

  bool passwordConfirmed(){
    if (_passController.text.trim() == _confirmpasswordController.text.trim())
      {
        return true;
      }else{
      return false;
    }
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
                SizedBox(height: 60,),

                Text('S T O C K Z', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 40,color: Colors.white),),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone_android_sharp,size: 30,color: Colors.white,),
                    Icon(Icons.trending_up_sharp,size: 30,color: Colors.white,),
                  ],
                ),
                SizedBox(height: 3,),
                Text('New To The App?', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25,fontStyle: FontStyle.italic,color: Colors.white ),),
                SizedBox(height: 3,),
                Text('Register Your Account Below', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25,fontStyle: FontStyle.italic,color: Colors.white),),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: SizedBox(
                    height: 60,
                    width: 350,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:20.0),
                        child: TextField(
                          controller: _firstNameController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'First Name',
                              hintStyle: TextStyle(fontSize: 20)
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: SizedBox(
                    height: 60,
                    width: 350,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:20.0),
                        child: TextField(
                          controller: _lastNameController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Last Name',
                              hintStyle: TextStyle(fontSize: 20)
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: SizedBox(
                    height: 60,
                    width: 350,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:20.0),
                        child: TextField(
                          controller: _nrcController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'NRC Number',
                              hintStyle: TextStyle(fontSize: 20)
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8,),


                //Email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: SizedBox(
                    height: 60,
                    width: 350,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:20.0),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                              hintStyle: TextStyle(fontSize: 20)
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
//password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: SizedBox(
                    height: 60,
                    width: 350,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:20.0),
                        child: TextField(
                          controller: _passController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(fontSize: 20)
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 8,),
// confirm password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: SizedBox(
                    height: 60,
                    width: 350,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:20.0),
                        child: TextField(
                          controller: _confirmpasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(fontSize: 20)
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: SizedBox(
                      height: 70,
                      width: 350,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Center(
                            child: Text('Sign Up', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25,))),
                      ),
                    ),
                  ),
                ),



                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('I am a member', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize: 25 ),),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        ' Login Now', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 25),),
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
