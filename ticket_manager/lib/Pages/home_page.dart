import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ticket_manager/Objects/ticket.dart';
import 'package:ticket_manager/Widgets/text_field.dart';
import 'package:ticket_manager/Widgets/ticket_list.dart';

class HomePage extends StatefulWidget {
  final String userName;
  final dynamic user;
  HomePage(this.userName, this.user);

  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Ticket> tickets = [];

  void newTicket(String text) {
    this.setState(() {
      tickets.add(new Ticket(widget.userName, "User", text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.white10,
        padding: EdgeInsets.only(left: 8, right: 8),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: TicketList(this.tickets)),
            TextFieldWidget(this.newTicket),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                Navigator.of(context).pushNamed("/AddTicketPage");
              },
              splashColor: Colors.purpleAccent,
            )
          ],
        ),
      ),
    );
  }
}
