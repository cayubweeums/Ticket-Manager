import 'package:flutter/material.dart';
import 'package:ticket_manager/Objects/ticket.dart';
import 'dev_ticket_page.dart';


class OpenTicket extends StatefulWidget{
  //Strings are temporary, will be replaced with ticket information
  final String a;
  final String b;
  final String c;
  OpenTicket(this.a, this.b, this.c);
  OpenTick createState()=> OpenTick();
}

class OpenTick extends State<OpenTicket>{
  // Post holds the data from post in main.
  OpenTick();
  String dropdownValue = 'Open';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.a),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(widget.b),
                ),
                DropdownButton(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  underline: Container(
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                    },
                  items: <String>['Open', 'Pending', 'Closed']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
               ]
            ),
        )
    );
  }
}