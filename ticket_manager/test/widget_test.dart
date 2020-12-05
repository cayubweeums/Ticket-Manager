// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:ticket_manager/Services/auth.dart';
import 'package:ticket_manager/Objects/ticket.dart';
import 'package:ticket_manager/Pages/home_page.dart';
import 'package:ticket_manager/main.dart';

import '../lib/Services/database.dart';

void main() {
  test('Create Ticket Class Test', () {
    String author = "Test User";
    String title = "Test Title";
    String description = "Placeholder";
    String longDescription = "Placeholder";
    String state = "Open";
    // ignore: non_constant_identifier_names
    Ticket T1 = Ticket(author, title, description, longDescription, state);
    expect(T1, T1);
  });

//   test("Save Ticket Test",(){
//     Under Construction
//     String author = "Test User";
//     String  title = "Test Title";
//     String description = "Placeholder";
//     String state = "Open";
//     Ticket T2 = Ticket(
//         author,
//         title,
//         description,
//         state
//     );
//     saveTicket(T2);
//     TestR = Some way of retrieving stored Tickets (json or database?)
//     expect(TestR, T2);
//   });
// }
//

  test('User Test', () {
    //Under Construction
    //String user = "Test User"; Firebase doesn't store usernames in the database when connectiong, unnecessary(?)
    AuthService _authService = AuthService();
    expect(
        null,
        _authService
            .signInAnonymously()); // Expects a null as sigining in anonymously does not return specific usernames
  });
}
