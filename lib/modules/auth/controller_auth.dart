part of "./auth.dart";

class AuthController extends GetxController {
  var email = TextEditingController().obs;
  var password = TextEditingController().obs;
  var passwordConfirm = TextEditingController().obs;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  RxBool showPassword = false.obs;
  RxBool showPasswordConfirm = false.obs;

  Future<void> validasiRegistrasi() async {
    if (password.value.text != passwordConfirm.value.text) {
      UtilsAlert.showToast("Invalid Confirm Password");
    } else {
      if (password.value.text.length < 6) {
        UtilsAlert.showToast("Password must be more than 6 characters");
      } else {
        UtilsAlert.loadingSimpanData(context: Get.context!, text: "Loading...");
        try {
          var userCredential = _firebaseAuth
            ..createUserWithEmailAndPassword(
                email: email.value.text, password: password.value.text);
          var uuidUser = userCredential.currentUser!.uid;
          var emailUser = userCredential.currentUser!.email;
          if (uuidUser != "" && emailUser != "") {
            Get.back();
            Get.back();
            UtilsAlert.showToast("Akun berhasil registrasi");
            email.value.text = "";
            password.value.text = "";
            passwordConfirm.value.text = "";
          }
        } catch (e) {
          Get.back();
          UtilsAlert.showToast(e);
          print("error regis $e");
        }
      }
    }
  }

  Future<void> validasiLogin() async {
    // String secureRandom = Utility.generateSecureRandom(32);
    // print("hasil secure $secureRandom");
    UtilsAlert.loadingSimpanData(
        context: Get.context!, text: "Loading", dismiss: true);
    try {
      var credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email.value.text, password: password.value.text);
      var uuid = credential.user!.uid;
      if (uuid != "") {
        AppData.email = email.value.text;
        AppData.uuid = uuid;
        Get.back();
        UtilsAlert.showToast("Account login successfully");
        Routes.routeOff(type: "produk");
        email.value.text = "";
        password.value.text = "";
      }
    } catch (e) {
      UtilsAlert.showToast("Kombinasi Email dan Password salah !");
      Get.back();
    }
  }
}
