import 'package:firebase_database/firebase_database.dart';

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

  Map<String, dynamic> toJson(){
    return {
      'author': this.author,
      'title': this.title,
      'description': this.description,
      'state': this.state
    };
  }

}