import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_brikId/helper/appdata.dart';
import 'package:test_brikId/helper/local_storage.dart';
import 'package:test_brikId/helper/routes.dart';
import 'package:test_brikId/helper/utility.dart';
import 'package:test_brikId/widgets/widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorage.prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'KLONTONG APP',
        theme: ThemeData(
          fontFamily: 'InterRegular',
        ),
        locale: Get.deviceLocale,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    loadingNextRoute();
    super.initState();
  }

  void loadingNextRoute() async {
    String uidUser = AppData.uuid;
    String emailUser = AppData.email;
    if (uidUser.isEmpty && emailUser.isEmpty) {
      await Future.delayed(const Duration(seconds: 3));
      Routes.routeOff(type: "login");
    } else {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          String uid = user.uid;
          if (uid == uidUser) {
            await Future.delayed(const Duration(seconds: 3));
            Routes.routeOff(type: "produk");
          } else {
            await Future.delayed(const Duration(seconds: 3));
            Routes.routeOff(type: "login");
          }
        } else {
          await Future.delayed(const Duration(seconds: 3));
          Routes.routeOff(type: "login");
        }
      } catch (e) {
        print('Error checking user UID: $e');
        await Future.delayed(const Duration(seconds: 3));
        Routes.routeOff(type: "login");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      type: "default",
      colorBackground: Utility.baseColor2,
      colorSafeArea: Utility.baseColor2,
      returnOnWillpop: false,
      content: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage('assets/bg_login.jpg'),
                  fit: BoxFit.fill),
            ),
          ),
          Column(
            children: [
              const Expanded(flex: 30, child: SizedBox()),
              Expanded(
                  flex: 40,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextLabel(
                          text: "KLONTONG APP",
                          size: Utility.large,
                          color: Utility.maincolor1,
                        ),
                        SizedBox(
                          height: Utility.small,
                        ),
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: Utility.maincolor1,
                          ),
                        )
                      ],
                    ),
                  )),
              const Expanded(flex: 30, child: SizedBox())
            ],
          )
        ],
      ),
    );
  }
}
