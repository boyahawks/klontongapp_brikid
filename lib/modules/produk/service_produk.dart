part of 'produk.dart';

class ProductService {
  static Future<dynamic> getAllDataProduct() async {
    dynamic resultData;
    try {
      var prosesApi = Api.connectionApi("get", "", "product");
      var getValue = await prosesApi;
      var response = jsonDecode(getValue.body);
      resultData = response;
    } catch (e) {
      UtilsAlert.showToast("Error : $e");
      resultData = null;
    }
    return resultData;
  }

  static Future<dynamic> saveProduct(
      int id,
      int category,
      String sku,
      String nameProduct,
      String description,
      String image,
      double harga) async {
    dynamic resultData;

    try {
      Map<String, dynamic> product = {
        "id": id,
        "categoryId": category,
        "sku": sku,
        "name": nameProduct,
        "description": description,
        "image": image,
        "harga": harga,
      };
      var prosesApi = Api.connectionApi("post", product, "product");
      var getValue = await prosesApi;
      var response = jsonDecode(getValue.body);
      resultData = response;
    } catch (e) {
      UtilsAlert.showToast("Error : $e");
      resultData = null;
    }
    return resultData;
  }
}
