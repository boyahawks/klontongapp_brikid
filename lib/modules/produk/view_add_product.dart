part of './produk.dart';

class AddProduk extends StatelessWidget {
  AddProduk({Key? key}) : super(key: key);

  ProdukController controller = Get.find();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MainScaffold(
          type: "default",
          colorBackground: Utility.baseColor2,
          returnOnWillpop: true,
          backFunction: () => ButtonSheetWidget().validasiButtomSheet(
              "Exit the form",
              const TextLabel(text: "Are you sure you're leaving the form?"),
              "Exit",
              () => Get.back()),
          colorSafeArea: Utility.baseColor2,
          content: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding:
                  EdgeInsets.only(left: Utility.medium, right: Utility.medium),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Utility.extraLarge,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TextLabel(
                        text: "Add Product",
                        size: Utility.extraLarge,
                        color: Utility.baseColor1,
                      ),
                    ),
                    SizedBox(
                      height: Utility.extraLarge,
                    ),
                    _screenCategory(),
                    SizedBox(
                      height: Utility.medium,
                    ),
                    _screenSku(),
                    SizedBox(
                      height: Utility.medium,
                    ),
                    _screenName(),
                    SizedBox(
                      height: Utility.medium,
                    ),
                    _screenDeskripsi(),
                    SizedBox(
                      height: Utility.medium,
                    ),
                    _screenPrice(),
                    SizedBox(
                      height: Utility.large + Utility.large,
                    ),
                    Button1(
                        colorBtn: Utility.maincolor1,
                        contentButton: Align(
                          alignment: Alignment.center,
                          child: TextLabel(
                            text: "Save",
                            color: Utility.baseColor1,
                          ),
                        ),
                        onTap: () {
                          if (!_formKey.currentState!.validate()) {
                            hideKeyboard(Get.context!);
                            return;
                          } else {
                            controller.saveProduct();
                          }
                        })
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget _screenCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextLabel(
          text: "Category",
          color: Utility.baseColor1,
        ),
        SizedBox(
          height: Utility.normal,
        ),
        TextFieldMain(
          controller: TextEditingController(
              text: controller.nameCategorySelected.value),
          readOnly: true,
          validator: (value) {
            return Validator.required(value, "Category can't be empty");
          },
          onTap: () {
            ButtonSheetWidget().viewButtonSheet("Select Category",
                _widgetSelectCategory(), "hidden", "", true, () {});
          },
        ),
      ],
    );
  }

  Widget _widgetSelectCategory() {
    return ListView.builder(
        itemCount: controller.listCategory.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          int idCategory = controller.listCategory[index].id;
          String nameCategory = controller.listCategory[index].categoryName;
          return InkWell(
            onTap: () {
              controller.idCategorySelected.value = idCategory;
              controller.idCategorySelected.refresh();
              controller.nameCategorySelected.value = nameCategory;
              controller.nameCategorySelected.refresh();
              Get.back();
            },
            child: Padding(
              padding:
                  EdgeInsets.only(top: Utility.small, bottom: Utility.small),
              child: CardCustomShadow(
                radiusBorder: Utility.borderStyle1,
                colorBg: Colors.white,
                widgetCardCustom: Padding(
                  padding: EdgeInsets.only(
                      top: Utility.medium,
                      bottom: Utility.medium,
                      left: Utility.small),
                  child: TextLabel(
                    text: nameCategory,
                    weigh: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget _screenSku() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextLabel(
          text: "SKU",
          color: Utility.baseColor1,
        ),
        SizedBox(
          height: Utility.normal,
        ),
        TextFieldMain(
          controller: controller.sku.value,
          validator: (value) {
            return Validator.required(value, "SKU can't be empty");
          },
        ),
      ],
    );
  }

  Widget _screenName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextLabel(
          text: "Product Name",
          color: Utility.baseColor1,
        ),
        SizedBox(
          height: Utility.normal,
        ),
        TextFieldMain(
          controller: controller.nameProduct.value,
          validator: (value) {
            return Validator.required(value, "Product Name can't be empty");
          },
        ),
      ],
    );
  }

  Widget _screenDeskripsi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextLabel(
          text: "Description",
          color: Utility.baseColor1,
        ),
        SizedBox(
          height: Utility.normal,
        ),
        TextFieldMain(
          controller: controller.description.value,
          validator: (value) {
            return Validator.required(value, "Description Name can't be empty");
          },
        ),
      ],
    );
  }

  Widget _screenPrice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextLabel(
          text: "Price",
          color: Utility.baseColor1,
        ),
        SizedBox(
          height: Utility.normal,
        ),
        TextFieldMain(
          controller: controller.price.value,
          keyboardType: TextInputType.number,
          isCurrencyWithDecimal: true,
          validator: (value) {
            return Validator.required(value, "Description Name can't be empty");
          },
        ),
      ],
    );
  }
}
