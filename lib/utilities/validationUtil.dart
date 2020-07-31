import 'file:///D:/Programming/Flutter_Projects/automanager/lib/utilities/MessagesEN.dart';

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

  static bool isValidPasswordLength(String password){
    if(password.toString().length >= 6){
      return true;
    }else{
      return false;
    }
  }

  static bool isValidEmailFormat(String str){
    return RegExp(r"[a-z0-9!#\$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#\$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?").hasMatch(str);
  }

  static String validateEmail(String email){
    if(!isNotEmpty(email)){
      return MessagesEN.emailLabel + " " + MessagesEN.fieldCantBeEmpty;
    }
    if(!isValidEmailFormat(email)){
      return MessagesEN.invalidEmailFormat;
    }
    return "";
  }

  static String validatePasswordRegister(String password, confirmPassword){
    if(!isNotEmpty(password) ){
      return MessagesEN.passwordLabel + " " + MessagesEN.fieldCantBeEmpty;
    }

    if(!isValidPasswordLength(password)){
      return MessagesEN.passwordLengthError;
    }

    if(!isNotEmpty(confirmPassword) ){
      return MessagesEN.confirmPasswordLabel + " " + MessagesEN.fieldCantBeEmpty;
    }

    if(password!=confirmPassword){
      return MessagesEN.confirmPasswordDontMatch;
    }
    return "";
  }

}