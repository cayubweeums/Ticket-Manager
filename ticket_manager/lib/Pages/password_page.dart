import 'package:flutter/material.dart';
import 'package:ticket_manager/Services/auth.dart';

import 'handler_page.dart';


class PassPage extends StatefulWidget {
  @override
  State createState() => new PassPageState();
}

//Password is "password"

class PassPageState extends State<PassPage> {
  String userName;
  dynamic user;

  AuthService _authService = AuthService();

  TextEditingController _controller = new TextEditingController();
  get passText => _controller.text;

  _checksum() {
    if (passText == "password") {
      this.userName = "Admin";
      this.user = _authService.signInAnonymously();
      Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) => HandlerPage(userName, user)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Dev Password"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _controller,
                  enableSuggestions: false,
                  autocorrect: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'the password is "password"',
                  ),
                ),
                Container(
                  child: RaisedButton(
                    elevation: 5.0,
                    onPressed: () {
                      _checksum();
                    },
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    color: Colors.orangeAccent,
                    child: Text('Enter Password'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
