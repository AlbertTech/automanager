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

  String myDatabaseId = "";
  String myDatabaseName = "";

  Future<bool> createDatabase(
      String myDatabaseName,
      String myDatabasePassword,
      String myLoggedInUid,
      String currentProfId) async {
    isSuccessful = false;
    await firebaseFirestore.collection(myDatabaseTags.allDatabaseTag).add({
      myDatabaseTags.myDatabaseNameTag: myDatabaseName,
      myDatabaseTags.myInventoryCategoriesTag:[],
    }).then((afterAddingDatabaseValue) async {
      await firebaseFirestore
          .collection(myDatabaseTags.allDatabaseTag)
          .doc(afterAddingDatabaseValue.id)
          .collection(myDatabaseTags.myDatabasePersonnelTag)
          .add({myDatabaseTags.myDatabasePersonnelIdTag: myLoggedInUid}).then(
              (value) async {
        await firebaseFirestore
            .collection(myUserTags.myUserAll)
            .doc(currentProfId)
            .update({
          myUserTags.myCurrentDatabaseId: afterAddingDatabaseValue.id,
          myUserTags.myUserCurrentDatabaseName: myDatabaseName,
          "" + myUserTags.myDatabaseList + "." + myDatabaseName + "":
              afterAddingDatabaseValue.id,
        }).then((value) async {
          myDatabaseId = afterAddingDatabaseValue.id;
          this.myDatabaseName = myDatabaseName;
          isSuccessful = true;
          return isSuccessful;
        }).catchError((onError) {
          isSuccessful = false;
          print("error on getting prof id: " + onError.toString());
        });
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

  Future<bool> joinAnotherDatabase(
      String databaseID, String currentProfileId) async {
    isSuccessful = false;
    await firebaseFirestore
        .collection(myDatabaseTags.allDatabaseTag)
        .doc(databaseID)
        .get()
        .then((myDatabase) async {
      if (myDatabase.exists) {
        await firebaseFirestore
            .collection(myUserTags.myUserAll)
            .doc(currentProfileId)
            .update({
          myUserTags.myCurrentDatabaseId: myDatabase.id,
          myUserTags.myUserCurrentDatabaseName:
              myDatabase.get(myDatabaseTags.myDatabaseNameTag),
          "" +
              myUserTags.myDatabaseList +
              "." +
              myDatabase.get("Database_name") +
              "": myDatabase.id,
        }).then((value) {
          isSuccessful = true;
          myDatabaseId = databaseID;
          myDatabaseName = myDatabase.get(myDatabaseTags.myDatabaseNameTag);
          print("found one database");
          print("database id: " +
              databaseID +
              " database name: " +
              myDatabase.get("Database_name"));
        }).catchError((onError) {
          isSuccessful = true;
          print("error on updating my current database: " + onError.toString());
        });
      } else if (!myDatabase.exists) {
        isSuccessful = false;
        print("found none database");
        print("database id: " +
            databaseID +
            " database name: " +
            myDatabase.exists.toString());
      } else {
        isSuccessful = false;
        print("found none database");
        print("database id: " +
            databaseID +
            " database name: " +
            myDatabase.exists.toString());
      }
    }).catchError((onError) {
      isSuccessful = false;
      print("found none database");
    });
    return isSuccessful;
  }
}
