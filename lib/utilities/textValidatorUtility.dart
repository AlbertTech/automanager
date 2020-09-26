class TextValidatorUtility {
  bool checkTextIfNotEmptyAndNotNull(String thisText) {
    if (thisText.isNotEmpty &&
        thisText != "" &&
        thisText != " " &&
        thisText != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkIfAllTextNotEmptyAndNotNull(List<String> thisText) async {
    print("count of text list: " + thisText.length.toString());
    for (int index = 0; index < thisText.length; index++) {
      if (checkTextIfNotEmptyAndNotNull(thisText.toList()[index].toString())) {
        if (index == thisText.length - 1) {
          return true;
        } else {
          continue;
        }
      } else {
        return false;
      }
    }
  }

  bool checkNumberIfNotEmptyAndNotNull(int thisText) {
    if (!thisText.isNegative &&
        !thisText.isNaN &&
        thisText > 0 &&
        thisText != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkAllNumberNotEmpty(List<int> myNumber) async {
    print("count of text list: " + myNumber.length.toString());
    for (int index = 0; index < myNumber.length; index++) {
      if (checkNumberIfNotEmptyAndNotNull(myNumber.toList()[index])) {
        if (index == myNumber.length - 1) {
          return true;
        } else {
          continue;
        }
      } else {
        return false;
      }
    }
  }
}
