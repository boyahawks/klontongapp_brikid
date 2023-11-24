part of './produk.dart';

class Produk extends StatefulWidget {
  const Produk({Key? key}) : super(key: key);

  @override
  State<Produk> createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {
  var controller = Get.put(ProdukController());

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MainScaffold(
          type: "default",
          colorBackground: Utility.baseColor2,
          returnOnWillpop: false,
          backFunction: () => ButtonSheetWidget().validasiButtomSheet(
              "Logout",
              const TextLabel(
                  text: "Are you sure you are logging out of your account?"),
              "Logout",
              () => controller.logout()),
          colorSafeArea: Utility.baseColor2,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (controller.listProductMaster.length < 10) {
                controller.generateProduct();
              } else {
                controller.clearFormAddProduct();
                Routes.routeTo(type: "add_product");
              }
            },
            backgroundColor: Utility.maincolor1,
            child: const Icon(Iconsax.add_circle5),
          ),
          content: controller.progress.value
              ? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ShimmerWidget.shimmerOnProduct(Get.context!))
              : SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Utility.medium,
                      ),
                      _screenPencarian(),
                      SizedBox(
                        height: Utility.medium,
                      ),
                      _screenListCategory(),
                      SizedBox(
                        height: Utility.medium,
                      ),
                      Flexible(
                          child: SmartRefresher(
                        enablePullDown: true,
                        enablePullUp: true,
                        header:
                            MaterialClassicHeader(color: Utility.maincolor1),
                        onRefresh: () async {
                          controller.pencarian.value.text = "";
                          controller.progress.value = true;
                          controller.progress.refresh();
                          controller.clearAll();
                          controller.getProduct();
                          controller.refreshController.refreshCompleted();
                        },
                        onLoading: () async {
                          controller.onLoading();
                        },
                        controller: controller.refreshController,
                        child: controller.gridListView.value
                            ? _contentProductGrid()
                            : _contentProduct(),
                      ))
                    ],
                  ),
                )),
    );
  }

  Widget _screenPencarian() {
    return ExpandedView2Row(
        flexLeft: 80,
        flexRight: 20,
        widgetLeft: ExpandedView2Row(
            flexLeft: 80,
            flexRight: 20,
            widgetLeft: SearchApp(
              controller: controller.pencarian.value,
              title: "Search Product",
              isFilter: false,
              onChange: false,
              onTap: (value) {
                print(value);
              },
            ),
            widgetRight: InkWell(
              onTap: () => controller.pencarianProduct(),
              child: Container(
                decoration: BoxDecoration(
                    color: Utility.maincolor1,
                    borderRadius: Utility.borderStyle1),
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.search,
                    color: Utility.baseColor1,
                  ),
                ),
              ),
            )),
        widgetRight: InkWell(
          onTap: () =>
              controller.gridListView.value = !controller.gridListView.value,
          child: Container(
            margin: EdgeInsets.only(left: Utility.small),
            decoration: BoxDecoration(
                color: Utility.maincolor1, borderRadius: Utility.borderStyle1),
            child: Center(
              child: Icon(
                Icons.list,
                color: Utility.baseColor1,
              ),
            ),
          ),
        ));
  }

  Widget _screenListCategory() {
    return SizedBox(
      height: 35,
      child: ListView.builder(
          itemCount: controller.listCategory.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            int categoryId = controller.listCategory[index].id;
            String categoryName = controller.listCategory[index].categoryName;
            return InkWell(
              onTap: () => controller.changeCategory(categoryId),
              child: Container(
                margin:
                    EdgeInsets.only(left: Utility.small, right: Utility.small),
                padding: EdgeInsets.only(
                    left: Utility.normal, right: Utility.normal),
                decoration: BoxDecoration(
                  color: controller.categorySelected.value == categoryId
                      ? Utility.maincolor1
                      : Utility.baseColor1,
                  borderRadius: Utility.borderStyle1,
                ),
                child: Padding(
                  padding: EdgeInsets.all(Utility.small),
                  child: TextLabel(text: categoryName),
                ),
              ),
            );
          }),
    );
  }

  Widget _contentProductGrid() {
    return controller.listProduct.isEmpty
        ? _screenNodata()
        : GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(0),
            itemCount: controller.listProduct.length > controller.page.value
                ? controller.page.value
                : controller.listProduct.length,
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.70,
            ),
            itemBuilder: (context, index) {
              String productName = controller.listProduct[index].name;
              double producPrice = controller.listProduct[index].harga;
              return Container(
                margin: EdgeInsets.only(
                    right: Utility.small, bottom: Utility.small),
                decoration: BoxDecoration(
                  color: Utility.baseColor1,
                  borderRadius: Utility.borderStyle1,
                ),
                child: Padding(
                  padding: EdgeInsets.all(Utility.small),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/no-image.png',
                          height: 80,
                        ),
                      ),
                      SizedBox(
                        height: Utility.large,
                      ),
                      TextLabel(
                        text: productName,
                        weigh: FontWeight.bold,
                        align: TextAlign.center,
                      ),
                      SizedBox(
                        height: Utility.small,
                      ),
                      TextLabel(
                        text: "Rp${Utility.currencyFormat(producPrice, 0)}",
                        weigh: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              );
            });
  }

  Widget _contentProduct() {
    return controller.listProduct.isEmpty
        ? _screenNodata()
        : ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.listProduct.length > controller.page.value
                ? controller.page.value
                : controller.listProduct.length,
            itemBuilder: (context, index) {
              int categoryId = controller.listProduct[index].categoryId;
              String productName = controller.listProduct[index].name;
              double producPrice = controller.listProduct[index].harga;
              return InkWell(
                onTap: () {
                  CategoryModel? dataKategori = controller.listCategory
                      .firstWhereOrNull(
                          (category) => category.id == categoryId);
                  String nameCategory =
                      dataKategori != null ? dataKategori.categoryName : "";
                  ButtonSheetWidget().validasiButtomSheet(
                      "Detail Product",
                      _contentDetailProduct(
                          controller.listProduct[index], nameCategory),
                      "hidden",
                      () => null);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Utility.small,
                    ),
                    CardCustom(
                      colorBg: Utility.baseColor1,
                      colorBorder: Colors.transparent,
                      radiusBorder: Utility.borderStyle1,
                      widgetCardCustom: Padding(
                        padding: EdgeInsets.all(Utility.small),
                        child: ExpandedView2Row(
                            flexLeft: 30,
                            flexRight: 70,
                            widgetLeft: Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/no-image.png',
                                  height: 80,
                                )),
                            widgetRight: Padding(
                              padding: EdgeInsets.only(
                                  left: Utility.small, top: Utility.small),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextLabel(
                                    text: productName,
                                    weigh: FontWeight.bold,
                                  ),
                                  SizedBox(
                                    height: Utility.small,
                                  ),
                                  TextLabel(
                                    text:
                                        "Rp${Utility.currencyFormat(producPrice, 0)}",
                                    weigh: FontWeight.bold,
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }

  Widget _contentDetailProduct(ProductModel dataProduct, String nameCategory) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/no-image.png',
              height: 80,
            )),
        SizedBox(
          height: Utility.large,
        ),
        ExpandedView3Row(
            flex1: 25,
            flex2: 5,
            flex3: 70,
            widget1: const TextLabel(text: "Category"),
            widget2: const TextLabel(text: ":"),
            widget3: TextLabel(text: nameCategory)),
        SizedBox(
          height: Utility.small,
        ),
        ExpandedView3Row(
            flex1: 25,
            flex2: 5,
            flex3: 70,
            widget1: const TextLabel(text: "Name"),
            widget2: const TextLabel(text: ":"),
            widget3: TextLabel(text: dataProduct.name)),
        SizedBox(
          height: Utility.small,
        ),
        ExpandedView3Row(
            flex1: 25,
            flex2: 5,
            flex3: 70,
            widget1: const TextLabel(text: "Price"),
            widget2: const TextLabel(text: ":"),
            widget3: TextLabel(
                text: "Rp${Utility.currencyFormat(dataProduct.harga, 0)}")),
        SizedBox(
          height: Utility.small,
        ),
        ExpandedView3Row(
            flex1: 25,
            flex2: 5,
            flex3: 70,
            widget1: const TextLabel(text: "SKU"),
            widget2: const TextLabel(text: ":"),
            widget3: TextLabel(text: dataProduct.sku)),
        SizedBox(
          height: Utility.small,
        ),
        ExpandedView3Row(
            flex1: 25,
            flex2: 5,
            flex3: 70,
            widget1: const TextLabel(text: "Description"),
            widget2: const TextLabel(text: ":"),
            widget3: TextLabel(text: dataProduct.description)),
        SizedBox(
          height: Utility.small,
        ),
      ],
    );
  }

  Widget _screenNodata() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: double.maxFinite,
            height: 200,
            child: Lottie.asset(AssetsConstant.jsonLottieNoData)),
      ],
    );
  }
}
