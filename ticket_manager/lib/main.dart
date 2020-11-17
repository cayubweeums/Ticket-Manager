import 'package:flutter/material.dart';
import 'package:ticket_manager/Pages/login_page.dart';
import 'Pages/add_ticket_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Widgets/misc.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot){
        //Check for errors
        if(snapshot.hasError){
          return null;
        }

        //if it completes show the app
        if(snapshot.connectionState == ConnectionState.done){
          return new MaterialApp(
            title: "Ticket Manager App",
            theme: ThemeData(
              primarySwatch: Colors.brown,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: LoginPage(),
          );
        }

        return LoadingWidget();

      }


    );
    // https://stackoverflow.com/questions/63492211/no-firebase-app-default-has-been-created-call-firebase-initializeapp-in
  }
}
