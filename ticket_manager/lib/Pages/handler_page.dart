import 'package:flutter/material.dart';
import 'package:ticket_manager/Pages/home_page.dart';
import 'package:ticket_manager/Pages/menu_page.dart';

class HandlerPage extends StatelessWidget {

  final String userName;
  final dynamic user;
  HandlerPage(this.userName, this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MenuPage(userName, user),
          HomePage(userName, user)
        ],
      ),
    );
  }
}
