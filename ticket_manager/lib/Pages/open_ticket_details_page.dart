import 'package:flutter/material.dart';
import 'package:ticket_manager/Objects/ticket.dart';
import 'package:ticket_manager/Services/database.dart';

class OpenTicketDetailsPage extends StatefulWidget {
  final Ticket ticket;
  final userName;
  OpenTicketDetailsPage(this.ticket, this.userName);



  @override
  _OpenTicketDetailsPageState createState() => _OpenTicketDetailsPageState();
}

class _OpenTicketDetailsPageState extends State<OpenTicketDetailsPage> {
  bool isAdmin = false;
  bool isOpen = true;

  void checkAdmin(){
    if(widget.userName == "Admin"){
      isAdmin = true;
    }else{
      isAdmin = false;
    }
  }

  void setIsOpen(){
    if(widget.ticket.state == "closed"){
      isOpen = false;
    }
  }


  void changeState(Ticket ticket){
    print(ticket.getId().toString());
    if(isAdmin){
      if(ticket.state == "open"){
        this.setState(() {
          changeTicketState1(ticket, "closed");
        });
      }else{
      }
    }
  }

  Widget customText(Ticket ticket){
    if(isOpen){
      return Text(
        widget.ticket.state,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      );
    }else{
      return Text(
        widget.ticket.state,
        style: TextStyle(
            color: Colors.white,
            fontSize: 20
        ),
      );
    }
  }


  @override
  void initState() {
    super.initState();
    checkAdmin();
    setIsOpen();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blueAccent,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                    ),
                  )
                ],
              )
          ),
          Container(
            margin: EdgeInsets.only(top: 25.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              )
          ),
          Container(
            margin: EdgeInsets.only(top: 150.0, right: 35.0, left: 35.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          widget.ticket.author,
                          style: TextStyle(
                              fontSize: 65
                          ),
                        ),
                        Text(
                          widget.ticket.title,
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.black38
                          ),
                        ),
                      ],
                  )
                  )
                  ),
                ),
              ),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 450,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0))
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    SizedBox(height: 25.0,),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                              widget.ticket.description,
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black
                              )
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                              widget.ticket.longDescription,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black38
                              ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  changeState(widget.ticket);
                });
              },
              child: Container(
                height: 200,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: customText(widget.ticket),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
