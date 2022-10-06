import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  var mainController = Get.put(MainController());

  MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: mainController.pageControll,
        onPageChanged: mainController.selectedPagexNumber,
        itemCount: mainController.pages.length,
        itemBuilder: (context, index) => mainController.pages[index],
      ),
      bottomNavigationBar: Obx(
        () => FloatingNavbar(
          onTap: mainController.navigateToPage,
          currentIndex: mainController.selectedPagexNumber.value,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xff0e0f49),
          selectedBackgroundColor: Colors.transparent,
          unselectedItemColor: const Color(0xffbdbdbd),
          margin: const EdgeInsets.only(bottom: 10.0, right: 10.0, left: 10.0),
          padding: const EdgeInsets.only(
              bottom: 10.0, right: 10.0, left: 10.0, top: 10.0),
          elevation: 50,
          items: [
            FloatingNavbarItem(
              icon: FeatherIcons.home,
              title: 'Accueil',
            ),
            FloatingNavbarItem(
              icon: FeatherIcons.bell,
              title: 'Notifications',
            ),
            FloatingNavbarItem(
              icon: FeatherIcons.fileText,
              title: 'Reclamation',
            ),
            FloatingNavbarItem(
              icon: FeatherIcons.user,
              title: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
