import 'logic.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageAccess {
  final securedStorage = new FlutterSecureStorage();

  Future<dynamic> readAllFromStorage() async {
    Map<String, String> storageValues = await securedStorage.readAll();
  }

  Future readFromStorage(String key) async {
    await securedStorage.read(key: key).then((data) {
      return data.toString();
    }).catchError((readError) {
      return readError.toString();
    });
  }

  Future writeToStorage(String key, String value) async {

  }

  Future deleteFromStorage(String key) async {
    await securedStorage.delete(key: key);
    return;
  }

  Future showWalkthrough(String key) async {
    var sharedpref = await SharedPreferences.getInstance();
    if (sharedpref.containsKey(key)) {
      var willShowWalkthrough = sharedpref.get(key);
      return willShowWalkthrough != null ? false : true;
    }
  }

}