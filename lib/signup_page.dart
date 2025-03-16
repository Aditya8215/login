import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_login/reusable_widgets/resuable_widgets.dart';
import'package:firebase_login/home_page.dart';
import 'package:firebase_login/signin_page.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _usernameTextController=TextEditingController();
  TextEditingController _emailTextController=TextEditingController();
  TextEditingController _passwordTextController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        elevation: 5,
        title: Text('Sign Up',style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
      ),
      body:Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:
          [
            Colors.indigo.shade50,
            Colors.lightBlue.shade50,
            Colors.blue.shade100,
          ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 80,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: reusableTextField('Enter UserName', Icons.person_outline, false,_usernameTextController),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: reusableTextField('Enter Email Id',Icons.lock_outline , true, _emailTextController),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: reusableTextField('Enter Passsword',Icons.lock_outline , true, _passwordTextController),
                ),
                SizedBox(height: 20,),
                signInButton(context, false, (){
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text).then((value){
                    print("Created New Account");
                    Navigator.pushNamed(context,'home_page');
                  }).onError((error,stackTrace){
                    print('Error ${error.toString()}');
                  });

                }),
                SizedBox(height: 10,),
                // signUpOptions(),
              ],
            ),),
        ),
      ),
    );
  }
}
