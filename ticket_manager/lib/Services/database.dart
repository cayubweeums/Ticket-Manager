import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ticket_manager/Objects/ticket.dart';

final databaseInstance = FirebaseDatabase.instance;
final databaseRef = databaseInstance.reference();

DatabaseReference saveTicket(Ticket ticket){
  var id = databaseRef.child('tickets/').child("open/").push();
  id.set(ticket.toJson());
  return id;
}

//TODO might want to watch video 11 and change way we implement altering the state to his "update"
void changeTicketState1(Ticket ticket, String state){
  if(state == "open"){
    // ticket.getId().remove();
    // ticket.setState(state);
    // var id = databaseRef.child('tickets/').child("open/").push();
    // id.set(ticket.toJson());
  }else{
    ticket.getId().remove();
    ticket.setState(state);
    var id = databaseRef.child('tickets/').child("closed/").push();
    id.set(ticket.toJson());
  }
}


void changeTicketState2(Ticket ticket, String state){
  if(state == "open"){
    ticket.getId().remove();
    ticket.setState(state);
    var id = databaseRef.child('tickets/').child("open/").push();
    id.set(ticket.toJson());
  }else{
    // ticket.getId().remove();
    // ticket.setState(state);
    // var id = databaseRef.child('tickets/').child("closed/").push();
    // id.set(ticket.toJson());
  }
}


void updateTicket(Ticket ticket, DatabaseReference id){
  id.update(ticket.toJson());
}


Future<List<Ticket>> getOpenTicketList() async {
  DataSnapshot dS = await databaseRef.child('tickets/').child('open/').once();
  List<Ticket> tickets = [];
  if(dS.value != null){
    dS.value.forEach((key, value) {
      Ticket ticket = createTicket(value);
      ticket.setId(databaseRef.child('tickets/').child('open/' + key));
      tickets.add(ticket);
    });
  }
  return tickets;
}


Future<List<Ticket>> getClosedTicketList() async {
  DataSnapshot dS = await databaseRef.child('tickets/').child('closed/').once();
  List<Ticket> tickets = [];
  if(dS.value != null){
    dS.value.forEach((key, value) {
      Ticket ticket = createTicket(value);
      ticket.setId(databaseRef.child('tickets/').child('closed/' + key));
      tickets.add(ticket);
    });
  }
  return tickets;
}


Ticket createTicket(item) {
  Map<String, dynamic> keys = {
    'author': '',
    'title': '',
    'description': '',
    'longDescription': '',
    'state': ''
  };

  item.forEach((key, value) => {keys[key] = value});
  Ticket ticket = new Ticket(keys["author"], keys["title"], keys["description"], keys["longDescription"], keys["state"]);

  return ticket;
}
