import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticket_manager/Services/auth.dart';
import 'dart:ui';


import 'home_page.dart';


class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  String userName;
  dynamic user;

  AuthService _authService = AuthService();

  TextEditingController controllerOne = TextEditingController();

  final hintTextStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'OpenSans',
  );

  final labelStyle = TextStyle(
    color: Colors.blueAccent,
    fontWeight: FontWeight.bold,
    fontFamily: 'OpenSans',
  );

  final boxDecorationStyle = BoxDecoration(
    color: Colors.blueAccent,
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );


  @override
  Widget build(BuildContext context) {
    return loginPage();
  }


  void login(){

    this.userName = controllerOne.text;
    this.user = _authService.signInAnonymously();
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(userName, user)));

  }



  Widget _buildNameTF() {
    return Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Name',
              style: labelStyle,
            ),
            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: boxDecorationStyle,
              height: 60.0,
              child: TextField(
                controller: controllerOne,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.purple,
                  ),
                  hintText: 'Enter your Name',
                  hintStyle: hintTextStyle,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
          ],
        )
    );
  }


  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: this.login,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.purple,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }



  // Page for entering login info and attempting to login or creating a new user
  Widget loginPage() {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildNameTF(),
                      _buildLoginBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
