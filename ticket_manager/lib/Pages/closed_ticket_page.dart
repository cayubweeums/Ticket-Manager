import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ticket_manager/Objects/ticket.dart';
import 'package:ticket_manager/Pages/add_ticket_page.dart';
import 'package:ticket_manager/Services/database.dart';
import 'package:ticket_manager/Widgets/text_field.dart';
import 'package:ticket_manager/Widgets/ticket_list.dart';

class ClosedTicketPage extends StatefulWidget {
  final String userName;
  final dynamic user;
  ClosedTicketPage(this.userName, this.user);

  @override
  State createState() => new ClosedTicketPageState();
}

class ClosedTicketPageState extends State<ClosedTicketPage> {
  List<Ticket> tickets = [];

  void loadClosedTickets() {
    getClosedTicketList().then((tickets) => {
      this.setState(() {
        this.tickets = tickets;
      })
    });
  }

  @override
  void initState() {
    super.initState();
    loadClosedTickets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orangeAccent,
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                    ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                            Icons.refresh
                        ),
                        onPressed: (){
                          loadClosedTickets();
                        },
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(widget.userName),
                    ],
                  )
                ],
              ),
              Expanded(child: TicketList(this.tickets, widget.userName)),
            ]
        ),
      ),
    );
  }
}
