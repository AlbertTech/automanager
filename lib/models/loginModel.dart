import 'package:automanager/resources/myUserTags.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginModel {
  final String myFacebookLoginPermission_1 = "email";
  String loginUid = "";
  bool isLoginSuccessful = false;
  String myCurrentDatabase = "";
  List<String> myDatabaseList = new List();
  List<dynamic> listConverter = new List();
  String myCurrentProfileId = "";
  String myCurrentDbName = "";
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final MyUserTags myUserTags = new MyUserTags();
  final FacebookLogin facebookLogin = new FacebookLogin();

  final GoogleSignIn googleSign = new GoogleSignIn();
  GoogleSignInAuthentication googleSignInAuthentication;

  Future<bool> loginWithEmailPassword(String email, password) async {
    await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((signInCredentialValue) async {
      loginUid = signInCredentialValue.user.uid;
      isLoginSuccessful = true;

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
          listConverter = myUserAccount.docs[0].get(myUserTags.myDatabaseList);
          myDatabaseList = listConverter.map((e) => e as String).toList();
          myCurrentProfileId = myUserAccount.docs[0].id;
          myCurrentDbName =
              myUserAccount.docs[0].get(myUserTags.myUserCurrentDatabaseName);
          isLoginSuccessful = true;
        } else {
          await firebaseFirestore.collection(myUserTags.myUserAll).add({
            myUserTags.myUserIdTag: signInCredentialValue.user.uid,
            myUserTags.myUserIdTag: signInCredentialValue.user.uid,
            myUserTags.myUserNameTag: signInCredentialValue.user.displayName,
            myUserTags.myUserEmailTag: signInCredentialValue.user.email,
            myUserTags.myUserCurrentDatabaseName: "",
            myUserTags.myCurrentDatabaseId: "",
            myUserTags.myDatabaseList: [],
          }).then((myUserAccountUserDatabase) async {
            myCurrentDatabase = "";
            myDatabaseList = [];
            myCurrentProfileId = myUserAccountUserDatabase.id;
            await myUserAccountUserDatabase.get().then((value) {
              myCurrentDbName = value.get(myUserTags.myUserCurrentDatabaseName);
            });
            isLoginSuccessful = true;
          }).catchError((onError) {
            print("error on adding user in firestore " + onError.toString());
            isLoginSuccessful = false;
          });
        }
      }).catchError((onError) {
        print("error on finding user in firestore " + onError.toString());
      });
    }).catchError((onError) {
      isLoginSuccessful = false;
      print("error login" + onError.toString());
    }).timeout((Duration(seconds: 7)), onTimeout: () {
      print("you timed out");
    });
    return isLoginSuccessful;
  }

  Future<bool> loginWithFacebook() async {
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
            listConverter =
                myUserAccount.docs[0].get(myUserTags.myDatabaseList);
            myDatabaseList = listConverter.map((e) => e as String).toList();
            myCurrentProfileId = myUserAccount.docs[0].id;
            myCurrentDbName =
                myUserAccount.docs[0].get(myUserTags.myUserCurrentDatabaseName);
            isLoginSuccessful = true;
          } else {
            await firebaseFirestore.collection(myUserTags.myUserAll).add({
              myUserTags.myUserIdTag: signInCredentialValue.user.uid,
              myUserTags.myUserIdTag: signInCredentialValue.user.uid,
              myUserTags.myUserNameTag: signInCredentialValue.user.displayName,
              myUserTags.myUserEmailTag: signInCredentialValue.user.email,
              myUserTags.myUserCurrentDatabaseName: "",
              myUserTags.myCurrentDatabaseId: "",
              myUserTags.myDatabaseList: [],
            }).then((myUserAccountUserDatabase) async {
              myCurrentDatabase = "";
              myDatabaseList = [];
              myCurrentProfileId = myUserAccountUserDatabase.id;
              await myUserAccountUserDatabase.get().then((value) {
                myCurrentDbName =
                    value.get(myUserTags.myUserCurrentDatabaseName);
              });
              isLoginSuccessful = true;
            }).catchError((onError) {
              print("error on adding user in firestore " + onError.toString());
              isLoginSuccessful = false;
            });
          }
        }).catchError((onError) {
          print("error on finding user in firestore " + onError.toString());
        });
      }).catchError((onError) {
        isLoginSuccessful = false;
        print("error on fbauth" + onError.toString());
      }).timeout((Duration(seconds: 10)), onTimeout: () {
        print("you timed out");
        isLoginSuccessful = false;
      });
    }).catchError((onError) {
      isLoginSuccessful = false;
      print("error on fb login " + onError.toString());
    });
    print("done model");
    return isLoginSuccessful;
  }

  Future<bool> loginWithGoogle() async {
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
            listConverter =
                myUserAccount.docs[0].get(myUserTags.myDatabaseList);
            myDatabaseList = listConverter.map((e) => e as String).toList();
            myCurrentProfileId = myUserAccount.docs[0].id;
            myCurrentDbName =
                myUserAccount.docs[0].get(myUserTags.myUserCurrentDatabaseName);
            isLoginSuccessful = true;
          } else {
            await firebaseFirestore.collection(myUserTags.myUserAll).add({
              myUserTags.myUserIdTag: signInCredentialValue.user.uid,
              myUserTags.myUserIdTag: signInCredentialValue.user.uid,
              myUserTags.myUserNameTag: signInCredentialValue.user.displayName,
              myUserTags.myUserEmailTag: signInCredentialValue.user.email,
              myUserTags.myUserCurrentDatabaseName: "",
              myUserTags.myCurrentDatabaseId: "",
              myUserTags.myDatabaseList: [],
            }).then((myUserAccountUserDatabase) async {
              myCurrentDatabase = "";
              myDatabaseList = [];
              myCurrentProfileId = myUserAccountUserDatabase.id;
              await myUserAccountUserDatabase.get().then((value) {
                myCurrentDbName =
                    value.get(myUserTags.myUserCurrentDatabaseName);
              });
              isLoginSuccessful = true;
            }).catchError((onError) {
              print("error on adding user in firestore " + onError.toString());
              isLoginSuccessful = false;
            });
          }
        }).catchError((onError) {
          print("error on finding user in firestore " + onError.toString());
        });
      }).catchError((onError) {
        print("error firesignincredential error    " + onError.toString());
        isLoginSuccessful = false;
      }).timeout((Duration(seconds: 10)), onTimeout: () {
        print("you timed out");
        isLoginSuccessful = false;
      });
    }).catchError((onError) {
      //throw dialogbox
      print("error googleSign()   " + onError.toString());
      isLoginSuccessful = false;
    });
    print("done model");
    return isLoginSuccessful;
  }

  Future<void> logOutEverything() async {
    await googleSign.signOut();
    await facebookLogin.logOut();
    await firebaseAuth.signOut();
  }
}
