import 'package:flutter/material.dart';
import 'home_page.dart';


class BlankPage extends StatefulWidget{
  @override
  State createState() => new BlankPageState();
}

class BlankPageState extends State<BlankPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Test Page"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        color: Colors.white10,
        padding: EdgeInsets.all(130.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text(
                "Test"
            ),
          ],
        ),
      ),
    );
  }
}
