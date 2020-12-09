import 'package:flutter_test/flutter_test.dart';
import 'package:ticket_manager/Services/auth.dart';
import 'package:ticket_manager/Objects/ticket.dart';
import 'package:ticket_manager/Pages/home_page.dart';
import 'package:ticket_manager/Services/database.dart';
import 'package:ticket_manager/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';



void main() {

  group("Create Ticket Class Test", () {
    String author = "Test User";
    String title = "Test Title";
    String description = "Placeholder";
    String longDescription = "Placeholder 2";
    String state = "Open";
    // ignore: non_constant_identifier_names
    Ticket T1 = Ticket(
        author,
        title,
        description,
        longDescription,
        state
    );
    test('Test Author', () {
      expect("Test User", T1.author);
    });
    test('Test Title', () {
      expect("Test Title", T1.title);
    });
    test('Test Description', () {
      expect("Placeholder", T1.description);
    });
    test('Test Long_Description', () {
      expect("Placeholder 2", T1.longDescription);
    });
    test('Test State', () {
      expect("Open", T1.state);
    });
});


  // test('Ticket Save Test', () async {
  //   TestWidgetsFlutterBinding.ensureInitialized();
  //   String author = "Test User";
  //   String title = "Test Title";
  //   String description = "Placeholder";
  //   String longDescription = "Placeholder 2";
  //   String state = "Open";
  //   // ignore: non_constant_identifier_names
  //   Ticket T1 = Ticket(
  //       author,
  //       title,
  //       description,
  //       longDescription,
  //       state
  //   );
  //     var ticketId = saveTicket(T1);
  //     T1.setId(ticketId);
  //     var a = ticketId.toString();
  //     var b = false;
  //   DataSnapshot dS = await databaseRef.child('tickets/').child('open/').child(a).once();
  //   //check for saved value
  //   if(dS.value != null){
  //     b = true;
  //   }
  //   //expect saved value
  //   expect(true, b);
  // });

  test('Change Ticket State Test', () {
    WidgetsFlutterBinding.ensureInitialized();
    String author = "Test User";
    String title = "Test Title";
    String description = "Placeholder";
    String longDescription = "Placeholder 2";
    String state = "open";
    // ignore: non_constant_identifier_names
    Ticket T1 = Ticket(
        author,
        title,
        description,
        longDescription,
        state
    );
    T1.setId(saveTicket(T1));
    changeTicketState1(T1, "closed");
    expect(T1.state, "closed");
  });

 // group("Multi Ticket Change State Test", () {
 //   String author = "Test User";
 //   String title = "Test Title";
 //   String description = "Placeholder";
 //   String longDescription = "Placeholder 2";
 //   String state = "open";
 //   // ignore: non_constant_identifier_names
 //   Ticket T1 = Ticket(
 //       author,
 //       title,
 //       description,
 //       longDescription,
 //       state
 //   );
 //   Ticket T2 = Ticket(
 //       author,
 //       title,
 //       description,
 //       longDescription,
 //       state
 //   );
 //   Ticket T3 = Ticket(
 //       author,
 //       title,
 //       description,
 //       longDescription,
 //       state
 //   );
 //
 //   test('Test 1', () {
 //
 //     changeTicketState2(T1, "closed");
 //     expect(T1.state, "closed");
 //   });
 // });

  test('User Test', () {
    AuthService _authService = AuthService();
    expect(null,_authService.signInAnonymously());
  });

}