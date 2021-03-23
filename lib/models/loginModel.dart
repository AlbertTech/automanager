import 'package:automanager/resources/myUserTags.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginModel {
  final String myFacebookLoginPermission_1 = "email";
  FirebaseAuthException errorStatus;
  String loginUid = "";
  bool isLoginSuccessful = false;
  String myCurrentDatabase = "";
  Map<String, dynamic> myDatabaseList = new Map();
  String myCurrentProfileId = "";
  String myCurrentDbName = "";
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final MyUserTags myUserTags = new MyUserTags();
  final FacebookLogin facebookLogin = new FacebookLogin();

  final GoogleSignIn googleSign = new GoogleSignIn();
  GoogleSignInAuthentication googleSignInAuthentication;

  final String timedOut = "Timed_out";

  Future<bool> loginWithEmailPassword(String email, password) async {
    isLoginSuccessful = false;
    await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
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
            myUserTags.myUserIdTag: signInCredentialValue.user.uid,
            myUserTags.myUserNameTag: signInCredentialValue.user.displayName,
            myUserTags.myUserEmailTag: signInCredentialValue.user.email,
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
            errorStatus = onError;
            isLoginSuccessful = false;
          });
        }
      }).catchError((onError) {
        isLoginSuccessful = false;
        errorStatus = onError;
        print("error on finding user in firestore " + onError.toString());
      });
    }).catchError((onError) {
      isLoginSuccessful = false;
      errorStatus = onError;
      print("error login" + onError.toString());
    }).timeout((Duration(seconds: 7)), onTimeout: () {
      isLoginSuccessful = false;
      errorStatus = FirebaseAuthException(message: "$timedOut",code: "$timedOut");
      print("you timed out");
    });
    return isLoginSuccessful;
  }

  Future<bool> loginWithFacebook() async {
    isLoginSuccessful = false;
    await facebookLogin
        .logIn([myFacebookLoginPermission_1]).then((value) async {
      print("my fb login: " +
          value.toString() +
          "status: " +
          value.status.toString());
      await firebaseAuth
          .signInWithCredential(
          FacebookAuthProvider.credential(value.accessToken.token))
          .then((signInCredentialValue) async {
        loginUid = signInCredentialValue.user.uid;
        print("my login values: " +
            loginUid +
            " " +
            isLoginSuccessful.toString());
        await firebaseFirestore
            .collection(myUserTags.myUserAll)
            .where(myUserTags.myUserIdTag,
            isEqualTo: signInCredentialValue.user.uid)
            .limit(1)
            .get()
            .then((myUserAccount) async {
          if (myUserAccount.docs.length != null &&
              myUserAccount.docs.isNotEmpty) {
            print("account found");
            myCurrentDatabase =
                myUserAccount.docs[0].get(myUserTags.myCurrentDatabaseId);
            myDatabaseList =
                myUserAccount.docs[0].get(myUserTags.myDatabaseList);
            myCurrentProfileId = myUserAccount.docs[0].id;
            myCurrentDbName =
                myUserAccount.docs[0].get(myUserTags.myUserCurrentDatabaseName);
            isLoginSuccessful = true;
            return isLoginSuccessful;
          } else {
            print("account not found");
            await firebaseFirestore.collection(myUserTags.myUserAll).add({
              myUserTags.myUserIdTag: signInCredentialValue.user.uid,
              myUserTags.myUserIdTag: signInCredentialValue.user.uid,
              myUserTags.myUserNameTag: signInCredentialValue.user.displayName,
              myUserTags.myUserEmailTag: signInCredentialValue.user.email,
              myUserTags.myUserCurrentDatabaseName: "",
              myUserTags.myCurrentDatabaseId: "",
              myUserTags.myDatabaseList: {},
            }).then((myUserAccountUserDatabase) async {
              myCurrentDatabase = "";
              myDatabaseList = {};
              myCurrentProfileId = myUserAccountUserDatabase.id;
              await myUserAccountUserDatabase.get().then((value) {
                myCurrentDbName =
                    value.get(myUserTags.myUserCurrentDatabaseName);
              });
              isLoginSuccessful = true;
              return isLoginSuccessful;
            }).catchError((onError) {
              print("error on adding user in firestore " + onError.toString());
              errorStatus = onError;
              isLoginSuccessful = false;
            });
          }
        }).catchError((onError) {
          print("error on finding user in firestore " + onError.toString());
          errorStatus = onError;
          isLoginSuccessful = false;
        });
      }).catchError((onError) {
        errorStatus = onError;
        isLoginSuccessful = false;
        print("error on fbauth" + onError.toString());
      }).timeout((Duration(seconds: 7)), onTimeout: () {
        errorStatus = FirebaseAuthException(message: "$timedOut",code: "$timedOut");
        print("you timed out");
        isLoginSuccessful = false;
      });
    }).catchError((onError) {
      isLoginSuccessful = false;
      errorStatus = onError;
      print("error on fb login " + onError.toString());
    });
    print("done model");
    return isLoginSuccessful;
  }

  Future<bool> loginWithGoogle() async {
    isLoginSuccessful = false;
    try {
      await googleSign.signIn().then((googleSignInValue) async {
        print("my fb login: " + googleSignInValue.toString());
        googleSignInAuthentication = await googleSignInValue.authentication;
        await firebaseAuth
            .signInWithCredential(GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken))
            .then((signInCredentialValue) async {
          loginUid = signInCredentialValue.user.uid;
          isLoginSuccessful = true;
          print("my login values: " +
              loginUid +
              " " +
              isLoginSuccessful.toString());
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
              myDatabaseList =
                  myUserAccount.docs[0].get(myUserTags.myDatabaseList);
              myCurrentProfileId = myUserAccount.docs[0].id;
              myCurrentDbName =
                  myUserAccount.docs[0].get(
                      myUserTags.myUserCurrentDatabaseName);
              isLoginSuccessful = true;
              return isLoginSuccessful;
            } else {
              await firebaseFirestore.collection(myUserTags.myUserAll).add({
                myUserTags.myUserIdTag: signInCredentialValue.user.uid,
                myUserTags.myUserIdTag: signInCredentialValue.user.uid,
                myUserTags.myUserNameTag: signInCredentialValue.user
                    .displayName,
                myUserTags.myUserEmailTag: signInCredentialValue.user.email,
                myUserTags.myUserCurrentDatabaseName: "",
                myUserTags.myCurrentDatabaseId: "",
                myUserTags.myDatabaseList: {},
              }).then((myUserAccountUserDatabase) async {
                myCurrentDatabase = "";
                myDatabaseList = {};
                myCurrentProfileId = myUserAccountUserDatabase.id;
                await myUserAccountUserDatabase.get().then((value) {
                  myCurrentDbName =
                      value.get(myUserTags.myUserCurrentDatabaseName);
                });
                isLoginSuccessful = true;
                return isLoginSuccessful;
              }).catchError((onError) {
                print(
                    "error on adding user in firestore " + onError.toString());
                errorStatus = onError;
                isLoginSuccessful = false;
              });
            }
          }).catchError((onError) {
            print("error on finding user in firestore " + onError.toString());
            errorStatus = onError;
            isLoginSuccessful = false;
          });
        }).catchError((onError) {
          print("error firesignincredential error    " + onError.toString());
          errorStatus = onError;
          isLoginSuccessful = false;
        }).timeout((Duration(seconds: 7)), onTimeout: () {
          print("you timed out");
          errorStatus = FirebaseAuthException(message: "$timedOut",code: "$timedOut");
          isLoginSuccessful = false;
        });
      }).catchError((onError) {
        errorStatus = onError;
        print("error googleSign()   " + onError.toString());
        isLoginSuccessful = false;

      });
      print("done model");
      return isLoginSuccessful;
    }
    catch(e){

    }
  }

  Future<void> logOutEverything() async {
    await googleSign.signOut();
    await facebookLogin.logOut();
    await firebaseAuth.signOut();
  }
}
