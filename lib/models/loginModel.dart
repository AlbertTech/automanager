import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginModel {
  final String myCollectionName = "Users";
  final String myUserIdName = "userID";
  final String myUserEmailName = "email";
  final String myUserCompleteNameName = "Complete Name";
  final String myFacebookLoginPermission_1 = "email";


  String loginReturnValue;
  bool isLoginSuccessful;


  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  FacebookLogin facebookLogin = new FacebookLogin();

  GoogleSignIn googleSign = new GoogleSignIn();
  GoogleSignInAuthentication googleSignInAuthentication;

  Future<void> loginWithEmailPassword(String email, password) async {
    await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      loginReturnValue = value.user.uid;
      isLoginSuccessful = true;
    }).catchError((onError) {
      loginReturnValue = onError.toString();
      isLoginSuccessful = false;
      print("error login" + onError.toString());
    });
  }

  Future<void> loginWithFacebook() async {
    await facebookLogin
        .logIn([myFacebookLoginPermission_1]).then((value) async {
      await firebaseAuth
          .signInWithCredential(
              FacebookAuthProvider.credential(value.accessToken.token))
          .then((value) {
        loginReturnValue = value.user.uid;
        isLoginSuccessful = true;
      }).catchError((onError) {
        isLoginSuccessful = false;
        print("error on fbauth" + onError.toString());
      });
    }).catchError((onError) {
      isLoginSuccessful = false;
      print("error on fb login" + onError.toString());
    });
  }

  Future<void> loginWithGoogle() async {
    await googleSign.signIn().then((googleSignInValue) async {
      googleSignInAuthentication = await googleSignInValue.authentication;
      await firebaseAuth
          .signInWithCredential(GoogleAuthProvider.credential(
              idToken: googleSignInAuthentication.idToken,
              accessToken: googleSignInAuthentication.accessToken))
          .then((fireAuthSignCredentialValue) {
        loginReturnValue = fireAuthSignCredentialValue.user.uid;
        isLoginSuccessful = true;
        print("acc made");
      }).catchError((onError) {
        print("error firesignincredential error    " + onError.toString());
        isLoginSuccessful = false;
      });
    }).catchError((onError) {
      //throw dialogbox
      print("error googleSign()   " + onError.toString());
      isLoginSuccessful = false;
    });
  }

  Future<void> logOutEverything() async {
    await googleSign.signOut();
    await facebookLogin.logOut();
    await firebaseAuth.signOut();
  }
}
