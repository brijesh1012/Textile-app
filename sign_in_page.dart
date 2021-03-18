import 'package:flutter/material.dart';
import 'package:flutter_course/app/services/APIPath.dart';
import 'package:flutter_course/app/services/Auth.dart';
import 'package:flutter_course/app/services/firestore_service.dart';
import 'package:flutter_course/app/signin/raised_button/sign_in_button.dart';
import 'package:flutter_course/app/signin/raised_button/social_sign_in_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signInPage extends StatelessWidget {
  signInPage({@required this.auth});
  final AuthBase auth;
  void _signInAnonymously() async{
     await auth.signInAnonymously();
     String uid = FirebaseAuth.instance.currentUser.uid;
     List<String> a = [];
     final _service = FirestoreService.instance;
      _service.createUser(
         path: APIPath.addToFavorite(uid),
         //data: {'name' :widget.product.name,}
         data:a
     );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextileApp'),
        elevation: 10,
      ),
      body: _buildContent(),
    );
  }

  Container _buildContent() {
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign in with Google',
            color: Colors.white,
            onpressed: () {},
          ),


          SizedBox(
            height: 10,
          ),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign in with Facebook',
            color: Color(0xFF334D92),
            textcolor: Colors.white,
            onpressed: () {},
          ),
          SizedBox(
            height: 10,
          ),
          SignInButton(
            text: 'Sign in with email',
            color: Colors.teal[700],
            textcolor: Colors.white,
            onpressed: () {},
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "or",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          SignInButton(
            text: 'Go anonymous',
            color: Colors.lime[300],
            textcolor: Colors.black,
            onpressed: _signInAnonymously,
          ),

        ],
      ),
    );
  }
}
