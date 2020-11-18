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


void changeTicketState(Ticket ticket, String state){
  if(state == "open"){
    // ticket.getId().remove();
    // ticket.setState(state);
    // saveTicket(ticket);
  }else{
    ticket.getId().remove();
    ticket.setState(state);
    var id = databaseRef.child('tickets/').child("closed/").push();
    id.set(ticket.toJson());
  }
}