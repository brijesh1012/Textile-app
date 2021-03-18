import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

abstract class AuthBase{


  Future<User> currentUser();
  Future<User> signInAnonymously();
  Future<void> signOut();
}
class Auth implements AuthBase{
  final _firebaseAuth = FirebaseAuth.instance;
  Stream<User> get onAuthStateChanged => _firebaseAuth.authStateChanges();


  @override
  Future<User> currentUser() async{
    final user = await _firebaseAuth.currentUser;
    return user;
  }
  @override
  Future<User> signInAnonymously() async{
    final authResult = await _firebaseAuth.signInAnonymously();
    return authResult.user;
  }
  @override
  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }



}