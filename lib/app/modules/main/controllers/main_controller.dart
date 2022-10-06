import 'package:flutter/cupertino.dart';
import 'package:gestion_reclamation/app/modules/home/views/home_view.dart';
import 'package:gestion_reclamation/app/modules/notification/views/notification_view.dart';
import 'package:gestion_reclamation/app/modules/profile/views/profile_view.dart';
import 'package:gestion_reclamation/app/modules/reclamation/views/reclamation_view.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var selectedPagexNumber = 0.obs;
  var pageControll = PageController();
  List<Widget> pages = [
    HomeView(),
    const NotificationView(),
    const ReclamationView(),
    const ProfileView()
  ];
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void navigateToPage(int index) {
    pageControll.jumpToPage(index);
  }
}
