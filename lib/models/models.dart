class Models {

  static Map<String, dynamic> itemWithId(String uId, String itemName, int quantity,
      String desc) {
    return {
      'uID': uId,
      'title': itemName,
      'quantity': quantity,
      'description': desc
    };
  }

  static Map<String, dynamic> itemWithoutId(String itemName, int quantity,
      String desc) {
    return {
      'title': itemName,
      'quantity': quantity,
      'description': desc
    };
  }

  /**
   * @todo Add Collection and Document for other entities
   * @body Create more Map objects in Models.dart for each entity and add Collection and Document for those entities such as the User's Store.
   */
  static Map<String, dynamic> userStore(String uId, String storeName, String desc) {
    return {
      'uID': uId,
      'storeName': storeName,
      'description': desc
    };
  }
}