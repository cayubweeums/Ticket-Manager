import 'package:flutter/material.dart';
import 'home_page.dart';


class BlankTwoPage extends StatefulWidget{
  @override
  State createState() => new BlankTwoPageState();
}

class BlankTwoPageState extends State<BlankTwoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Test Page"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
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
