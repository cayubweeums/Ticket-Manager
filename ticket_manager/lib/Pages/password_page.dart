import 'package:flutter/material.dart';
import 'dev_ticket_page.dart';

class PassPage extends StatefulWidget {
  @override
  State createState() => new PassPageState();
}

//Password is "password"

class PassPageState extends State<PassPage> {
  TextEditingController _controller = new TextEditingController();
  get passtext => _controller.text;

  _checksum() {
    if (passtext == "password") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DevTick()));
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
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    colors: [Colors.purple, Colors.blueAccent])),
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
                RaisedButton(
                  onPressed: () {
                    _checksum();
                  },
                  child: Text('Enter Password'),
                ),
              ],
            ),
          ),
        ));
  }
}
