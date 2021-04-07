import 'dart:async';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliud_router;

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  UserRepository({FirebaseAuth? firebaseAuth, GoogleSignIn? googleSignin})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ?? GoogleSignIn();

  User? currentSignedinUser() {
    return _firebaseAuth.currentUser;
  }

  Future<User?> signInWithGoogle(NavigatorBloc? navigatorBloc) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser
            .authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await _firebaseAuth.signInWithCredential(credential);
        return _firebaseAuth.currentUser;
      }
    } catch (exception) {
      if (navigatorBloc != null) {
        eliud_router.Router.message(
            navigatorBloc, "error whilst signin " + exception.toString());
      }
      print("Error whilst signing in " + exception.toString());
    }

    return null;
  }

  Future<List<void>> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut()
    ]);
  }

  bool isSignedIn() {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  String? getUser() {
    return _firebaseAuth.currentUser!.email;
  }

  String? profilePhoto() {
    return _firebaseAuth.currentUser!.photoURL;
  }
}
