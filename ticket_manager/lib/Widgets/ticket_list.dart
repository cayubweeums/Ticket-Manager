import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_manager/Objects/ticket.dart';
import 'package:ticket_manager/Services/database.dart';
import 'package:ticket_manager/Pages/home_page.dart';

class TicketList extends StatefulWidget {

  //Made tickets not final

  List<Ticket> tickets;
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

  void buttonHandler(Ticket ticket){
    changeState(ticket);
    loadOpenTickets();
  }

  void loadOpenTickets(){
    getOpenTicketList().then((tickets) => {
      this.setState(() {
        this.widget.tickets = tickets;
      })
    });
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
                Row(
                  children: <Widget>[
                    Text("Author: "),
                    Text(ticket.author)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Description: "),
                    Text(ticket.description),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Status: "),
                        Text(ticket.state),
                      ],
                    ),
                  ],
                ),
                FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(6.0),
                  splashColor: Colors.purpleAccent,
                  onPressed: () {buttonHandler(ticket);},
                  child: Text(
                      "Close"
                  ),
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