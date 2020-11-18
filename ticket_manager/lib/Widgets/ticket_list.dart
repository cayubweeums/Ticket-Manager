import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_manager/Objects/ticket.dart';
import 'package:ticket_manager/Services/database.dart';

class TicketList extends StatefulWidget {
  final List<Ticket> tickets;
  final dynamic user;

  TicketList(this.tickets, this.user);


  @override
  _TicketListState createState() => _TicketListState();
}

class _TicketListState extends State<TicketList> {


  void changeState(Ticket ticket){
    print(ticket.getId().toString());
    if(ticket.state == "open"){
      this.setState(() {
        changeTicketState(ticket, "close");
      });
    }else{
      this.setState(() {
        changeTicketState(ticket, "open");
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index){
        var ticket = this.widget.tickets[index];
        return Card(
          child: Padding(
            padding: EdgeInsets.only(
                top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
            child: ExpansionTile(
              title: Text(ticket.title),
              children: <Widget>[
                Text(ticket.author),
                Text(ticket.description),
                Row(
                  children: <Widget>[
                    Text(ticket.state),
                    FlatButton(
                      onPressed: () {changeState(ticket);},
                      child: Image.asset('assets/icon/service.png'),
                      splashColor: Colors.purpleAccent,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
      itemCount: this.widget.tickets.length,
    );
  }
}


// https://stackoverflow.com/questions/54986328/how-to-make-expandable-card