part of "./auth.dart";

class AuthRegistrasi extends StatelessWidget {
  AuthController controller = Get.find();

  final _formKey = GlobalKey<FormState>();

  AuthRegistrasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        type: "default",
        colorBackground: Utility.baseColor2,
        returnOnWillpop: true,
        backFunction: () => Get.back(),
        colorSafeArea: Utility.baseColor2,
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
                SizedBox(
                  height: Utility.extraLarge +
                      Utility.extraLarge +
                      Utility.extraLarge,
                ),
                Flexible(
                    child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: Utility.large, right: Utility.large),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: TextLabel(
                                text: "REGISTRASI",
                                size: Utility.medium,
                                weigh: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: Utility.medium,
                            ),
                            _formEmail(),
                            SizedBox(
                              height: Utility.medium,
                            ),
                            _formPassword(),
                            SizedBox(
                              height: Utility.medium,
                            ),
                            _formPasswordConfirm(),
                            SizedBox(
                              height: Utility.medium,
                            ),
                            _buttonRegistrasi(),
                            SizedBox(
                              height: Utility.medium,
                            ),
                            _askHaveAccount(),
                            SizedBox(
                              height: Utility.medium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
              ],
            )
          ],
        ));
  }

  Widget _formEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextLabel(text: "Email"),
        SizedBox(
          height: Utility.normal,
        ),
        TextFieldMain(
          controller: controller.email.value,
          colorTextField: Utility.baseColor2,
          validator: (value) {
            return Validator.required(value, "Email tidak boleh kosong");
          },
        ),
      ],
    );
  }

  Widget _formPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextLabel(text: "Password"),
        SizedBox(
          height: Utility.normal,
        ),
        Obx(
          () => TextFieldPassword(
            controller: controller.password.value,
            colorTextField: Utility.baseColor2,
            statusCardCustom: true,
            colorCard: Utility.baseColor1,
            validator: (value) {
              return Validator.required(value, "Password can't be empty");
            },
            obscureController: controller.showPassword.value,
            onTap: () {
              controller.showPassword.value = !controller.showPassword.value;
              controller.showPassword.refresh();
            },
          ),
        ),
      ],
    );
  }

  Widget _formPasswordConfirm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextLabel(text: "Confirm Password"),
        SizedBox(
          height: Utility.normal,
        ),
        Obx(
          () => TextFieldPassword(
            controller: controller.passwordConfirm.value,
            colorTextField: Utility.baseColor2,
            statusCardCustom: true,
            colorCard: Utility.baseColor1,
            validator: (value) {
              return Validator.required(value, "Password can't be empty");
            },
            obscureController: controller.showPasswordConfirm.value,
            onTap: () {
              controller.showPasswordConfirm.value =
                  !controller.showPasswordConfirm.value;
              controller.showPasswordConfirm.refresh();
            },
          ),
        ),
      ],
    );
  }

  Widget _buttonRegistrasi() {
    return Button1(
      colorBtn: Utility.maincolor1,
      colorSideborder: Utility.baseColor2,
      radius: 6.0,
      contentButton: Center(
          child: TextLabel(
        text: "Registrasi",
        weigh: FontWeight.bold,
        color: Utility.baseColor1,
      )),
      onTap: () {
        if (!_formKey.currentState!.validate()) {
          hideKeyboard(Get.context!);
          return;
        } else {
          controller.validasiRegistrasi();
        }
      },
    );
  }

  Widget _askHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TextLabel(
          text: "Do you have an account ?",
          weigh: FontWeight.bold,
          align: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: InkWell(
            onTap: () {
              controller.email.value.text = "";
              controller.password.value.text = "";
              controller.passwordConfirm.value.text = "";
              Get.back();
            },
            child: const TextLabel(
              text: "Login here",
              decoration: TextDecoration.underline,
              weigh: FontWeight.bold,
              align: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
