import 'package:firebase_database/firebase_database.dart';
import 'package:ticket_manager/Services/database.dart';

class Ticket{
  DatabaseReference _id;
  String author;
  String title;
  String description;
  String state;

  Ticket(this.author, this.title, this.description, this.state);


  void setId(DatabaseReference id){
    this._id = id;
  }

  DatabaseReference getId(){
    return this._id;
  }

  void setState(String state){
    this.state = state;
  }

  Map<String, dynamic> toJson(){
    return {
      'author': this.author,
      'title': this.title,
      'description': this.description,
      'state': this.state
    };
  }

  void update(){
    updateTicket(this, this._id);
  }

// Ticket createTicket(item) {
//   Map<String, dynamic> keys = {
//     'author': '',
//     'title': '',
//     'description': '',
//     'state': ''
//   };
//
//   item.forEach((key, value) => {keys[key] = value});
//   Ticket ticket = new Ticket(keys[author].toString(), keys[title].toString(), keys[description].toString(), keys[state].toString());
//
//   return ticket;
// }

}
