import 'package:flutter/material.dart';


class HomePage extends StatefulWidget{
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{


  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.white10,
        padding: const EdgeInsets.all(80.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true, signed: false),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintStyle: TextStyle(
                      color: Colors.grey
                  )
              ),
              style: TextStyle(
                color: Colors.green,
              ),
            ),
            new IconButton(
                icon: Icon(Icons.accessibility),
                color: Colors.blueAccent
            ),
          ],
        ),
      ),
    );
  }
}


