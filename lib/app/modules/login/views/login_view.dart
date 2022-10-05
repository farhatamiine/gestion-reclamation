import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  var loginController = Get.find<LoginController>();

  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 30,
              child: Form(
                key: loginController.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Authentication",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.black,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "veuillez vous connecter pour continuer",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xff0e0f49),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 80,
                            ),
                            const Text("Username"),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller:
                                  loginController.usernameTextController,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xff0e0f49), width: 1.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xff0e0f49), width: 2.0),
                                  ),
                                  hintText: 'votre username'),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text("Mot de passe"),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              obscureText: true,
                              controller:
                                  loginController.passwordTextController,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xff0e0f49), width: 1.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xff0e0f49), width: 2.0),
                                  ),
                                  hintText: 'Saisir le mot de passe'),
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 24.0,
                                        width: 24.0,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  const Color(
                                                      0xff0e0f49) // Your color
                                              ),
                                          child: Obx(
                                            () => Checkbox(
                                              activeColor:
                                                  const Color(0xff0e0f49),
                                              value: loginController
                                                  .rememberMe.value,
                                              onChanged: (bool? selected) =>
                                                  loginController
                                                      .toggleRememberMe(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      const Text(
                                        "Se Souvenir de moi",
                                        style: TextStyle(),
                                      )
                                    ]),
                                InkWell(
                                  child: const Text(
                                    "Mot de passe oublié",
                                    style: TextStyle(
                                        color: Color(0xff0e0f49),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  onTap: () => print("Remember Me"),
                                ),
                              ],
                            ),
                          ]),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Obx(
                          () => TextButton(
                            onPressed: loginController.isLoading.value
                                ? null
                                : loginController.login,
                            child: Container(
                              width: MediaQuery.of(context).size.width - 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: loginController.isLoading.value
                                    ? const Color(0xffa6b4cc)
                                    : const Color(0xff000d51),
                              ),
                              height: 50,
                              alignment: Alignment.center,
                              child: loginController.isLoading.value
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: Color(0xff000d51),
                                      ),
                                    )
                                  : Text(
                                      "Se connecter",
                                      style: TextStyle(
                                          color: loginController.isLoading.value
                                              ? Colors.black87
                                              : Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        InkWell(
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Vous n'avez pas de compte ?",
                                    style: TextStyle(
                                        color: Color(0xff9da1a2), fontSize: 15),
                                  ),
                                  TextSpan(
                                    text: "S'inscrire",
                                    style: TextStyle(
                                        color: Color(0XFF5383ad), fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () => print("Register")),
                        const SizedBox(
                          height: 15.0,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
