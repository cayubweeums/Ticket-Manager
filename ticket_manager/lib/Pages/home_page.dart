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
  double xOffset = 0;
  double yOffset = 0;
  double scale = 1;
  bool menuPressed = false;
  List<Ticket> tickets = [];

  void newTicket(String title, String description, String longDescription) {
    var ticket = new Ticket(widget.userName, title, description, longDescription, "open");
    var ticketId = saveTicket(ticket);
    ticket.setId(ticketId);
    this.setState(() {
      tickets.add(ticket);
    });
  }

  void loadOpenTickets() {
    getOpenTicketList().then((tickets) => {
          this.setState(() {
            this.tickets = tickets;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    loadOpenTickets();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scale),
      duration: Duration(milliseconds: 150),
      child: Container(
        color: Colors.blueAccent,
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
                  menuPressed? IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                    ),
                    onPressed: () {
                      setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        scale = 1;
                        menuPressed = false;
                      });
                    },
                  ):IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      setState(() {
                        xOffset = 150;
                        yOffset = 0;
                        scale = 1;
                        menuPressed = true;
                      });
                    },
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.refresh
                        ),
                        onPressed: (){
                          loadOpenTickets();
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
    );
  }
}
