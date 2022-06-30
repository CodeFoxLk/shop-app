import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/net/end_points.dart';
import 'package:shop_app/screens/product_screen.dart';
import 'package:shop_app/utils/logger.dart';

import '../dynamiclink_controller.dart';

class ProductController extends GetxController {
  final _products = <Product>[].obs;
  final _selectedProduct = Rxn<Product>();
  final isProductsLoading = true.obs;
  final isProductLoading = true.obs;

  @override
  void onReady() {
    fethAllProducts();
    //for use of dynamic links
    final productId = Get.parameters["productId"];
    if(productId != null){
      fetchSingleProduct(productId: productId);
    }
    super.onReady();
  }

  List<Product> get products => _products;
  Product? get product => _selectedProduct.value;

 void navigateToProductScreen({required String productId}){
    Get.toNamed(ProductScreen.routeName);
    fetchSingleProduct(productId: productId);
  }

 void fetchSingleProduct({required String productId}) async {
    isProductLoading.value = true;
    Dio dio = Dio();
    try {
      final response = await dio.get(productUrl(productId), options: Options(responseType: ResponseType.json));
      if(response.statusCode == 200){
        _selectedProduct.value = Product.fromJson(response.data);
      }
      isProductLoading.value = false;
    } on DioError catch (e) {
      logger.e(e);
      isProductLoading.value = false;
    }
  }

  void fethAllProducts() async {
    logger.i("Feching all products");
    isProductsLoading.value = true;
    Dio dio = Dio();
    try {
      final response = await dio.get(productsUrl,  options: Options(responseType: ResponseType.json));
      if(response.statusCode == 200){
        final products = productsFromJson(response.data);
        _products.assignAll(products);
      }
      isProductsLoading.value = false;
    } on DioError catch (e) {
      logger.e(e);
      isProductsLoading.value = false;
    }
  }

  void createSharableLink({required Product? product}) async{
     if(product == null) return;
     final link = await DynamicLinkController.create(product);
     logger.i(link.shortUrl);
  }
}
