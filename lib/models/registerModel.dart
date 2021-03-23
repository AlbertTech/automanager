import 'package:automanager/models/userInfoSharedPref.dart';
import 'package:automanager/resources/myUserTags.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class RegisterModel {
  final UserInfoSharedPref userInfoSharedPref = new UserInfoSharedPref();
  final MyUserTags myUserTags = new MyUserTags();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  FirebaseAuthException firebaseAuthException;
  String loginUid = "";
  bool isLoginSuccessful = false;
  String myCurrentDatabase = "";
  Map<String, dynamic> myDatabaseList = new Map();
  String myCurrentProfileId = "";
  String myCurrentDbName = "";

  final String timedOut = "Timed_out";

  Future<bool> createWithEmailPassword(
      String completeName, String email, String password) async {
    isLoginSuccessful = false;
    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((signInCredentialValue) async {
      loginUid = signInCredentialValue.user.uid;
      await firebaseFirestore
          .collection(myUserTags.myUserAll)
          .where(myUserTags.myUserIdTag,
              isEqualTo: signInCredentialValue.user.uid)
          .limit(1)
          .get()
          .then((myUserAccount) async {
        if (myUserAccount.docs.length != null &&
            myUserAccount.docs.isNotEmpty) {
          myCurrentDatabase =
              myUserAccount.docs[0].get(myUserTags.myCurrentDatabaseId);
          myDatabaseList = myUserAccount.docs[0].get(myUserTags.myDatabaseList);
          myCurrentProfileId = myUserAccount.docs[0].id;
          myCurrentDbName =
              myUserAccount.docs[0].get(myUserTags.myUserCurrentDatabaseName);
          isLoginSuccessful = true;
          return isLoginSuccessful;
        } else {
          await firebaseFirestore.collection(myUserTags.myUserAll).add({
            myUserTags.myUserIdTag: signInCredentialValue.user.uid,
            myUserTags.myUserNameTag: completeName,
            myUserTags.myUserEmailTag: email,
            myUserTags.myUserCurrentDatabaseName: "",
            myUserTags.myCurrentDatabaseId: "",
            myUserTags.myDatabaseList: {},
          }).then((myUserAccountUserDatabase) async {
            myCurrentDatabase = "";
            myDatabaseList = {};
            myCurrentProfileId = myUserAccountUserDatabase.id;
            await myUserAccountUserDatabase.get().then((value) {
              myCurrentDbName = value.get(myUserTags.myUserCurrentDatabaseName);
            });
            isLoginSuccessful = true;
            return isLoginSuccessful;
          }).catchError((onError) {
            print("error on adding user in firestore " + onError.toString());
            isLoginSuccessful = false;
            firebaseAuthException = onError;
          });
        }
      }).catchError((onError) {
        isLoginSuccessful = false;
        firebaseAuthException = onError;
        print("error on finding user in firestore " + onError.toString());
      }).timeout((Duration(seconds: 8)), onTimeout: () {
        isLoginSuccessful = false;
        firebaseAuthException =
            FirebaseAuthException(message: "$timedOut", code: "$timedOut");
        print("you timed out");
        return isLoginSuccessful;
      });
    }).catchError((onError) {
      isLoginSuccessful = false;
      firebaseAuthException = onError;
      print("error login" + onError.toString());
    }).timeout((Duration(seconds: 8)), onTimeout: () {
      isLoginSuccessful = false;
      firebaseAuthException =
          FirebaseAuthException(message: "$timedOut", code: "$timedOut");
      print("you timed out");
    });
    return isLoginSuccessful;
  }
}
