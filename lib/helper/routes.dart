import 'package:get/get.dart';
import 'package:test_brikId/main.dart';
import 'package:test_brikId/modules/auth/auth.dart';
import 'package:test_brikId/modules/produk/produk.dart';

class Routes {
  static routeTo({required String type, dynamic data}) {
    if (type == "regis") {
      Get.to(
        AuthRegistrasi(),
        duration: const Duration(milliseconds: 300),
        transition: Transition.rightToLeftWithFade,
      );
    } else if (type == "add_product") {
      Get.to(
        AddProduk(),
        duration: const Duration(milliseconds: 300),
        transition: Transition.leftToRight,
      );
    }
  }

  static routeOff({required String type, dynamic data}) {
    if (type == "login") {
      Get.offAll(
        AuthLogin(),
        duration: const Duration(milliseconds: 300),
        transition: Transition.leftToRightWithFade,
      );
    } else if (type == "produk") {
      Get.offAll(
        const Produk(),
        duration: const Duration(milliseconds: 300),
        transition: Transition.leftToRightWithFade,
      );
    } else if (type == "splash") {
      Get.offAll(
        const SplashScreen(),
        duration: const Duration(milliseconds: 300),
        transition: Transition.leftToRightWithFade,
      );
    }
  }
}
