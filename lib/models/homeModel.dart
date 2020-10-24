import 'package:automanager/models/userInfoSharedPref.dart';
import 'package:automanager/resources/myDatabaseTags.dart';
import 'package:automanager/resources/myUserTags.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeModel {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final MyDatabaseTags myDatabaseTags = new MyDatabaseTags();
  final MyUserTags myUserTags = new MyUserTags();
  final UserInfoSharedPref sharedPrefUtil = new UserInfoSharedPref();

  bool isSuccessful = false;

  Future<bool> addMyOwnDatabase(String myDatabaseName,
      String myDatabasePassword, String myLoggedInUid) async {
    await firebaseFirestore.collection(myDatabaseTags.allDatabaseTag).add({
      myDatabaseTags.myDatabaseNameTag: myDatabaseName,
    }).then((afterAddingDatabaseValue) async {
      await firebaseFirestore
          .collection(myDatabaseTags.allDatabaseTag)
          .doc(afterAddingDatabaseValue.id)
          .collection(myDatabaseTags.myDatabasePersonnelTag)
          .add({myDatabaseTags.myDatabasePersonnelIdTag: myLoggedInUid}).then(
              (value) async {
        await sharedPrefUtil
            .getMyCurrentProfileId()
            .then((currentProfId) async {
          await firebaseFirestore
              .collection(myUserTags.myUserAll)
              .doc(currentProfId)
              .update({
            myUserTags.myCurrentDatabaseId: afterAddingDatabaseValue.id,
            myUserTags.myDatabaseList:
                FieldValue.arrayUnion([afterAddingDatabaseValue.id]),
            myUserTags.myUserCurrentDatabaseName: myDatabaseName,
          }).then((value) async {
            await sharedPrefUtil
                .updateCurrentDatabaseId(afterAddingDatabaseValue.id);
            await sharedPrefUtil.updateCurrentDatabaseName(myDatabaseName);
            isSuccessful = true;
          }).catchError((onError) {
            print("error on updating profile: " + onError.toString());
          });
        }).catchError((onError) {
          print("error on getting prof id: " + onError.toString());
        });
        isSuccessful = true;
      }).catchError((onError) {
        print("error on adding Personnel: " + onError.toString());
        isSuccessful = false;
      });
    }).catchError((onError) {
      print("error on adding my database: " + onError.toString());
      isSuccessful = false;
    });
    return isSuccessful;
  }
}
