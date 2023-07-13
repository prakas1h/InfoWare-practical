import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authantications {
  static singup(
      BuildContext context, String name, gender, email, city, country, phonenumber, state) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: phonenumber,
      );
      if (credential.user?.uid != null) {
        await FirebaseFirestore.instance.collection("user").doc(credential.user!.uid).set({
          "uid": credential.user!.uid,
          "firstname": name,
          "gender": gender,
          "city": city,
          "country": country,
          "state": state,
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("The password provided is too weak")));
      } else if (e.code == 'email-already-in-use') {}
    } catch (e) {}
  }
}
