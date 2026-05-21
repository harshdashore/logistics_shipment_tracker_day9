import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static final box = GetStorage();

  static saveToken(token) {
    box.write("token", token);
  }

  static getToken() {
    return box.read("token");
  }
}
