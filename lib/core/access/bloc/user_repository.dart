import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliud_router;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  UserRepository({FirebaseAuth? firebaseAuth, GoogleSignIn? googleSignin})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ?? GoogleSignIn();

  User? currentSignedinUser() {
    return _firebaseAuth.currentUser;
  }

  Future<void> uploadExample() async {
    File file = await _localFile;

    var customMetaData = {
      'privilegeRequired': '2'
    };
    await FirebaseStorage.instance
        .ref('MINKEY_APP/upgrade2.txt')
        .putFile(file, SettableMetadata(
    customMetadata: customMetaData));
  }

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
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
        //await uploadExample();

        var fileName = '/MINKEY_APP/upgrade2.txt';
        var storageRef = FirebaseStorage.instance.ref().child(fileName);
        var x = await storageRef.getData();

        var localFile = await _localFile;
        await localFile.writeAsBytes(x!);

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
