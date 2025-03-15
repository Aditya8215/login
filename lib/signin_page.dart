import 'package:flutter/material.dart';
import 'package:login_1/reusable_widgets/resuable_widgets.dart';
import 'package:login_1/utils/colors_utils.dart';
import 'package:login_1/signup_page.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailTextController=TextEditingController();
  TextEditingController _passwordTextController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          child: Padding(padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height*0.2, 20, 80),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/pic.png"),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: reusableTextField('Enter UserName', Icons.person_outline, false,_emailTextController),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: reusableTextField('Enter Passsword',Icons.lock_outline , true, _passwordTextController),
                ),
                SizedBox(height: 20,),
                signInButton(context, true, (){
                  Navigator.pushNamed(context,'home_page');
                }),
                SizedBox(height: 10,),
                signUpOptions(),
              ],
            ),),
        ),
      ),
    );
  }
  Row signUpOptions(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account! ",style: TextStyle(color: Colors.black12),),
        GestureDetector(
            onTap: (){
              Navigator.pushNamed(context,"signup_page");
            },
            child: Text('Sign Up',style: TextStyle(color: Colors.black26,fontWeight: FontWeight.bold),))
      ],
    );
  }
}
