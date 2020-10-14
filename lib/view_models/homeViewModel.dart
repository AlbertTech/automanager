import 'package:automanager/models/homeModel.dart';

class HomeViewModel {
  final HomeModel homeModel = new HomeModel();

  Future<void> createMyOwnDatabase(
      String myDatabaseName, String myDatabasePassword) async {
    await homeModel.addMyOwnDatabase(myDatabaseName, myDatabasePassword);
  }
}
