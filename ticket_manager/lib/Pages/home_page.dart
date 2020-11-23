import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ticket_manager/Objects/ticket.dart';
import 'package:ticket_manager/Pages/add_ticket_page.dart';
import 'package:ticket_manager/Services/database.dart';
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

  void newTicket(String title, String description) {
    var ticket = new Ticket(widget.userName, title, description, "open");
    var ticketId = saveTicket(ticket);
    ticket.setId(ticketId);
    this.setState(() {
      tickets.add(ticket);
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
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  colors: [Colors.purple, Colors.blueAccent])),
          padding: EdgeInsets.only(left: 8, right: 8),
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child: TicketList(this.tickets, widget.userName)),
                FlatButton(
                  highlightColor: Colors.redAccent,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddTicketPage(this.newTicket),
                      ),
                    );
                  },
                  child: Image.asset('assets/icon/service.png'),
                  shape: OutlineInputBorder(),
                )
              ]),
        ),
      ),
    );
  }
}
