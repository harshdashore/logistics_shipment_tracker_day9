import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool logged = false.obs;
  login() {
    logged(true);
  }
  logout() {
    logged(false);
  }
}
