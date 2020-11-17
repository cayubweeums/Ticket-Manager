import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_manager/Objects/ticket.dart';

class TicketList extends StatefulWidget {
  final List<Ticket> tickets;
  final dynamic user;

  TicketList(this.tickets, this.user);


  @override
  _TicketListState createState() => _TicketListState();
}

class _TicketListState extends State<TicketList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index){
        var ticket = this.widget.tickets[index];
        return Card(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text(ticket.title),
                  subtitle: Text(ticket.author),
                ),
              ),
              Row(
                children: <Widget>[
                  Text(ticket.description)
                ],
              )
            ],
          ),
        );
      },
      itemCount: this.widget.tickets.length,
    );
  }
}
