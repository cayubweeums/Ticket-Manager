import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //Anonymous Sign In

  Future signInAnonymously() async {
    try{
      dynamic results = await _auth.signInAnonymously();
      FirebaseUser user = results.user;
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }

  }



}


