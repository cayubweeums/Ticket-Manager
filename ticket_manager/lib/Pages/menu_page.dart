import 'package:flutter/material.dart';
import 'package:ticket_manager/Pages/closed_ticket_page.dart';

class MenuPage extends StatefulWidget {
  final String userName;
  final dynamic user;
  MenuPage(this.userName, this.user);


  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(6.0),
          ),
          SizedBox(height: 50,),
          Row(
            children: <Widget>[
              OutlineButton(
                child: Text("Closed Tickets"),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ClosedTicketPage(widget.userName, widget.user)));
                },
                shape: new ContinuousRectangleBorder(borderRadius: new BorderRadius.all(Radius.zero)),
              )
            ]
          ),
        ]
      ),
    );
  }
}
