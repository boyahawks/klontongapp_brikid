part of "./auth.dart";

class AuthLogin extends StatelessWidget {
  AuthController controller = Get.put(AuthController());

  final _formKey = GlobalKey<FormState>();

  AuthLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        type: "default",
        colorBackground: Utility.baseColor2,
        returnOnWillpop: false,
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
                                text: "LOGIN",
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
                            _buttonLogin(),
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
            statusCardCustom: true,
            colorCard: Utility.baseColor1,
            validator: (value) {
              return Validator.required(value, "Password can't be empty");
            },
            colorTextField: Utility.baseColor2,
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

  Widget _buttonLogin() {
    return Button1(
      colorBtn: Utility.maincolor1,
      colorSideborder: Utility.baseColor2,
      radius: 6.0,
      contentButton: Center(
          child: TextLabel(
        text: "Login",
        weigh: FontWeight.bold,
        color: Utility.baseColor1,
      )),
      onTap: () {
        if (!_formKey.currentState!.validate()) {
          hideKeyboard(Get.context!);
          return;
        } else {
          controller.validasiLogin();
        }
      },
    );
  }

  Widget _askHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TextLabel(
          text: "Don't have an account yet ?",
          weigh: FontWeight.bold,
          align: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: InkWell(
            onTap: () => Routes.routeTo(type: "regis"),
            child: const TextLabel(
              text: "Register here",
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
