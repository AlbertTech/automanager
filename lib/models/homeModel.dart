import 'package:automanager/models/sharedPrefUtil.dart';
import 'package:automanager/resources/myDatabaseTags.dart';
import 'package:automanager/resources/myUserTags.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeModel {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final MyDatabaseTags myDatabaseTags = new MyDatabaseTags();
  final MyUserTags myUserTags = new MyUserTags();
  final SharedPrefUtil sharedPrefUtil = new SharedPrefUtil();

  Future<void> addMyOwnDatabase(
      String myDatabaseName, String myDatabasePassword) async {
    await sharedPrefUtil.getCurrentUserId().then((myLoggedInUid) async {
      await firebaseFirestore.collection(myDatabaseTags.allDatabaseTag).add({
        myDatabaseTags.myDatabaseNameTag: myDatabaseName,
        myDatabaseTags.myDatabaseOwnerUidTag: myLoggedInUid.toString()
      }).then((afterAddingDatabaseValue) async {
        await firebaseFirestore
            .collection(myDatabaseTags.allDatabaseTag)
            .doc(afterAddingDatabaseValue.id)
            .collection(myDatabaseTags.myDatabasePersonnelTag)
            .add({
          myDatabaseTags.myDatabasePersonnelIdTag: myLoggedInUid
        }).catchError((onError) =>
                print("error on adding Personnel: " + onError.toString()));
      }).catchError((onError) =>
          print("error on adding my database: " + onError.toString()));
    }).catchError(
        (onError) => print("error on getting uid: " + onError.toString()));
  }
}
