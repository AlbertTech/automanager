import 'package:automanager/models/userInfoSharedPref.dart';
import 'file:///D:/Programming/Flutter_Projects/automanager/lib/utilities/myClippers.dart';
import 'package:automanager/resources/myColors.dart';
import 'package:automanager/utilities/errorTrapTool.dart';
import 'package:automanager/utilities/myNavigatorUtil.dart';
import 'package:automanager/utilities/textFieldFocusUtilities.dart';
import 'package:automanager/view/loginUI.dart';
import 'package:automanager/view_models/loginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await UserInfoSharedPref().clearValue();
  await Firebase.initializeApp();
  await LoginViewModel().fireAuthLogOut();
  runApp(LoginView());
}

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  UserInfoSharedPref sharedPrefUtil;
  TextFieldFocusUtilities myTextUtility;
  MyColors myColors;
  MyClippers myClippers;
  LoginViewModel loginViewModel;
  TextEditingController txtEmail;
  TextEditingController txtPass;
  MyNavigatorUtil myNavigatorUtil;
  ErrorTrapTool errorTrapTool;

  @override
  void initState() {
    sharedPrefUtil = new UserInfoSharedPref();
    myTextUtility = new TextFieldFocusUtilities();
    myColors = new MyColors();
    myClippers = new MyClippers("LoginView");
    loginViewModel = new LoginViewModel();
    txtEmail = new TextEditingController();
    txtPass = new TextEditingController();
    myNavigatorUtil = new MyNavigatorUtil();
    errorTrapTool = new ErrorTrapTool();
    super.initState();
  }

  @override
  void dispose() {
    txtEmail.dispose();
    txtPass.dispose();
    loginViewModel.fireAuthLogOut();
    print("hello dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: (ThemeData(brightness: Brightness.light)),
        builder: EasyLoading.init(),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: LoginUI(
                  sharedPrefUtil,
                  loginViewModel,
                  myTextUtility,
                  myNavigatorUtil,
                  myClippers,
                  myColors.colorLightBlue,
                  myColors.colorLightOrange,
                  myColors.colorDeepOrange,
                  txtEmail,
                  txtPass,
                  errorTrapTool)
              .getLoginUIWidget(),
        ));
  }
}
