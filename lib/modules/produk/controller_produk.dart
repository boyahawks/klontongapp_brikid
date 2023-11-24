part of "./produk.dart";

class ProdukController extends GetxController {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  var pencarian = TextEditingController().obs;
  var page = 12.obs;

  // FORM ADD PRODUCT
  RxInt idCategorySelected = 0.obs;
  RxString nameCategorySelected = "".obs;
  var sku = TextEditingController().obs;
  var nameProduct = TextEditingController().obs;
  var description = TextEditingController().obs;
  var price = TextEditingController().obs;

  RxList<ProductModel> listProductMaster = <ProductModel>[].obs;
  RxList<ProductModel> listProduct = <ProductModel>[].obs;
  RxList<CategoryModel> listCategory = <CategoryModel>[].obs;

  RxBool gridListView = false.obs;
  RxBool progress = false.obs;
  RxInt categorySelected = 0.obs;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  List<dynamic> dataDummyKategori = [
    {
      "id": 0,
      "category_name": "All",
    },
    {
      "id": 1,
      "category_name": "Cemilan",
    },
    {
      "id": 2,
      "category_name": "Elektronik",
    },
    {
      "id": 3,
      "category_name": "Pakaian",
    },
    {
      "id": 4,
      "category_name": "Kesehatan",
    },
    {
      "id": 5,
      "category_name": "Otomotif",
    }
  ];

  Future<void> init() async {
    progress.value = true;
    progress.refresh;
    getCategory();
  }

  void clearAll() {
    listProduct.clear();
    listProduct.refresh();
    page.value = 12;
    page.refresh();
  }

  void onLoading() async {
    await Future.delayed(const Duration(seconds: 1));
    page.value = page.value + 5;
    page.refresh();
    refreshController.loadComplete();
  }

  Future<void> getCategory() async {
    listCategory.clear();
    listCategory.refresh();
    for (var element in dataDummyKategori) {
      listCategory.add(CategoryModel.fromMap(element));
    }
    categorySelected.value = listCategory.first.id;
    categorySelected.refresh();
    getProduct();
  }

  Future<void> getProduct() async {
    listProductMaster.clear();
    listProductMaster.refresh();
    listProduct.clear();
    listProduct.refresh();
    dynamic prosesGetProduct = await ProductService.getAllDataProduct();
    if (prosesGetProduct.isEmpty) {
      UtilsAlert.showToast("Product not found");
    } else {
      for (var element in prosesGetProduct) {
        listProductMaster.add(ProductModel.fromMap(element));
      }
    }
    if (categorySelected.value == 0) {
      listProduct.value = listProductMaster;
    } else {
      listProduct.value = listProductMaster
          .where((product) => product.categoryId == categorySelected.value)
          .toList();
    }
    listProduct.sort((a, b) => b.idProduct.compareTo(a.idProduct));
    listProduct.refresh();
    progress.value = false;
    progress.refresh;
  }

  Future<void> pencarianProduct() async {
    listProduct.value = listProductMaster.where((master) {
      String nameProduct = master.name.toLowerCase();
      return nameProduct.contains(pencarian.value.text.toLowerCase());
    }).toList();
    listProduct.refresh();
  }

  Future<void> generateProduct() async {
    UtilsAlert.loadingSimpanData(
        context: Get.context!, text: "Loading Generate Product", dismiss: true);
    int loopGenerate = 10;
    int idGenerate = 1;
    int categoryGenerate = 1;
    String skuGenerate = "MHZVTK";
    String nameProductGenerate = "Product";
    String descriptionGenerate = "Description";
    String imageGenerate =
        "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b";
    double hargaGenerate = 1000.0;
    for (var i = 0; i < loopGenerate; i++) {
      dynamic progressSaveGenerate = await ProductService.saveProduct(
          idGenerate,
          categoryGenerate,
          "$skuGenerate $idGenerate",
          "$nameProductGenerate $idGenerate",
          descriptionGenerate,
          imageGenerate,
          hargaGenerate);
      print(progressSaveGenerate);
      idGenerate += 1;
      if (categoryGenerate == 5) {
        categoryGenerate = 1;
      } else {
        categoryGenerate += 1;
      }
      hargaGenerate += 1000.0;
    }
    Get.back();
    UtilsAlert.showToast("Generated product was successful");
    init();
  }

  void changeCategory(categoryId) {
    categorySelected.value = categoryId;
    categorySelected.refresh();
    if (categoryId == 0) {
      listProduct.value = listProductMaster;
    } else {
      listProduct.value = listProductMaster
          .where((product) => product.categoryId == categoryId)
          .toList();
    }
    listProduct.sort((a, b) => b.idProduct.compareTo(a.idProduct));
    listProduct.refresh();
  }

  void clearFormAddProduct() {
    idCategorySelected.value = 0;
    idCategorySelected.refresh();
    nameCategorySelected.value = "";
    nameCategorySelected.refresh();
    sku.value.text = "";
    nameProduct.value.text = "";
    description.value.text = "";
    price.value.text = "";
  }

  Future<void> saveProduct() async {
    UtilsAlert.loadingSimpanData(
        context: Get.context!, text: "Save Product...", dismiss: true);
    dynamic progresSaveProduct = await ProductService.saveProduct(
        listProductMaster.length + 1,
        idCategorySelected.value,
        sku.value.text,
        nameProduct.value.text,
        description.value.text,
        "",
        double.parse(price.value.text.replaceAll(".", "")));
    if (progresSaveProduct == null) {
      UtilsAlert.showToast("Failed to add product");
    } else {
      Get.back();
      Get.back();
      UtilsAlert.showToast("Successful addition of product");
      init();
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
    AppData.uuid = "";
    AppData.email = "";
    Routes.routeOff(type: "splash");
  }
}
