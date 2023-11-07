import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

String generateNonce([int length = 32]) {
  const charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  final random = Random.secure();
  return List.generate(length, (_) => charset[random.nextInt(charset.length)])
      .join();
}

String sha256ofString(String input) {
  final bytes = utf8.encode(input);
  final digest = sha256.convert(bytes);
  return digest.toString();
}

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  UserRepository({FirebaseAuth? firebaseAuth, GoogleSignIn? googleSignin})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ??
            GoogleSignIn(scopes: <String>[
              'email',
              'profile'
            ]); // https://stackoverflow.com/questions/64079246/how-to-get-additional-scopes-from-googlesignin-in-flutter

  User? currentSignedinUser() {
    return _firebaseAuth.currentUser;
  }

  Future<User?> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await _firebaseAuth.signInWithCredential(credential);
        if (_firebaseAuth.currentUser != null) {
          return _firebaseAuth.currentUser!;
        }
        throw Exception('_firebaseAuth.currentUser is null');
      } else {
        throw Exception('User decided not to login');
      }
    } catch (t) {
      throw Exception('Exception during google sign in $t');
    }
  }

  Future<User?> signInWithApple() async {
    if (kIsWeb) {
      return signInWithAppleOnWeb();
    } else {
      if (Platform.isIOS) {
        return signInWithAppleOnApple();
      } else {
        return signInWithProvider();
      }
    }
  }

  Future<User> signInWithAppleOnApple() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    final oauthCredential = OAuthProvider('apple.com').credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(oauthCredential);

    if (userCredential.user?.displayName == null ||
        (userCredential.user?.displayName != null &&
            userCredential.user!.displayName!.isEmpty)) {
      final fixDisplayNameFromApple = [
        appleCredential.givenName ?? '',
        appleCredential.familyName ?? '',
      ].join(' ').trim();
      await userCredential.user?.updateDisplayName(fixDisplayNameFromApple);
    }
    if (userCredential.user?.email == null ||
        (userCredential.user?.email != null &&
            userCredential.user!.email!.isEmpty)) {
      await userCredential.user?.updateEmail(appleCredential.email ?? '');
    }

    if (_firebaseAuth.currentUser != null) return _firebaseAuth.currentUser!;
    throw Exception('_firebaseAuth.currentUser is null');
  }

  Future<User> signInWithProvider() async {
    AppleAuthProvider appleProvider = AppleAuthProvider();
    appleProvider.addScope('email');
    appleProvider.addScope('name');
    final credential =
        await FirebaseAuth.instance.signInWithProvider(appleProvider);
    if (credential.user != null) return credential.user!;
    throw Exception('credential.currentUser is null');
  }

  Future<User> signInWithAppleOnWeb() async {
    final provider = OAuthProvider('apple.com')
      ..addScope('email')
      ..addScope('name');

    await FirebaseAuth.instance.signInWithPopup(provider);
    if (_firebaseAuth.currentUser != null) return _firebaseAuth.currentUser!;
    throw Exception('_firebaseAuth.currentUser is null');
  }

  Future<List<void>> signOut() async {
    return Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
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
