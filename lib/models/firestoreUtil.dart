
import 'package:automanager/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class FireStoreUtil{

  //Add Item to userId's user
/*  static void addItem(String uId, String itemName, int quantity,
      String desc, BuildContext ctx, String userId){
    Firestore.instance
        .collection("posts")
        .add(
        Models.itemWithId(uId, itemName, quantity, desc)
    )
        .catchError((onError) => print("error: " + onError.toString()))
        .whenComplete(() => Navigator.push(
        ctx, MaterialPageRoute(builder: (context) => ListItemsDisplay(userId))));
  }

  //Update Item with itemId
  static void updateItem(String itemId, String itemName, String quantity, String desc){
    Firestore.instance
        .collection("posts")
        .document(itemId)
        .updateData(
        Models.itemWithoutId(itemName, int.parse(quantity), desc)
    )
        .then((value) => print("Success"))
        .catchError((onError) => print("Error: " + onError.toString()));
  }

  //Delete Item with itemId
  static void deleteItem(String itemId){
    Firestore.instance.collection("posts").document(itemId).delete()
        .then((value) => print("Success"))
        .catchError((onError) => print("Error: " + onError.toString()));
  }*/


//Add userStore? to userId's user
/**
 * @todo FireStoreUtil methods for add/edit/delete of entities
 * @body And usage of the Map method counterpart (in Models.dart) of those entities here in FireStoreUtil.
 */
}