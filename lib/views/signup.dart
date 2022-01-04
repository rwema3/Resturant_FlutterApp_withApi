import 'package:rwemaapi/helper/helperfunctions.dart';
import 'package:rwemaapi/helper/theme.dart';
import 'package:rwemaapi/screens/home.dart';
import 'package:rwemaapi/screens/new_hm.dart';
import 'package:rwemaapi/services/auth.dart';
import 'package:rwemaapi/services/database.dart';
import 'package:rwemaapi/views/signin.dart';
import 'package:rwemaapi/widget/widget.dart';
import 'package:flutter/material.dart';

import 'or_divider.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp(this.toggleView);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController usernameEditingController =
  new TextEditingController();

  AuthService authService = new AuthService();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  singUp() async {

    if(formKey.currentState.validate()){
      setState(() {

        isLoading = true;
      });

      await authService.signUpWithEmailAndPassword(emailEditingController.text,
          passwordEditingController.text).then((result){
        if(result != null){

          Map<String,String> userDataMap = {
            "userName" : usernameEditingController.text,
            "userEmail" : emailEditingController.text
          };

          databaseMethods.addUserInfo(userDataMap);

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(usernameEditingController.text);
          HelperFunctions.saveUserEmailSharedPreference(emailEditingController.text);

          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => WebViewApp()
          ));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Color(0xff07172f),
            Color(0xff07172f),
            Color(0xff0a3344),
            Color(0xff0a3344),
          ],
        ),
      ),
      child: Scaffold( backgroundColor: Colors.transparent,
        appBar: appBarMain(context),
        body: isLoading ? Container(child: Center(child: CircularProgressIndicator(),),) :  Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(

            children: [
              Spacer(),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: simpleTextStyle(),
                      controller: usernameEditingController,
                      validator: (val){
                        return val.isEmpty || val.length < 3 ? "Enter Username 3+ characters" : null;
                      },
                      decoration: textFieldInputDecoration("username"),
                    ),
                    TextFormField(
                      controller: emailEditingController,
                      style: simpleTextStyle(),
                      validator: (val){
                        return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                        null : "Enter correct email";
                      },
                      decoration: textFieldInputDecoration("email"),
                    ),
                    TextFormField(
                      obscureText: true,
                      style: simpleTextStyle(),
                      decoration: textFieldInputDecoration("password"),
                      controller: passwordEditingController,
                      validator:  (val){
                        return val.length < 6 ? "Enter Password 6+ characters" : null;
                      },

                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: (){
                  singUp();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xff0a3344),
                          const Color(0xff07172f)
                        ],
                      )),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Sign Up",
                    style: biggerTextStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 16,
              ),


              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: simpleTextStyle(),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.toggleView();
                    },
                    child: Text(
                      "SignIn now",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
