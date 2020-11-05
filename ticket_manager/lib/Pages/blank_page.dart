import 'package:flutter/material.dart';
import 'home_page.dart';


class BlankPage extends StatefulWidget{
  @override
  State createState() => new BlankPageState();
}

class BlankPageState extends State<BlankPage> {
  final controllerOne = TextEditingController();
  // String text = "";


  @override
  void dispose(){
    super.dispose();
    controllerOne.dispose();
  }


  // void changeText(text){
  //   setState(() {
  //     this.text = text;
  //   });
  // }


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
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controllerOne,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => {},
                  splashColor: Colors.pink,
                  tooltip: "Do a barrell roil",
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// https://www.youtube.com/watch?v=mXREh3S8Yw0