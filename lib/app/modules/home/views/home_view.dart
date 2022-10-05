import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:gestion_reclamation/app/Widget/reclamation_card.dart';
import 'package:gestion_reclamation/app/Widget/sheet_item.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  var homeController = Get.put(HomeController());
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          backgroundColor: Colors.white,
          body: homeController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xff000d51),
                  ),
                )
              : Container(
                  color: Colors.white24,
                  height: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 9.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(homeController
                                            .user.value.imageUrl ??
                                        'https://res.cloudinary.com/storebuilder/image/upload/v1664988399/placeholder_ybymnd.png'),
                                    radius: 30.0,
                                    backgroundColor: Colors.transparent,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Obx(
                                        () => Text(
                                          "Bonjour ${homeController.user.value.firstName} ${homeController.user.value.lastName}",
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black,
                                            fontFamily: 'OpenSans',
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        "Lorem ipsum dolor sit amet",
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Color(0xff0e0f49),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () => {print("Clicked")},
                                  icon: const Icon(
                                    FeatherIcons.bell,
                                    color: Color(0xff000d51),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 8),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 0),
                            decoration: BoxDecoration(
                                color: const Color(0xffe3e5f2),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: const Text(
                              "Suivre mes reclamations",
                              style: TextStyle(
                                  color: Color(0xff0e0f49),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            height: MediaQuery.of(context).size.height * 0.55,
                            child: ListView(
                              children: const [
                                ReclamationCard(),
                                ReclamationCard(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () => Get.bottomSheet(
                            backgroundColor: Colors.transparent,
                            Container(
                              height: MediaQuery.of(context).size.height * 0.79,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25.0),
                                  topRight: Radius.circular(25.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 15, right: 15),
                                child: Column(
                                  children: [
                                    const Text(
                                      "Nouvelle Reclamation",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                      child: GridView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 10,
                                        ),
                                        itemCount: homeController
                                            .reclamationItem.length,
                                        itemBuilder: (context, index) {
                                          return SheetItem(
                                            color: homeController
                                                .reclamationItem[index].color,
                                            icon: homeController
                                                .reclamationItem[index].icon,
                                            sheetItem: homeController
                                                .reclamationItem[index].title
                                                .split(" ")
                                                .join("\n"),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            isScrollControlled: true,
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xff000d51),
                            ),
                            height: 50,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  FeatherIcons.plusCircle,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Nouvelle Reclamation",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
