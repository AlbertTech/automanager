import 'package:automanager/resources/MessagesEN.dart';

class ValidationUtil{
  static bool isNotEmpty(String str){
    if(str != null &&
        str.isNotEmpty &&
        str != "" &&
        str != " "){
      return true;
    }
    else{
      return false;
    }
  }

  static bool isValidEmailFormat(String str){
    return RegExp(r"[a-z0-9!#\$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#\$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?").hasMatch(str);
  }

  static String validateEmail(String email){
    if(!isNotEmpty(email)){
      return MessagesEN.fieldCantBeEmpty;
    }
    if(!isValidEmailFormat(email)){
      return MessagesEN.invalidEmailFormat;
    }
    return "";
  }

}