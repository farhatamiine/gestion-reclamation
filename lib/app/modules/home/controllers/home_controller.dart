import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestion_reclamation/app/models/reclamation.dart';
import 'package:gestion_reclamation/app/modules/home/user_model.dart';
import 'package:gestion_reclamation/app/modules/login/views/login_view.dart';
import 'package:gestion_reclamation/app/service/network_handler.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  final storage = GetStorage();
  Rx<User> user = User().obs;
  NetworkHandler networkHandler = NetworkHandler();
  RxBool isLoading = false.obs;
  List<Reclamation> reclamationItem = [
    Reclamation("Eau potable", FontAwesomeIcons.droplet, Colors.blue.shade800),
    Reclamation("Dechets solide", FontAwesomeIcons.trash, Colors.cyan.shade300),
    Reclamation("Assainissement liquide", FontAwesomeIcons.water,
        Colors.purple.shade800),
    Reclamation(
        "Eclerage public", FontAwesomeIcons.sun, Colors.orange.shade800),
    Reclamation(
        "Espace vert", FontAwesomeIcons.pagelines, Colors.green.shade800),
    Reclamation(
        "Divers", FontAwesomeIcons.arrowRightToCity, Colors.red.shade800),
    Reclamation("Ascenseur", FontAwesomeIcons.doorOpen, Colors.black),
    Reclamation("Securite", FontAwesomeIcons.shield, Colors.red.shade300),
    Reclamation(
        "Parking", FontAwesomeIcons.squareParking, Colors.blue.shade600),
  ].obs;
  @override
  void onInit() {
    super.onInit();
    String token = storage.read("id_token");
    if (token != null) {
      authenticatedUser(token);
    } else {
      Get.off(() => LoginView());
    }
  }

  void authenticatedUser(String token) async {
    try {
      isLoading.value = true;
      var userReponse = await networkHandler.get("account", token);
      user.value = User.fromJson(userReponse.data);
    } on DioError catch (e) {
      isLoading.value = false;
      Get.snackbar(
        e.response?.data["title"],
        e.response?.data["message"],
      );
    } finally {
      update();
      isLoading.value = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
