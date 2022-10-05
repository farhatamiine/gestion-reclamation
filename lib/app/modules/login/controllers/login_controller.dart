import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:gestion_reclamation/app/service/network_handler.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final count = 0.obs;
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  RxBool rememberMe = false.obs;
  RxBool isLoading = false.obs;
  NetworkHandler networkHandler = NetworkHandler();
  final loginStorage = GetStorage();
  var formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  void toggleRememberMe() {
    rememberMe.value = !(rememberMe.value);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void login() async {
    try {
      isLoading.value = true;
      var response = await networkHandler.post("authenticate", {
        "username": usernameTextController.text,
        "password": passwordTextController.text,
      });

      if (response.data["id_token"] != null) {
        loginStorage.write("id_token", response.data["id_token"]);
        Get.offAllNamed("/home");
      }
    } on DioError catch (e) {
      Get.snackbar("Error", e.response?.data["title"],
          snackPosition: SnackPosition.TOP,
          barBlur: 2.5,
          backgroundGradient: const LinearGradient(
            colors: [Color(0xfff32e20), Color(0xff951208)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ));
    } finally {
      isLoading.value = false;
    }
  }
}
