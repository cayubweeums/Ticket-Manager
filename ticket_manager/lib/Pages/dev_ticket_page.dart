import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ticket_manager/Objects/ticket.dart';
import 'package:ticket_manager/Widgets/text_field.dart';
import 'package:ticket_manager/Widgets/ticket_list.dart';
import 'home_page.dart';
import 'dev_open_ticket.dart';

class DevTick extends StatefulWidget {
  DevTick();
  @override
  State createState() => new DevTickState();
}

class DevTickState extends State<DevTick> {
  //List<Ticket> tickets = [];

  //These strings are for testing purposes only and will be replaced with getting this information
  //from the tickets directly in the next build
  String a = "author";
  String b = "title";
  String c = "description";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Tickets"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
            child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  colors: [Colors.purple, Colors.blueAccent])),
          child: Container(
            color: Colors.white10,
            child: new Column(
              children: <Widget>[
                ListTile(
                  title: Text(b),
                  subtitle: Text(c),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OpenTicket(a, b, c)),
                    );
                  },
                ),
              ],
            ),
          ),
        )));
  }
}
