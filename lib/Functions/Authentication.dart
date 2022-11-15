
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../Widgets/snackbar.dart';


class user{
  String email= "";
  String uid= "";
  user(String email,String uid){
    this.email=email;
    this.uid=uid;
  }




}

class Authentication {
  Stream<User?> authState() {
    return FirebaseAuth.instance.authStateChanges();
  }

  user userData(){
    String? e =FirebaseAuth.instance.currentUser?.email;
    String? u =FirebaseAuth.instance.currentUser?.uid;
    user U = user( e==null?"":e, u==null?"":u);
    return U;
  }

  void signIn(String email, String password,BuildContext context) async {
    print("called");
    print(email);
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(snackbar().snackBarSucess("Signed In"));
    } on FirebaseAuthException catch (e) {
      String msg = e.message!;
      if(msg!=null)
        ScaffoldMessenger.of(context).showSnackBar(snackbar().snackBarFail(msg));

      else{
        ScaffoldMessenger.of(context).showSnackBar(snackbar().snackBarFail("Error"));

      }
    } catch (e) {
      print(e);
    }
  }


  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      ScaffoldMessenger.of(context).showSnackBar(snackbar().snackBarSucess("Signed Out"));
    } on FirebaseAuthException catch (e) {

      String msg = e.message!;
      if(msg!=null)
        ScaffoldMessenger.of(context).showSnackBar(snackbar().snackBarFail(msg));

      else{
        ScaffoldMessenger.of(context).showSnackBar(snackbar().snackBarFail("Error"));

      }
    } catch (e) {
      print(e);
    }
  }
}
